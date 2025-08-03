    
document.addEventListener('DOMContentLoaded',async()=>{
   await getCart()
   
   
})



async function getCart(){
    try{
        let total=0;
        let numItems=0;
        let stock=0;
        const res= await   fetch("http://localhost:3000/cart")
        const cart= await res.json()
        const container=document.getElementById("main")
        container.innerHTML=``

        if(cart.length==0){
                container.innerHTML=`
                                    <div id="emptyCart">
                                        <p id="emptyCartText">The cart is empty!</p>
                                        <img id="emptyCartImage" src="../images/emptyCart.png">
                                        <a href="http://localhost:3000/products.html"><button id="btnAddCartItems">Add Items</button></a>

                                    </div>`
            return
        }
        const title=document.createElement("h3")
        title.id="cartTitle"
        title.innerHTML=`Shopping Cart`
        container.appendChild(title)
        const cartSection=document.createElement("div")
        cartSection.id="cartSection"
       
        cart.forEach(item=>{
            let numPerItem=1
            stock=parseInt(item.stock)-parseInt(item.quantity)
            const card=document.createElement("div")
            card.classList="item"
            card.innerHTML=`
                            
                            <div>
                                <a id="productLink" href="http://localhost:3000/product.html?id=${item.product_id}">
                                    <div class="itemDetails">
                                        <img src="${item.image}" id="itemImage" alt="item Image">
                                    </div>
                
                                    <div class="itemDetails itemDetails2">
                                        <h3>${item.productName}</h3>
                                        <p>${item.brand}</p>
                                    </div>
                                </a>
                            </div>

                            <div>
                                <div class="itemDetails2" id="itemDetails2">

                                    <h1 class="price">R${item.price}</h1>
                                    <p>Qty: <span class="cartQuantity">${item.quantity}</span><span><button class="btnQuantity btnQuantityAdd">+</button></span><span><button class="btnQuantity btnQuantityMinus">-</button></span></p>
                                    <p>Stock: <span class="cartStock">${stock}</span></p>
                                    <button data-id= "${item.product_id}" class="bin" ><img src="../images/bin.png" alt="remove"></button>

                                </div>
                            </div>

                            
                            `
            total+=(parseFloat(item.price)*item.quantity)
            numPerItem=numPerItem*item.quantity
            numItems+=numPerItem
            cartSection.appendChild(card)

            
        })
        const checkOutSection=document.createElement("div")
        checkOutSection.id="checkOutSection"
        checkOutSection.innerHTML=`
                                    <p>Cart Summary</p>
                                    <p>TOTAL(${numItems} items): <span id="total">R${total.toFixed(2)}</span></p>
                                    <button id="btnCheckOut">Check Out</button>
                    
                                    `
        const innerContainer=document.createElement("div")
        innerContainer.id="innerContainer"

        innerContainer.appendChild(cartSection)
        innerContainer.appendChild(checkOutSection)
        
        container.appendChild(innerContainer)

        
        await removeFromCart()
        await attachCartButtonEventListeners()

    }catch(err){
        console.error("failed to fetch cart",err)
    }
}


   

async function addToCart(product_id,quantity,price,image,size){
    const res=await fetch('http://localhost:3000/cart',{
        method:'POST',
        headers:{"Content-Type":"application/json"},
        body:JSON.stringify({product_id,quantity,price,image,size})
    })
    const data=await res.json()
    console.log(data.message || data.error)
}

async function removeFromCart(){
   
        const deleteButtons=document.querySelectorAll(".bin")

        deleteButtons.forEach(button=>{

            button.addEventListener("click",()=>{
                const card=button.closest('.item')
                const product_id=parseInt(button.dataset.id)
            
                card.style.transform=`scale(0.5)`
                card.style.opacity=0
               
            setTimeout(async ()=>{
                    
                    await deleteCard(product_id)
                    
          
                    card.remove()
                    await getCart()

            },500)

            })
            
        })
       
    
}


async function deleteCard(product_id){
     try{
        const res=await fetch("http://localhost:3000/cart",{
        method:"delete",
        headers:{"Content-Type":"application/json"},
        body:JSON.stringify({product_id})
        })
        const data=await res.json()
         console.log(data.message || data.error)
    }catch(err){
        console.error("couldn't remove cart",err)
    }   

}

async function updateCart(product_id,newQuantity){
   try{
    const res= await fetch(`http://localhost:3000/cart`,{
        method:`PUT`,
        headers:{"Content-Type":"application/json"},
        body:JSON.stringify({product_id,newQuantity})
    })

     const data=await res.json()

     console.log(data.message || data.error)
   }catch(err){
    console.log("couldn't update cart quantity")
   }

}

async function attachCartButtonEventListeners(){
    const btnAdd=document.querySelectorAll(".btnQuantityAdd")
    const btnMinus=document.querySelectorAll(".btnQuantityMinus")

    btnAdd.forEach(button=>{
        button.addEventListener("click",async ()=>{
            const card=button.closest(".item")
            const product_id=parseInt(card.querySelector(".bin").dataset.id)
            const quantity=parseInt(card.querySelector(".cartQuantity").textContent)
            const stock=parseInt(card.querySelector(".cartStock").textContent)
            const newQuantity=quantity+1

            if(stock<1) return

            await updateCart(product_id,newQuantity)
            await getCart()
        })
    })

    btnMinus.forEach(button=>{
        button.addEventListener("click",async ()=>{
            const card=button.closest(".item")
            const product_id=parseInt(card.querySelector(".bin").dataset.id)
            const quantity=parseInt(card.querySelector(".cartQuantity").textContent)
            const stock=parseInt(card.querySelector(".cartStock").textContent)
            const newQuantity=quantity-1

            if(newQuantity<1) return

            await updateCart(product_id,newQuantity)
            await getCart()
        })
    })
}