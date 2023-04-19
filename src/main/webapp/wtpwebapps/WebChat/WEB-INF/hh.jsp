<%@ page language="java" %>
<%@ page import="java.sql.*"%>
<%@page import= "java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>


<%@page import= "connexBD.MySQLDatabase" %>
<%@include file="includes/sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
@import url("https://fonts.googleapis.com/css2?family=Rubik:wght@400;700&display=swap");

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
/*   background-color: #fbab7e;
 *//*    background-image: linear-gradient(62deg, #fbab7e 0%, #d90647 100%);
 */  
/*   background-image: linear-gradient(62deg, #fbab7e 0%, #d90647 100%);
 */  height: 78vh;
  width: 100vw;
  display: flex;
  margin-top:80px;
   margin-bottom:80px;
  margin-left:60px;
  justify-content: center;
  align-items: center;
  font-family: "Rubik", sans-serif;
}

.wrapper {

  background-color: white;
  border-radius: 15px;
  overflow: hidden;
  box-shadow: rgba(255, 255, 255, 0.1) 0px 1px 1px 0px inset,
    rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
    rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
}

.grey {
  color: #999999;
}

.profile-top {
  height: 250px;
  width: 500px;
  background-image: url("images/city.jpg");
  background-position: center;
  background-size: cover;
  position: relative;
}

.profile-image {
 /* background-image: url("images/user.jpg");*/
  background-position: center;
  background-size: cover;
   position: relative; 
  width: 200px;
   height: 180px; 
  overflow: hidden;
  border-radius: 50%;
  border: 3px solid white;
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translate(-50%, 50%);
}

.profile-bottom {
  margin-top: 75px;
  padding: 25px;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}

.main-infos {
  display: flex;
  align-items: center;
  font-size: 28px;
  margin-bottom: 5px;
}

.name {
margin-top:-20px;
  font-weight: 700;
 margin-left:50px;

}
.agegrey{


font-size:16px;

}

.email {
  font-size: 14px;

}

.ville {

  margin-bottom: 15px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.ville ion-icon {
  margin-right: 5px;
  color: #388eff;
}

.profile-stats {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  width: 100%;
}

.stat-item:not(:last-child) {
  border-right: 1px solid black;
}

.stat {
  font-size: 20px;
  font-weight: 700;
}

</style>
</head>
<body>
  <%
	Connection con= MySQLDatabase.getConnexion();
     HttpSession varS=request.getSession();
	int id= (Integer)varS.getAttribute("id");
  ResultSet rs = con.createStatement().executeQuery("Select * from Utilisateur where id_user = "+id);
  
  %>
  
  
  <% while(rs.next()) { %>
    <div class="wrapper" >
      <div class="profile-top">
        <div class="profile-image mb-4"><img src="<%=  rs.getString(10) %>"></div>
      </div>

      <div class="profile-bottom">
        <div class="profile-infos">
          <div class="main-infos">
            <h3 class="name"><%=  rs.getString(2) %>  <%=  rs.getString(3) %> </h3>
            
            
          </div>
          
          <div class="email2" style="display:flex;margin-top:0px;">
         
          <i class="fas fa-calendar  " style="margin-top:-15px;"></i>
          <p class="agegrey "> <%=  rs.getString(6) %></p>
         </div>
         <div class="email2" style="display:flex;margin-top:0px;">
         
          <i class="fas fa-heart " style="margin-top:-15px;"></i>
          <p class="agegrey "><%=  rs.getString(7) %></p>
         </div>
		
         <div class="email2" style="display:flex;margin-top:0px;">
         
          <i class="fas fa-envelope " style="margin-top:-15px;"></i>
          <p class="email"><%=  rs.getString(4) %></p>
         </div>
         
            <div class="email2" style="display:flex;margin-top:0px;">
         
          <i class="fas fa-tasks " style="margin-top:-15px;"></i>
          <p class="email"><%=  rs.getString(8) %></p>
         </div>
     
         
         <div style="display:flex;margin-top:5px;margin-left:50px; width:200px;">
							<a style="margin-left:-40px;" href="Update">
								<button class="btn btn-sm btn-warning" style="width:100px;" >Update</button>
							</a>
							<a style="margin-left:10px;margin-right:0px;">
								<button class="btn btn-sm btn-danger" style="width:100px;" data-toggle="modal" data-target="#exampleModal2">Supprimer</button>
							</a>
		</div>
         
        <%} %> 

         
        </div>

       
      </div>
    </div>
	 
	 <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Suppression de votre compte</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Vous êtes sur le point de supprimer votre compte, Voulez vous continuez?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
        <button type="button" class="btn btn-primary" onclick="supprimerMonCompte()">Continuer</button>
      </div>
    </div>
  </div>
</div>
    <script>
    function supprimerMonCompte(){
		var xhr = new XMLHttpRequest();
		xhr.open('DELETE', 'SuppMonCompte');
		xhr.setRequestHeader('Content-Type', 'application/json');
		xhr.onload = function() {
		  if (xhr.status === 200) {
		    console.log('Réponse reçue : ' + xhr.responseText);
		    deconnecter();
		    
		  } else {
		    console.log('Erreur de requête. Statut de la réponse : ' + xhr.status);
		  }
		};
		xhr.send();	
	}
    </script>
    <script
      type="module"
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
    ></script>
</body>
</html>