<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<p id="id" class="d-none">${id}</p>
<script>
let id=document.getElementById("id").textContent;
function supprimerMonCompte(){
	var xhr = new XMLHttpRequest();
	xhr.open('POST', 'SupprimMonCompte');
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.onload = function() {
	  if (xhr.status === 200) {
	    console.log('Réponse reçue : ' + xhr.responseText);
	    deconnecter();
	    
	  } else {
	    console.log('Erreur de requête. Statut de la réponse : ' + xhr.status);
	  }
	};
	xhr.send('id='+id);
	
}

</script>