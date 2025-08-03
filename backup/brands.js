



const brands={
    women:[
        "./images/brands/criss-coss-logo.svg", 
        "./images/brands/freestyle-logo.svg", 
        "./images/brands/giovanni-logo.svg", 
        "./images/brands/grasshoppers-logo.svg", 
        "./images/brands/hi-tec-logo.svg",
        "./images/brands/ipanema-logo.svg"],

    men:["./images/brands/grasshoppers-logo.svg", "./images/brands/hi-tec-logo.svg","./images/brands/ipanema-logo.svg",
        "./images/brands/mancini-logo.svg","./images/brands/pierre-cardin-logo.svg","./images/brands/pitbull-logo.svg",
        "/images/brands/terraPOD-logo.svg8","/images/brands/tommy-logo.svg","/images/brands/unreal-logo.svg"],

    kids:["/images/brands/pitbull-logo.svg", "/images/brands/smart-steps-logo.svg", "/images/brands/sugar-spice-logo.svg", 
        "/images/brands/terraPOD-logo.svg","/images/brands/tommy-logo.svg","/images/brands/unreal-logo.svg"]
};

document.addEventListener("DOMContentLoaded",()=>{

    const btnRight=document.getElementById("rightBrandButton");
    const btnLeft=document.getElementById("leftBrandButton");
    let currentCount=0;
    let numItems=Math.ceil(brands["women"].length/4);
    const brandWrapper=document.getElementById("brandWrapper");
    const brand=document.querySelectorAll(".brandCategory");

    updateBrandSlider("women");


    brand.forEach(button =>{
        button.addEventListener("click", ()=>{
            const category=button.textContent.toLowerCase();
            numItems=Math.ceil(brands[category].length/4);
            brand.forEach(button =>{
                button.style.backgroundColor="royalblue";
            })

            button.style.backgroundColor="red";
            currentCount=0;
            updateBrandSlider(category);
            updateBrandButtons();
          
        });
});


    function updateBrandSlider(category){
        brandWrapper.style.transform=`translateX(0%)`
       
        brandWrapper.innerHTML="";
        if (!brands[category]) return; 
        brands[category].forEach(src=>{
            const link= document.createElement("a");
            link.classList.add("brandWrapperItems");
            link.href="products.html?brand=";
            const img=document.createElement("img");
            img.src=src;
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
            btnRight.disabled=true;
            btnRight.style.opacity=0.3;
        }else{
            btnRight.disabled=false;
            btnRight.style.opacity=0.5;
        }

        if(currentCount==0){
            btnLeft.disabled=true;
            btnLeft.style.opacity=0.3;
        }else{
            btnLeft.disabled=false;
            btnLeft.style.opacity=0.5;
        }
    }

    btnRight.addEventListener("click", ()=>{
        if(currentCount<numItems-1){
            currentCount++;
            updateBrandWrapper();
        }
    })


    btnLeft.addEventListener("click",()=>{
        if(currentCount>0){
            currentCount--;
            updateBrandWrapper();
        }
    })

    updateBrandWrapper();
})
