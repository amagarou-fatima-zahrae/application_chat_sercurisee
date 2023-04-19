<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
<!-- <!DOCTYPE html>
<html> -->
<head>
<meta charset="UTF-8">
<title>ChatApp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"/>
<link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
 *{
margin:0;
padding:0;
outline:none;
border:none;
text-decoration:none;
box-sizing:border-box;
font-family:sans-serif;

} 

body{
   background-color: #fbab7e; 
 background-image: linear-gradient(62deg, #fbab7e 0%, #d90647 100%);
   height: 300vh;
  width: 100vw; } 
nav{
position:absolute;
top:0;
bottom:0;
height: 300vh;
left:0;
background:#fff;
width:110px;
overflow:hidden;
transition:width 0.2s linear;
box-shadow:0 20px 35px rgba(0,0,0,0.1);


}

.logo{
text-align:center;
display:flex;
transition:all 0.5s ease;
margin:10px 0 0 ;

}
ul{
 list-style-type: none;
}
.logo img{
width:75px;
height:75px;
border-radius:50%;
}
.logo span{
font-weight:bold;
padding-left:15px;
font-size:18px;
text-transform:uppercase;
}
a{
position:relative;
color:rgb(85,83,83);
font-size:14px;
display:table;
width:300px;
padding:10px;
text-decoration:none;
}
.fas{
position:relative;
width:70px;
height:40px;
top:14px;
font-size:20px;
text-align:center;

}
.nav-item{
position:relative;
top:12px;
margin-left:10px;
}
a:hover{
backgound:#eee;
text-decoration:none;

}
nav:hover{
text-decoration:none;
width:280px;
transition:all 0.5s ease;

}
.logout{
position:absolute;
bottom:0;
}


</style>
</head>
<!-- <body> -->
	<nav>
		<ul>
			<li>
				
				<a href="#" class="logo">
					<img src="./photos/logo.png" alt="" class="logo_img">
					<span class="nav-item">ChatApp</span>
				</a>
			</li>
			<li><a href="" >
				<i class="fas fa-home" style="color: #000000;"></i>
				<span class="nav-item" style="color: #000000;">Home </span>
			</a></li>
			<li><a href="Show" >
				<i class="fas fa-user" style="color: #000000;"></i>
				<span class="nav-item" style="color: #000000;">Profile </span>
			</a></li>
			<li><a href="Ajouter.jsp" >
				<i class="fas fa-wallet" style="color: #000000;"></i>
				<span class="nav-item" style="color: #000000;">Add contact </span>
			</a></li>
			<li><a href="show_invit.jsp" >
				<i class="fas fa-chart-bar" style="color: #000000;"></i>
				<span class="nav-item" style="color: #000000;">display invitations </span>
			</a></li>
			<li><a href="FetchData" >
				<i class="fas fa-tasks" style="color: #000000;"></i>
				<span class="nav-item" style="color: #000000;">Display contact </span>
				
			
			</a></li>
			<li><a href="ListeMessages" >
				<i class="fas fa-envelope" style="color: #000000;"></i>
				<span class="nav-item" style="color: #000000;">Liste Discussions </span>
			</a></li>
			
			<!-- <li><a href="#" >
				<i class="fas fa-question-circle" style="color: #000000;"></i>
				<span class="nav-item" style="color: #000000;">Help </span>
			</a></li> -->
			
						
			<li><a  >
				<i  class="fas fa-sign-out" class="logout" style="color: #000000;"></i>
			
				<button type="button" class="nav-item" data-toggle="modal" data-target="#e">
				 Se déconnecter
				</button>
<div class="modal fade" id="e" tabindex="-1" role="dialog" aria-labelledby="ex" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content" >
      <div class="modal-header">
        <h5 class="modal-title" id="ex">Déconnexion</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Si vous vous déconnecter, tous vos discussions actuelles seront supprimés</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
        <button type="button" class="btn btn-primary"  onclick="deconnecter()">Se déconnecter</button>
      </div>
    </div>
  </div>
</div>
				</a>
				
			</li>


		</ul>
	</nav>
<script>

function deconnecter(){
	
	 window.location.href = 'http://localhost:8081/WebChat/Login';
}
</script>

<!-- </body>
</html> -->