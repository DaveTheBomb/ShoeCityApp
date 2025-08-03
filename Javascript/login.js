
const form=document.getElementById("frmLogin")

form.addEventListener("submit",async(e)=>{
    e.preventDefault()

    const email=form.email.value
    const password=form.password.value

    const res= await fetch("http://localhost:3000/login",{
        method:'POST',
        headers:{'Content-Type':'application/json'},
        body:JSON.stringify({email,password})
    })

    const data= await res.json()
    
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


 


