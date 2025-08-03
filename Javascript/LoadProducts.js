let products=[];
const perPage=25;
const params= new URLSearchParams(window.location.search)
let currentPage=parseInt(params.get('page')) || 1;
let brandID=parseInt(params.get('brand')) || undefined
let random=params.get('random')===true || false
let category=params.get('category') || undefined
 let filteredProducts=[];
 let chosenArray=[];
 let count=0;
let myFilters={brands:["pitbull","mancini","ipanema","tommy",
    "terrapod","unreal","grasshoppers","hi-tec","criss-cross",
    "pierre-cardin","freestyle"],
    
    colors:["brown","black","tan","blue","green","nude"],
    
    sizes:[3,4,5,6,7,8,9,10]}
document.addEventListener("DOMContentLoaded", ()=>{
    fetch(`http://localhost:3000/products?page=${currentPage}&perPage=${perPage}&brand=${brandID}&random=${random}&category=${category}`)
        .then(res=> res.json())
            .then(data=>{
                
                renderPage(data.products);
                pagination(data.total);
            });


});


function renderPage(products){

    const filters=document.getElementById("filters");
    const container=document.getElementById("products");
                                                                                                          
    container.innerHTML="";

    products.forEach((product)=>{
        const card=document.createElement("div");
        card.className="product";
        card.innerHTML=`        
                <div class="productItem">
                    <div class="productImage">
                        <a href="product.html?id=${product.id}"><img src=${product.images[0]} alt=${product.name} id="productImage1"></a>
                        <a href="product.html?id=${product.id}"><img src=${product.images[1]} alt=${product.name} id="productImage2"></a>
                    </div>
                    <h3>${product.name}</h3>
                    <p>R${product.prices[0]}</p>
                    <p>category: ${product.category}</p>
                </div>         
        `;
        container.appendChild(card);


    })


}

function pagination(total){
    const paginationContainer=document.getElementById("pagination");
    paginationContainer.innerHTML="";
    let numPages=Math.ceil(total/perPage);

    for(let i=1;i<=numPages;i++){
        const btn=document.createElement("button");

        btn.textContent=i;
        btn.className="btnPagination";
        btn.onclick= ()=>{
            currentPage=i;
            let url=`products.html?page=${i}&perPage=${perPage}`
            if(brandID) url+=`&brand=${brandID}`
            if(category) url+=`&category=${category}`
           window.location.href=url
        }
        
        paginationContainer.appendChild(btn);
    }
}