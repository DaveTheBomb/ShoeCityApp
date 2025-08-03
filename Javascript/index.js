let products=[];
let currentPage=1
let perPage=4
let random=true;
document.addEventListener("DOMContentLoaded", ()=>{
    fetch(`http://localhost:3000/products?page=${currentPage}&perPage=${perPage}&random=${random}`)
        .then( res=>res.json())
            .then(data=>{
                products=data.products;
                loadBanner();
                startBannerSlider();
            })
    loadGallery();
   

})

function loadGallery(){
  let container=document.querySelector(".galleryContainer");
  
  const galleryDimensions={w:["w2","w2","w1","w1","w2"],h:["h8","h4","h4","h4","h4"]}
  container.innerHTML="";


  for(i=0;i<galleryDimensions["w"].length;i++){
    container.innerHTML+=`
                    <div class="innerGalleryContainer ${galleryDimensions.w[i]} ${galleryDimensions.h[i]}">
                        <div class="galleryItem">
                            <div class="image">
                                <img src="./images/model${i+1}.webp">
                            </div>
                            <a href="#">
                                <div class="circle">
                                    <div class="innerCircle" id="innerCircle${i}"></div>
                                    <div class="outerCircle" id="outerCircle${i}"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                `
  }

}

function loadBanner(){
    
    let bannerWrapper=document.getElementById("bannerWrapper");
   
    bannerWrapper.innerHTML=``;

    for(let i=0;i<products.length;i++){
        bannerWrapper.innerHTML+=`
                            <div class="bannerItem">
                            <img src="${products[i].images[0]}" alt="" width=60% height="100%">
                            <span class="bannerText">Best Deals!</span>
                            <a href="product.html?id=${products[i].id}">
                                <button class="shopButton">Shop Shoes</button>
                            </a>
                            </div>
                            `
    }
    
    
        
    
}