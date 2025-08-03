const form=document.getElementById("frmRegister")

form.addEventListener("submit",async(e)=>{
    e.preventDefault()

    const email=form.email.value
    const password=form.password.value

    res=await fetch(`http://localhost:3000/register`,{
        method:'POST',
        headers:{'Content-Type':'application/json'},
        body: JSON.stringify({email,password})
    })

    const data = await res.json()
    
    if(data.error){
        message(data.error,"error")    
    }else{
        message(data.message,"success")

        setTimeout(()=>{
            window.location.href= document.referrer || "/"
        },1000)
    }

})

 function message(text,type){
    const msg=document.getElementById("msg")
    msg.textContent=text
    msg.style.color=(type==="error")? "red" : "green"  
}