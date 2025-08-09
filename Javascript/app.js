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


const data = await fs.readFile("../data/products.json", "utf-8");
const products = JSON.parse(data);

async function createProducts(products){
    try{
        for(let i=0; i<products.length; i++){
            let name = products[i].name;
            let brand = products[i].brand;
            let category = products[i].category;
            let color = products[i].colors[0];
            let stock = products[i].stock;
            await pool.query(
              `insert into products (productName,category,color,stock,brand)
               values(?,?,?,?,?)`, [name, category, color, stock, brand]
            );
        }
        await createImages(products);
        await createSizes(products);
        console.log("products inserted successfully");
    } catch(err){
        console.error("there was an error in createProducts:", err);
        throw err;
    }
}

async function createImages(products){
    try{
        for(let i=0; i<products.length; i++){
            for(let y=0; y<products[i].images.length; y++){
                let image = products[i].images[y];
                let productID = products[i].id;
                await pool.query(
                  `insert into product_images (product_id,image) values(?,?)`,
                  [productID, image]
                );
            }
        }
        console.log("images successfully inserted");
    } catch(err){
        console.error("failed to insert images:", err);
        throw err;
    }
}

async function createSizes(products){
    try{
        for(let i=0; i<products.length; i++){
            for(let y=0; y<products[i].sizes.length; y++){
                let productID = products[i].id;
                let size = products[i].sizes[y];
                let price = products[i].price[y];
                let stock = products[i].stockPerSize[y];
                await pool.query(
                  `insert into sizes (product_id,price,size,stock) values(?,?,?,?)`,
                  [productID, price, size, stock]
                );
            }
        }
        console.log("successfully loaded sizes");
    } catch(err){
        console.error("failed to load sizes:", err);
        throw err;
    }
}

export async function getProducts(perPage, page, brandID, random, category){
    let offset = (page - 1) * perPage;
    let sql1;
    let params;

    if(brandID){
        sql1 = `select id from products where products.brand_id=? limit ? offset ?`;
        params = [brandID, perPage, offset];
    } else if(random === true){
        sql1 = `select id from products order by rand() limit ? offset ?`;
        params = [perPage, offset];
    } else if(!(category === "undefined")){
        sql1 = `select id from products where products.category=? limit ? offset ?`;
        params = [category, perPage, offset];
    } else {
        sql1 = `select id from products limit ? offset ?`;
        params = [perPage, offset];
    }

    // First get product IDs
    const [idRows] = await pool.query(sql1, params);
    const ids = idRows.map(r => r.id);

    if(ids.length === 0) return [];

    // Build placeholders for the IN clause dynamically
    const placeholders = ids.map(() => '?').join(',');

    const sql2 = `
        select products.id,
               products.productName,
               products.brand,
               products.category,
               products.stock,
               product_images.image,
               sizes.price,
               brands.brandImage
        from products
          inner join product_images on products.id = product_images.product_id
          inner join sizes on product_images.product_id = sizes.product_id
          inner join brands on products.brand_id = brands.id
        where products.id in (${placeholders})
        ORDER BY products.id
    `;

    // Pass ids array directly as parameters to match placeholders
    const [rows] = await pool.query(sql2, ids);

    const productMap = new Map();

    for(const row of rows){
        if(!productMap.has(row.id)){
            productMap.set(row.id, {
                id: row.id,
                name: row.productName,
                brand: row.brand,
                brandImage: row.brandImage,
                category: row.category,
                color: row.color,
                stock: row.stock,
                images: [],
                prices: [],
                sizes: [],
                sizeStock: []
            });
        }

        const product = productMap.get(row.id);

        if(row.image && !product.images.includes(row.image)){
            product.images.push(row.image);
        }

        if(row.price && !product.prices.includes(row.price)){
            product.prices.push(row.price);
        }
    }

    return Array.from(productMap.values());
}

// ... The rest of your functions remain unchanged ...

// For brevity, you can keep all other exported functions as they were,
// just remember to add `throw err;` in catch blocks if you want errors to propagate.

export async function getBrandsByCategory(){
    try {
        const [rows] = await pool.query(`
            select DISTINCT
                brands.id, brands.brandImage, products.category
            from brands
            join products on brands.brandName = products.brand
        `);

        const brandsByCategory = {};

        for(const row of rows){
            if(!brandsByCategory[row.category]){
                brandsByCategory[row.category] = [];
            }
            if(!brandsByCategory[row.category].some(b => b.id === row.id)){
                brandsByCategory[row.category].push({
                    brandID: row.id,
                    brandImage: row.brandImage
                });
            }
        }

        return brandsByCategory;
    } catch(err) {
        console.error("Error in getBrandsByCategory:", err);
        throw err;
    }
}

// (Make sure all your other async functions also propagate errors with throw if you want them caught properly)

app.listen(3000,()=>{
    console.log("running on port 3000")
})