document.addEventListener("DOMContentLoaded", ()=>{
    includeHtml("components/header.html","headerPlaceholder");
    includeHtml("components/footer.html","footerPlaceholder");

    function includeHtml(file, elementID){
    fetch(file)
        .then(res=> res.text())
            .then(data => {
                document.getElementById(elementID).innerHTML=data;
            });
    }

    
    
})



