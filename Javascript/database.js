import mysql from 'mysql2'
import dotenv from 'dotenv'
import fs from 'fs/promises'

dotenv.config();

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  port: Number(process.env.DB_PORT),  
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
}).promise();


const data=await fs.readFile("../data/products.json","utf-8");
const products=JSON.parse(data);

async function createProducts(products){
    try{
       

        for(let i=0;i<products.length;i++){
        
            let name=products[i].name;
            let brand=products[i].brand;
        
            let category=products[i].category;
            let color=products[i].colors[0];
            let stock=products[i].stock;

            console.log(" *********************** products insertions");

            await pool.query(`insert into products (productName,category,color,stock,brand)
            values(?,?,?,?,?)`,[name,category,color,stock,brand])
        }
        await createImages(products)
        await createSizes(products)
        console.log("products inserted successfully")
    }catch(err){
        console.error("there was an error",err);
    }
          
    
}

async function createImages(products){
    try{
        for(let i=0;i<products.length;i++){
            for(let y=0;y<products[i].images.length;y++){
                let image=products[i].images[y]
                let productID=products[i].id
                await pool.query(`insert into product_images (product_id,image)
                    values(?,?)`,[productID,image])
            }
        }
        console.log("images successfuly inserted")
    }catch(err){
        console.error("failed to insert images",err);
    }
}

async function createSizes(products){
    try{
        for(let i=0;i<products.length;i++){
            for(let y=0;y<products[i].sizes.length;y++){
                let productID=products[i].id
                let size=products[i].sizes[y]
                let price=products[i].price[y]
                let stock=products[i].stockPerSize[y]
                await pool.query(`insert into sizes (product_id,price,size,stock)
                    values(?,?,?,?)`,[productID,price,size,stock])
            }
        }
        console.log("succeesfully loaded sizes")
    }catch(err){
        console.error("failed to load sizes",err)
    }
}

export async function getProducts(perPage,page,brandID,random,category){
    let offset=(page-1)*perPage
    let sql1
    let params
    if(brandID){
        sql1=`select id from products where products.brand_id=? limit ? offset ?`
        params=[brandID,perPage,offset]
       
    }else if(random===true){

        sql1=`select id from products order by rand() limit ? offset ?`
        params=[perPage,offset]
       
    }else if(!(category==="undefined")){
        sql1=`select id from products where products.category=? limit ? offset ?`
        params=[category,perPage,offset]
       
    }else{
        sql1=`select id from products limit ? offset ?`
        params=[perPage,offset]
    }

    let sql2=`select products.id,
                        products.productName,
                        products.brand,
                        products.category,
                        products.stock,
                        product_images.image,
                        sizes.price,
                        brands.brandImage
                        
                        
                    from products 
                        inner join product_images on products.id=product_images.product_id
                        
                        inner join sizes on product_images.product_id=sizes.product_id
                        inner join brands on products.brand_id=brands.id
                        
                    where products.id in (?)
                    ORDER BY products.id`


    const [idRows]= await pool.query(sql1,params)
    const ids=idRows.map(r=> r.id)

    if(ids.length==0) return []
    const [rows] =await pool.query(sql2,[ids]);

    const productMap=new Map()

    for(const row of rows){
        if(!productMap.has(row.id)){
            productMap.set(row.id,{
                id:row.id,
                name:row.productName,
                brand:row.brand,
                brandImage:row.brandImage,
                category:row.category,
                color:row.color,
                stock:row.stock,
                images:[],
                prices:[],
                sizes:[],
                sizeStock:[]
            })
        }

        const product=productMap.get(row.id)

        if(row.image && !product.images.includes(row.image)){
            product.images.push(row.image)
        }

        if(row.price && !product.prices.includes(row.price)){
            product.prices.push(row.price)
        }
    }
   return Array.from(productMap.values())
}


export async function getProduct(id){
    const [rows]= await pool.query(`
                                    select products.id,
                                        products.productName,
                                        products.category,
                                        products.color,
                                        products.stock,
                                        product_images.image,
                                        sizes.price,
                                        sizes.size,
                                        sizes.stock as sizeStock,
                                        brands.brandImage,
                                        brands.brandName
                                    from products 
                                        inner join product_images on products.id=product_images.product_id
                                        
                                        inner join sizes on product_images.product_id=sizes.product_id
                                        inner join brands on products.brand_id=brands.id
                                    where products.id = ?
                                    order by products.id
                                    `,[id])

        if(rows.length==0) return null
        const product={
            id:rows[0].id,
            name:rows[0].productName,
            brand:rows[0].brandName,
            brandImage:rows[0].brandImage,
            category:rows[0].category,
            color:rows[0].color,
            stock:rows[0].stock,
            images:[],
            prices:[],
            sizes:[],
            sizeStock:[]
        }

        for(const row of rows){
            if(row.image && !product.images.includes(row.image)){
                product.images.push(row.image)
            }

            if(row.size && !product.sizes.includes(row.size)){
                product.sizes.push(row.size)
                product.sizeStock.push(row.sizeStock)
                product.prices.push(row.price)
            

            }
        }

     
            
        
        
        

        return product
}

export async function getRelatedProducts(brand,id,category){
     const [idRows]= await pool.query(`select 
                                        id from products
                                    WHERE 
                                        products.brand=? and products.id!=? and products.category=? limit 4`,[brand,id,category])
     let ids=idRows.map(r=> r.id)

     if(ids.length<4){
        const shortfall=4-ids.length;
        
        const [fillRows]= await pool.query(`select 
                                                id from products
                                            WHERE 
                                                products.brand!=? and products.id!=? and products.category=? limit ?`,[brand,id,category,shortfall])
        ids=ids.concat(fillRows.map(r=> r.id))
     }
     const [rows] = await pool.query(
                                    `SELECT products.id, 
                                        products.productName, 
                                        product_images.image
                                    FROM products 
                                        JOIN product_images ON products.id = product_images.product_id
                                    WHERE products.id in (?)
                                       
                                    ORDER BY RAND()  
                                        `,
                                    [ids]
                                );

  // Group images per product (optional)
  const map = new Map();
  for (const row of rows) {
    if (!map.has(row.id)) {
      map.set(row.id, {
        id: row.id,
        name: row.productName,
        images: [],
      });
      const prod = map.get(row.id);
    prod.images.push(row.image);
    }
    
  }

  return Array.from(map.values())
}

export async function numProducts(brandID,category){
    let sql=`select count(*) as count from products`
    const params=[]

    if(brandID){
        sql+=` where products.brandID=?`
        params.push(brandID)
    }
    
    if(category && !(category=="undefined")){
        if(brandID){
            sql+=` and products.category=?`
        }else{
            sql+=` where products.category=?`
        }
        params.push(category)
    }
    const [numProducts]= await pool.query(sql,params)
    const count=numProducts[0].count
    return count
}


export async function createBrandIDs(){
   try{
        const [rows]=await pool.query(` update products     
                                    join brands on products.brand = brands.brandName
                                    set products.brand_id=brands.id`)
        console.log('brand IDs created')
   }catch(err){
        console.log('failed to create brand ids',err)
   }
}

export async function getBrandsByCategory(){
    const [rows]=await pool.query(`select DISTINCT
                                        brands.id, brands.brandImage,products.category
                                   from 
                                        brands join products on brands.brandName = products.brand`)

    const brandsByCategory={}

    for(const row of rows){
        if(!brandsByCategory[row.category]){
            brandsByCategory[row.category]=[]
        }

        if(!brandsByCategory[row.category].some(b=>b.id===row.id)){
            brandsByCategory[row.category].push({
                 brandID:row.id,
                 brandImage:row.brandImage
            })
        }   
    }

    return brandsByCategory
}

export async function registerUser(email,password){
    const [rows]=await pool.query(`select id from users where email=?`,[email])

    if(rows.length>0){
        throw new Error("User already exists")
    }
    
    await pool.query(`insert into users (email,hashed_password) values(?,?)`,[email,password])
}

export async function getUserByEmail(email){
    const [rows] =await pool.query(`select * from users where email=?`,[email])
    return rows[0]
}

export async function getWishlistItems(userId){
    const [rows] = await pool.query(`select 
                                        wishlist.product_id,wishlist.size,wishlist.image,wishlist.price, 
                                        products.productName, products.stock
                                    from 
                                        wishlist join products on wishlist.product_id=products.id
                                    where
                                        wishlist.user_id=?
                                    `,[userId])

        return rows
}

export async function addToWishlist(userID,product_id,price,image,size){
    await pool.query(`insert ignore 
                        into wishlist (user_id,product_id,price,image,size) 
                      values(?,?,?,?)
                      `,[userID,product_id,price,image,size])
}

export async function removeFromWishlist(userID,product_id){
    await pool.query(`delete from wishlist where wishlist.product_id=? and wishlist.user_id=?`,[product_id,userID])
}

export async function getCartItems(userID){
    const [rows]=await pool.query(`
                                    select 
                                        cart.product_id,cart.image,cart.price,
                                        cart.size,cart.quantity,products.brand,products.productName,products.stock
                                    from
                                        cart join products on cart.product_id=products.id 
                                    where
                                        cart.user_id=?
                                        `,[userID])
    return rows
}

export async function addToCart(userID,product_id,quantity,price,image,size){
    await pool.query(`
                        insert into cart (product_id,user_id,quantity,price,image,size) values(?,?,?,?,?,?)
                        on duplicate key update quantity=?
                    `,[product_id,userID,quantity,price,image,size,quantity])
}

export async function removeFromCart(userID,product_id){
        await pool.query(`  
                        delete from cart where cart.user_id=? and cart.product_id=?
                        `,[userID,product_id])
}

export async function updateCart(user_id,product_id,newQuantity){
    await pool.query(`  update 
                            cart
                        set
                           cart.quantity=?
                        where
                            cart.product_id=? and cart.user_id=?
                        `,[newQuantity,product_id,user_id])
}
// async function createBrands(){
//     try{
//          await pool.query(`insert into brands (brandName,brandImage)
//                     values
//                     ("criss-coss","./images/brands/criss-coss-logo.svg"),
//                     ("freestyle","./images/brands/freestyle-logo.svg"),
//                     ("giovanni","./images/brands/giovanni-logo.svg"),
//                     ("grasshoppers","./images/brands/grasshoppers-logo.svg"),
//                     ("hi-tec","./images/brands/hi-tec-logo.svg"),
//                     ("mancini","./images/brands/mancini-logo.svg"),
//                     ("pierre-cardin","./images/brands/pierre-cardin-logo.svg"),
//                     ("pitbull","./images/brands/pitbull-logo.svg"),
//                     ("smart-steps","./images/brands/smart-steps-logo.svg"),
//                     ("sugar-spice","./images/brands/sugar-spice-logo.svg"),
//                     ("terraPOD","./images/brands/terraPOD-logo.svg"),
//                     ("tommy","./images/brands/tommy-logo.svg"),
//                     ("unreal","./images/brands/unreal-logo.svg"),
//                     ("ipanema","./images/brands/ipanema-logo.svg")
//                     `)

//         console.log("suxxessfully loaded brands")
//     }catch(err){
//         console.log("couldn't load brands",err)
//     }
   
// }

//  let result=await createBrandIDs();
//  console.log(result);