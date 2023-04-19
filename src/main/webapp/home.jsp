<%@ page language="java" %>
<%@ page import="java.sql.*"%>
<%@include file="WEB-INF/includes/sidebar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
       
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
<title>hey</title>

<style>
    
body{
 
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-color: #3f5c58;
    
}

.box{
    position: relative;
    width: 380px;
    height: 330px;
    background: white;
    border-radius: 8px;
    overflow: hidden;
    display:flex;
    flex-direction: column;
    /* padding-left: 40px; */
    padding-top:100px;
    margin-top:120px;margin-left:420px;"
    
}
.box::before{
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 380px;
    height: 420px;
    background: linear-gradient( to bottom, #d90647 37%, #eb402c 98% );
    transform-origin: bottom right;
    animation: animate 6s linear infinite;
   
}

.box::after{
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    
    width: 380px;
    height: 420px;
    background: white;
    transform-origin: bottom right;
    animation: animate 6s linear infinite;
    animation-delay: -3s;
}
@keyframes animate {
    0%{
        transform: rotate(0deg);
    }
    100%{
        transform: rotate(360deg);
    }
    
}
.form{
    position: absolute;
    inset: 4px;
    border-radius: 8px;
    background: linear-gradient(45deg, #3f5c58, #d90647);
    z-index: 10;
    padding: 50px 40px;
    display: flex;
    flex-direction: column
    
}
.form h2{
    color: #fff;
  
    font-weight: 500;
    text-align: center;
    letter-spacing: 0.1em;
  
}
.inputBox{
    position: relative;
    margin-top: 35px; 
    width: 300px;
   
}

.inputBox input{
    position: relative;
    width: 100%;
    padding:20px 10px 10px;
    background: transparent;
    border: none;
    outline: none;
    font-size: 1em;
    color: #aa59a6;
    letter-spacing: 0.05em;
    z-index: 10; 
}
.inputBox span{
    position: absolute;
    left: 0;
    padding-top: 40px;
    padding: 20px 0px 10px;
    font-size: 1.5em;
    color: #aa59a6;
    pointer-events: none;
    letter-spacing: 0.05em;
    transition: 0.5s;
    align-content: center;
   margin-bottom:40px;
}
.inputBox input:valid ~ span,
.inputBox input:focus ~ span{
    color: #fff;
    transform: translateX(0px) translateY(-34px);
    font-size: 0.8em;
}

.inputBox i{
    position: absolute;
    left: 0;
    bottom:  0;
    height: 2px;
    width: 100%;
    padding: 20px 10px 10px;
    font-size: 1em;
    background: #fff;
    border-radius: 4px;
    pointer-events: none;
    transition: 0.5s;
}

.inputBox input:valid ~ i,
.inputBox input:focus ~ i{
   height: 44px;
    background: #fff;
}
input[type="submit"]{
  

    text-align: center;
    border: none;
    background: #fff;
    outline: none;
    padding: 11px 25px;
    width: 150px;
    height: 40px;
    margin-top: 50px;
    border-radius: 4px;
    font-weight: 600;
    cursor: pointer;
    position: absolute;
    right: 120px; 
    
    
    
}
input[type="submit"]:active{
    opacity: 0.8;
}


</style>

</head>
<body >
   <div class="container">
       <div class="row justify-content-center ">


      <div class="cold-md-2 ml-6 ">
      

		            
    
                   
                    <div class="card-body">
                        <div class="box">
                            <div class="form" >
                           
                        <form action="Ajouter" method="POST"  class="mt-3">
                            
                        <h2>Add new contact</h2>
                            
                                      
                            <div class="inputBox">
                                
                                <input type="email"   name="email" placeholder="Ajouter l'email de votre futur contact">
                                
                               
                                <span>Email</span>
                                <i></i>   
                            </div>  

                  
                            <input class="boutton" type="submit" value="Ajouter" >
                                 
                           
                        </form>
                    </div>
                </div>
            </div>
    

                </div>
                
            </div>
            </div>
     




</body>
</html>