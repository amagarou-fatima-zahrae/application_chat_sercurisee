<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
 Se déconnecter
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Déconnexion</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Voulez vous vous déconnecter?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
        <button type="button" class="btn btn-primary" onclick="deconnecter()">Se déconnecter</button>
      </div>
    </div>
  </div>
</div>
	 <button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal2">Supprimer mon compte</button>
	 
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
<a href="Ajouter">Ajouter</a><br>
<a href="show_invit.jsp">show invitations</a><br>
<a href="Show">Afficher profil</a><br>
<a href="ListeMessages">discussions</a><br>
<form action="FetchData" method="post">
<input type="submit" value="Afficher Contacts">
</form><br>
<a href="ListeMessages">liste des disccusions</a>
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
	function deconnecter(){
		
			 window.location.href = 'http://localhost:8082/chatApp/Login';
		    
	}
	
	</script>
</body>
</html>