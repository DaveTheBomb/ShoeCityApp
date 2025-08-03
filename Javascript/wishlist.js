async function addToWishlist(product_id,price,image,size){
    const res=fetch('/wishlist',{
        method:"post",
        headers:{"Content-Type":"application/json"},
        body:JSON.stringify({product_id,price,image,size})
    })

    const data =res.json()
    alert(data.message || data.error)
}

async function removeFromWishlist(product_id){
    const res=fetch('/wishlist',{
        method:"delete",
        headers:{"Content-Type":"application/json"},
        body:{product_id}
    })
    const data=res.json()
    alert(data.message || data.error)
}

async function loadWishlist(){
    const res=fetch("/wishlist")
    const data=res.json()

}