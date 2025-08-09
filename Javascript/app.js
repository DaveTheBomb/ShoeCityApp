import express from 'express'
import cors from 'cors'
import path from 'path'
import session from 'express-session'
import bcrypt from 'bcrypt'
import {getProducts,numProducts,getProduct,
  getRelatedProducts,getBrandsByCategory,
  getUserByEmail,registerUser,
  getWishlistItems,addToWishlist,removeFromWishlist,
  getCartItems,addToCart,removeFromCart,
  updateCart} from './database.js'

const app=express()
const __dirname=path.resolve()
app.use(cors())
app.use(express.static('..'))
app.use(express.json())
app.use(express.urlencoded({extended:true}))

app.use((err,req,res,next)=>{
    console.error(err.stack)
    res.status(500).send("something went wrong")
})

app.use(session({
    secret:'superSecretKey',
    resave:false,
    saveUninitialized:false,
    cookie:{
        secure:false,
        maxAge:1000*60*60*24
    }

}))

app.post('/register', async(req,res)=>{
    const {email,password}=req.body
    const hashedPassword=await bcrypt.hash(password,10)
   

    try{
       await registerUser(email,hashedPassword)
       res.json({message:"user successfully registered"})
    }catch(err){
      console.log('there was an error ',err)
      res.status(400).json({error:"email already exists!"})

    }
})

app.post('/login',async(req,res)=>{
    const {email,password}=req.body
    const user=await getUserByEmail(email)
    if(!user){
      return res.status(400).json({error:"incorrect email or password!"})
    }

    const match=await bcrypt.compare(password,user.hashed_password)

    if(!match){
      return res.status(400).json({error:"incorrect email or password!"})
    }

    req.session.userID=user.id
    res.json({message:"successfully logged in!"})
})


app.get('/wishlist',async (req,res)=>{
    if(!req.session.userID){
      return res.status(401).json({error:"not logged in!"})
    }
    const items=await getWishlistItems(req.session.userID)
    res.json(items)
})

app.post('/wishlist',async(req,res)=>{
    if(!req.session.userID){
     return res.status(401).json({error:"not logged in!"})
    }
    const {product_id,price,image,size}=req.body
    await addToWishlist(req.session.userID,product_id,price,image,size)
    res.json({message:"item added to wishlist"})
})

app.delete('/wishlist',async(req,res)=>{
    if(!req.session.userID){
       return res.status(401).json({error:"not logged in!"})
    }
        const {product_id}=req.body
        await removeFromWishlist(req.session.userID,product_id)
        res.json({message:"item removed from wishlist"})

    
})

app.get('/cart',async(req,res)=>{
    if(!req.session.userID){
       return res.status(401).json({error:"not logged in!"})
    }
    const items=await getCartItems(req.session.userID)
    res.json(items)
})

app.post('/cart',async(req,res)=>{
    if(!req.session.userID){
        return res.status(401).json({error:"not logged in!"})
    }
    const {product_id,quantity,price,image,size}=req.body
    await addToCart(req.session.userID,product_id,quantity,price,image,size)
    res.json({message:"item added to cart"})
})

app.delete("/cart",async(req,res)=>{
    if(!req.session.userID){
        return res.status(401).json({error:"not logged in!"})
    }

    const {product_id}=req.body
    await removeFromCart(req.session.userID,product_id)
    res.json({message:"item removed from cart"})
})

app.put("/cart",async(req,res)=>{
  if(!req.session.userID){
    return res.status(401).json({error:"not logged in!"})
  }

  const {product_id,newQuantity}=req.body
  await updateCart(req.session.userID,product_id,newQuantity)
  res.json({message:"cart updated"})
})

app.get("/products", async (req,res)=>{
    const page=parseInt(req.query.page) || 1
    const perPage=parseInt(req.query.perPage) || 25
    const brandID=parseInt(req.query.brand) || undefined
    const random=req.query.random==="true"|| false
    const category=req.query.category || "undefined"
    const products=await getProducts(perPage,page,brandID,random,category)
    const total=await numProducts(brandID,category)
    res.json({products,total})

})

app.get("/product", async (req,res)=>{
    const id=parseInt(req.query.id)
    const product= await getProduct(id)
    res.json(product)
})

app.get("/related-products", async (req, res) => {
  const brand = req.query.brand;
  const id = parseInt(req.query.id);
  const category=req.query.category

    const relatedProducts=await getRelatedProducts(brand,id,category)

  res.json(relatedProducts);
});


app.get("/brands-by-category", async(req,res)=>{
  const brands=await getBrandsByCategory()
  res.json(brands)
})

app.listen(3000,()=>{
    console.log("running on port 3000")
})