let products=[];
const perPage=25;
let currentPage=1;
 let filteredProducts=[];
 let chosenArray=[];
 let count=0;

document.addEventListener("DOMContentLoaded", ()=>{
    fetch("data/products.json")
        .then(res=> res.json())
            .then(data=>{
                products=data;

                const category=getCategoryFromURL();
            
                if(category){
                    for(let i=0;i<products.length;i++){
                       if(category==products[i].category){
                            filteredProducts[count]=products[i];
                            count++;
                        }else if(category==products[i].brand){
                            filteredProducts[count]=products[i];
                            count++;
                        }
                    }
                    chosenArray=filteredProducts;
                }else{
                    chosenArray=products;
                }
                renderPage(currentPage,chosenArray);
                pagination(chosenArray);
            });


});

function getCategoryFromURL(){
    const params= new URLSearchParams(window.location.search);
    const returnedParam=undefined;
    if(params.get("category")){
        returnedParam=params.get("category")
    }else if(params.get("brand")){
        returnedParam=params.get("brand");
    }

    return returnedParam ;
}

function renderPage(page, arrProducts){
    let start=(page-1)*perPage;
    let end=page*perPage;
    let productsShown=arrProducts.slice(start,end);

    
    const container=document.getElementById("products");
    container.innerHTML="";

    productsShown.forEach(product=>{
        const card=document.createElement("div");
        card.className="product";
        card.innerHTML=`        
                <div class="productItem">
                    <div class="productImage">
                        <a href="#"><img src=${product.images[0]} alt=${product.name} id="productImage1"></a>
                        <a href="#"><img src=${product.images[1]} alt=${product.name} id="productImage2"></a>
                    </div>
                    <h3>${product.name}</h3>
                    <p>R${product.price}</p>
                    <p>category: ${product.category}</p>
                </div>         
        `;
        container.appendChild(card);

    })
}

function pagination(arrProducts){
    const paginationContainer=document.getElementById("pagination");
    paginationContainer.innerHTML="";
    let numPages=Math.ceil(arrProducts.length/perPage);

    for(let i=1;i<=numPages;i++){
        const btn=document.createElement("button");

        btn.textContent=i;
        btn.className="btnPagination";
        btn.onclick= ()=>{
            currentPage=i;
            renderPage(i,arrProducts);
            pagination(arrProducts);
        }
        
        paginationContainer.appendChild(btn);
    }
}