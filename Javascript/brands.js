

let brands={};
let numItems=0;
const btnRight2=document.getElementById("rightBrandButton");
const btnLeft2=document.getElementById("leftBrandButton");
let currentCount=0;
const brandWrapper=document.getElementById("brandWrapper");
const brand=document.querySelectorAll(".brandCategory");



document.addEventListener("DOMContentLoaded",()=>{

     fetch("http://localhost:3000/brands-by-category")
        .then(res=> res.json())
            .then(data=>{
                brands=data;

                
               
        
                numItems=Math.ceil(brands["women"].length/4);
  
                updateBrandSlider("women");


                brand.forEach(button =>{
                    button.addEventListener("click", ()=>{
                        
                        let categoryName=button.textContent;
                        numItems=Math.ceil(brands[categoryName].length/4);
                        brand.forEach(button =>{
                            button.style.backgroundColor="royalblue";
                        })

                        button.style.backgroundColor="red";
                        currentCount=0;
                        updateBrandSlider(categoryName);
                        updateBrandWrapper();
                        updateBrandButtons();
                    
                    });
                })
    
    
});


    function updateBrandSlider(categoryName){
          
        brandWrapper.innerHTML="";

        brands[categoryName].forEach((brand)=>{
            const link= document.createElement("a");
            link.classList.add("brandWrapperItems");
            link.href=`products.html?brand=${brand.brandID}`;
            const img=document.createElement("img");
            img.src=brand.brandImage;
           
            link.appendChild(img);
            brandWrapper.appendChild(link);
        })
    }



    function updateBrandWrapper(){
        const percentage=-40*currentCount;
        brandWrapper.style.transform=`translateX(${percentage}%)`;
        updateBrandButtons();

    }

    function updateBrandButtons(){
        if(currentCount==numItems-1){
            btnRight2.disabled=true;
            btnRight2.style.opacity=0.3;
        }else{
            btnRight2.disabled=false;
            btnRight2.style.opacity=0.5;
        }

        if(currentCount==0){
            btnLeft2.disabled=true;
            btnLeft2.style.opacity=0.3;
        }else{
            btnLeft2.disabled=false;
            btnLeft2.style.opacity=0.5;
        }
    }

    btnRight2.addEventListener("click", ()=>{
        if(currentCount<numItems-1){
            currentCount++;
            updateBrandWrapper();
        }
    })


    btnLeft2.addEventListener("click",()=>{
        if(currentCount>0){
            currentCount--;
            updateBrandWrapper();
        }
    })

    updateBrandWrapper();
})
