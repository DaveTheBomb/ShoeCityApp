


let myProducts=[];
const container=document.getElementById("main");
const params=new URLSearchParams(window.location.search)
const id=params.get('id')
let myProduct="";
let cart=``;
let wishlist=``;
let cartCount=0,wishlistCount=0;

document.addEventListener("DOMContentLoaded",()=>{
    setTimeout(() => {
        cart=document.getElementById("cart2");
        wishlist=document.getElementById("wishlist");
        fetch(`http://localhost:3000/product?id=${id}`)
            .then(res=>res.json())
                .then(data=>{
                    myProduct=data;
                   

                    
                    loadProduct();
                    fetchRelatedProducts()
                    
                })
    }, 1000);
   

            

})

function fetchRelatedProducts() {
  fetch(`http://localhost:3000/related-products?brand=${myProduct.brand}&id=${myProduct.id}&category=${myProduct.category}`)
    .then(res => res.json())
    .then(related => {
      renderRelated(related);
    });
}

function renderRelated(relatedProducts) {
  const relatedContainer = document.getElementById("related");
  relatedContainer.innerHTML = "";
  relatedProducts.forEach(prod => {
    const card = document.createElement("div");
    card.className = "relatedImages";
    card.innerHTML = `
      <a href="product.html?id=${prod.id}">
        <img src="${prod.images[0]}" alt="${prod.name}">
       <h3 class="relatedImageName" style="text-align:center">${prod.name}</h3>
      </a>
      
    `;
    relatedContainer.appendChild(card);
  });
}



function loadProduct(){
    container.innerHTML="";
     let sizeButtons=``;
    let colorButtons=``;
    let productDescription=``;
    let productImages=``;
   
    
    for(i=0;i<myProduct.sizes.length;i++){
        sizeButtons+=`<button class="sizeButtons">${myProduct.sizes[i]}</button>`
    }

   
        colorButtons=`<button>${myProduct.color}</button>`
    

   

    for(i=0;i<myProduct.images.length;i++){
        productImages+=`<img src="${myProduct.images[i]}">`
    }

    const card=document.createElement("div");
    card.id="product";
    card.innerHTML=`
        <div id="prod">
            <div id="productDetails">
                <div class="productDetails">
                    <div id="productImage">
                        <img src="${myProduct.images[0]}" alt="">
                    </div>
                    <div id="lowerImages">
                        ${productImages}
                    </div>
                    <h3>Product Description:</h3>
                    <ul>
                    ${productDescription}
                    </ul>
                    <h3>You may also like:</h3>
                
                </div>

                <div class="productDetails">
                    <h3>${myProduct.name}</h3>
                    <p>${myProduct.brand.toUpperCase()}</p>
                    <p id="price">R ${myProduct.prices[0]}</p>
                    <p>Sizes:</p>
                    <div class="buttons">${sizeButtons}</div>
                    <p>Colors:</p>
                    <div class="buttons">${colorButtons}</div>
                    <p>Quantity:<p>
                    <div id="quantity">
                        
                        <div class="btnQuantity" id="btnQuantityLeft">&lt;</div>
                        <div class="btnQuantity" id="btnQuantityCenter">1</div>
                        <div class="btnQuantity" id="btnQuantityRight">&gt;</div>
                    </div>
                    <button class="buttons2" id="btnCart">Add to Cart</button>
                    <button class="buttons2" id="btnWishlist">Add to Wishlist</button>
            
                </div>
                
            
            </div>

            <div id="related">
                
            </div>
        </div>
       
        
    `

    container.appendChild(card);


    let sizeButtonsHTML=document.querySelectorAll(".sizeButtons");
    let productPriceHTML=document.getElementById("price");
    let sizeIndex=0
  
    sizeButtonsHTML[0].style.backgroundColor="rgb(231, 77, 77)";
    sizeButtonsHTML.forEach((button,index) =>{
        
        button.addEventListener("click",()=>{
            sizeIndex=index
            productPriceHTML.innerHTML=`R ${myProduct.prices[index]}`;
            sizeButtonsHTML.forEach(button=>{
                 button.style.backgroundColor="royalblue";
            })
            button.style.backgroundColor="rgb(231, 77, 77)";
    })
   
})

    let mainImage=document.querySelector("#productImage img");
    let lowerImages=document.querySelectorAll(".lowerImages");
    lowerImages.forEach(image =>{
        image.addEventListener("click", ()=>{
            mainImage.src=image.src;
    })
    })
   

let btnQuantityLeft=document.getElementById("btnQuantityLeft");
let btnQuantityRight=document.getElementById("btnQuantityRight");
let btnQuantityCenter=document.getElementById("btnQuantityCenter");
let quantityCount=1;

btnQuantityLeft.addEventListener("click",()=>{
    if(quantityCount>1){
        quantityCount--;
        btnQuantityCenter.innerHTML=quantityCount;
        updateQuantityButtons()
    }
})

btnQuantityRight.addEventListener("click",()=>{
    if(quantityCount<myProduct.stock){
        quantityCount++;
        btnQuantityCenter.innerHTML=quantityCount;
        updateQuantityButtons()

    }
})


function updateQuantityButtons(){
    if(quantityCount==1){
        btnQuantityLeft.disabled=true;
        btnQuantityLeft.style.opacity="0.3";
    }else {
        btnQuantityLeft.disabled=false;
        btnQuantityLeft.style.opacity="1";
    }

    if(quantityCount==myProduct.stock){
        btnQuantityRight.disabled=true;
          btnQuantityRight.style.opacity="0.3";
    } else{
         btnQuantityRight.disabled=false;
        btnQuantityRight.style.opacity="1";
    }
}

let btnCart=document.getElementById("btnCart");
let btnWishlist=document.getElementById("btnWishlist");

btnCart.addEventListener("click",async ()=>{
    const res=await fetch('http://localhost:3000/cart',{
        method:'POST',
        headers:{"Content-Type":"application/json"},
        body:JSON.stringify({product_id:myProduct.id,quantity:parseInt(btnQuantityCenter.textContent),
            price:myProduct.prices[sizeIndex],image:myProduct.images[0],size:myProduct.sizes[0]})
    })
    const data=await res.json()
    console.log(data.message || data.error)

    btnCart.style.backgroundColor="rgb(66, 173, 66)";
    btnCart.style.color="white";
    btnCart.style.animation="pop 0.5s ease-in-out";
    btnCart.innerHTML=`Added to Cart &#10004;`;
    cartCount+=quantityCount;
    cart.innerHTML=cartCount;
    btnCart.disbled=true;
})

btnWishlist.addEventListener("click",async()=>{
     const res=await fetch('http://localhost:3000/wishlist',{
        method:"POST",
        headers:{"Content-Type":"application/json"},
        body:JSON.stringify({product_id:myProduct.id,price:myProduct.prices[sizeIndex],image:myProduct.images[0],size:myProduct.sizes[0]})
    })

    const data =await res.json()
    console.log(data.message || data.error)

    btnWishlist.style.backgroundColor="rgb(66, 173, 66)";
    btnWishlist.style.color="white";
    btnWishlist.style.animation="pop 0.5s ease-in-out";
    btnWishlist.innerHTML=`Added to Wishlist &#10004;`;
    wishlistCount++;
    wishlist.innerHTML=wishlistCount;
    btnWishlist.disabled=true;
})


   
}

