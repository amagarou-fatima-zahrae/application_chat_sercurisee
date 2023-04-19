<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />

<style>


/*  *{
margin:0;
padding:0;
outline:none;
border:none;
text-decoration:none;
box-sizing:border-box;
font-family:sans-serif;

} 
 */
.body1{

margin:0;
padding:0;
outline:none;
border:none;
text-decoration:none;
box-sizing:border-box;
font-family:sans-serif;
   background-color: #fbab7e; 
 background-image: linear-gradient(62deg, #fbab7e 0%, #d90647 100%);
   height: 140vh;
  width: 95vw; } 





.nav1{
position:absolute;
top:0;
bottom:0;
height: 140vh;
left:0;
background:#fff;
width:120px;
overflow:hidden;
transition:width 0.2s linear;
box-shadow:0 20px 35px rgba(0,0,0,0.1);


}

.logo1{
text-align:center;
display:flex;
transition:all 0.5s ease;
margin:10px 0 0 ;

}
.ul1{
 list-style-type: none;
}
.logo1 .img1{
width:75px;
height:75px;
border-radius:50%;
}
.logo1 .span1{
font-weight:bold;
padding-left:15px;
font-size:18px;
text-transform:uppercase;
}
.a1{
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
.nav1-item{
position:relative;
top:12px;
margin-left:10px;
}
.a1:hover{
backgound:#eee;
text-decoration:none;

}
.nav1:hover{
text-decoration:none;
width:280px;
transition:all 0.5s ease;

}
.logoute{
position:absolute;
bottom:0;
}









body,
html {

height: 160vh;
margin: 0;

}
.chat {
margin-top: auto;
margin-bottom: auto;
}
.card {
height: 500px;
border-radius: 15px !important;
background-color: rgba(116, 23, 23, 0.4) !important;
}
.contacts_body {
padding: 0.75rem 0 !important;
overflow-y: auto;
white-space: nowrap;
}
.msg_card_body {
overflow-y: auto;
}
.card-header {
border-radius: 15px 15px 0 0 !important;
border-bottom: 0 !important;
}
.card-footer {
border-radius: 0 0 15px 15px !important;
border-top: 0 !important;
}
.container {
align-content: center;
}
.search {
border-radius: 15px 0 0 15px !important;
background-color: rgba(0, 0, 0, 0.3) !important;
border: 0 !important;
color: white !important;
}
.search:focus {
box-shadow: none !important;
outline: 0px !important;
}
.type_msg {
background-color: rgba(0, 0, 0, 0.3) !important;
border: 0 !important;
color: white !important;
height: 53px !important;
overflow-y: auto;
}
.type_msg:focus {
box-shadow: none !important;
outline: 0px !important;
}
.attach_btn {
border-radius: 15px 0 0 15px !important;
background-color: rgba(0, 0, 0, 0.3) !important;
border: 0 !important;
color: white !important;
cursor: pointer;
}
.send_btn {
border-radius: 0 15px 15px 0 !important;
background-color: rgba(0, 0, 0, 0.3) !important;
border: 0 !important;
color: white !important;
cursor: pointer;
height:53px;
}
.search_btn {
border-radius: 0 15px 15px 0 !important;
background-color: rgba(0, 0, 0, 0.3) !important;
border: 0 !important;
color: white !important;
cursor: pointer;
}
.contacts {
list-style: none;
padding: 0;
}
.contacts li {
width: 100% !important;
padding: 5px 10px;
margin-bottom: 15px !important;
}
.active {
background-color: rgba(0, 0, 0, 0.3);
}
.user_img {
height: 60px;
width: 60px;
border: 1.5px solid #f5f6fa;
}
.user_img_msg {
height: 40px;
width: 40px;
border: 1.5px solid #f5f6fa;
}
.img_cont {
position: relative;
height: 70px;
width: 70px;
}
.img_cont_msg {
height: 40px;
width: 40px;
}
.online_icon {
position: absolute;
height: 15px;
width: 15px;
background-color: #4cd137;
border-radius: 50%;
bottom: 13px;
right: 13px;
border: 1.5px solid white;
}
.offline {
background-color: #c23616 !important;
}
.user_info {
margin-top: auto;
margin-bottom: auto;
margin-left: 15px;
}
.user_info span {
font-size: 20px;
color: white;
}
.user_info p {
font-size: 10px;
color: rgba(255, 255, 255, 0.6);
}
.video_cam {
margin-left: 50px;
margin-top: 5px;
}
.video_cam span {
color: white;
font-size: 20px;
cursor: pointer;
margin-right: 20px;
}
.msg_cotainer {
margin-top: auto;
margin-bottom: auto;
margin-left: 10px;
border-radius: 25px;
background-color: #82ccdd;
padding: 10px;
position: relative;
}
.msg_cotainer_send {
margin-top: auto;
margin-bottom: auto;
margin-right: 10px;
border-radius: 25px;
background-color: #78e08f;
padding: 10px;
position: relative;
}
.msg_time {
position: absolute;
left: 0;
bottom: -15px;
color: balck;
font-size: 10px;
}
.msg_time_send {
position: absolute;
right: 0;
bottom: -15px;
color: balck;
font-size: 10px;
}
.msg_head {
position: relative;
}
#action_menu_btn {
position: absolute;
right: 10px;
top: 1px;
color: white;
cursor: pointer;
font-size: 20px;
}
.action_menu {
z-index: 1;
position: absolute;
padding: 15px 0;
background-color: rgba(0, 0, 0, 0.5);
color: white;
border-radius: 15px;
top: 30px;
right: 15px;
display: none;
}
.action_menu ul {
list-style: none;
padding: 0;
margin: 0;
}
.action_menu ul li {
width: 100%;
padding: 10px 15px;
margin-bottom: 5px;
}
.action_menu ul li i {
padding-right: 10px;
}
.action_menu ul li:hover {
cursor: pointer;
background-color: rgba(0, 0, 0, 0.2);
}
/* width */
::-webkit-scrollbar {
width: 10px;
}
.warning {
/* border: 10px ridge; */
/* background-color: #ff0; */
padding: 0.5rem;
display: flex;
flex-direction: column;
}
.warning img {
width: 100%; 
}
/* Track */
::-webkit-scrollbar-track {
background: #f1f1f1;
}
/* Handle */
::-webkit-scrollbar-thumb {
background: #888;
}
/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
background: #555;
}
@media(max-width: 576px) {
.contacts_card {
margin-bottom: 15px !important;
}
}
</style>



</head>
<body  class="body1">
<div>
<nav class="nav1">
		<ul class="ul1">
			<li>
				
				<a href="#" class="logo1 a1">
					<img src="./photos/logo.png" alt="" class="logo1 img1 " style="with:20px";>
					<span class="nav1-item span1">ChatApp</span>
				</a>
			</li>
			<li><a href="" class="a1">
				<i class="fas fa-home" style="color: #000000;"></i>
				<span class="nav1-item span1" style="color: #000000;">Home </span>
			</a></li>
			<li><a href="Show" class="a1" >
				<i class="fas fa-user" style="color: #000000;"></i>
				<span class="nav1-item span1" style="color: #000000;">Profile </span>
			</a></li>
			<li><a href="Ajouter.jsp" class="a1">
				<i class="fas fa-wallet" style="color: #000000;"></i>
				<span class="nav1-item span1" style="color: #000000;">Add contact </span>
			</a></li>
			<li><a href="show_invit.jsp" class="a1">
				<i class="fas fa-chart-bar" style="color: #000000;"></i>
				<span class="nav1-item span1" style="color: #000000;">display invitations </span>
			</a></li>
			<li><a href="FetchData" class="a1">
				<i class="fas fa-tasks" style="color: #000000;"></i>
				<span class="nav1-item span1" style="color: #000000;">Display contact </span>
				
			
			</a></li>
			<li><a href="ListeMessages" >
				<i class="fas fa-envelope" style="color: #000000;"></i>
				<span class="nav-item" style="color: #000000;">Liste Discussions </span>
			</a></li>
			
			<!-- <li><a href="#" >
				<i class="fas fa-question-circle" style="color: #000000;"></i>
				<span class="nav1-item span1" style="color: #000000;">Help </span>
			</a></li> -->
			
						
			<li><a class="a1" >
				<i  class="fas fa-sign-out" class="logoute" style="color: #000000;"></i>
			
				<button type="button" class="nav1-item span1" data-toggle="modal" data-target="#e">
				 Se déconnecter
				</button>
				<div class="modal fade" id="e" tabindex="-1" role="dialog" aria-labelledby="ex" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
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
	</div>
<!-- // -->
<div class="container-fluid h-100">

<div class="row justify-content-end h-100 vh-100">

<div class="col-md-10 col-xl-8 chat">

<div class="card h-100">

<div class="card-header msg_head">

<div class="d-flex bd-highlight">

<div class="img_cont">

<a href="Show"><img src="${user_emet.photo}" class="rounded-circle user_img"></a>

</div>

<div class="user_info">

<span>${user_emet.nom}</span>

<p>${user_emet.email}</p>

</div>

<!-- <div class="video_cam">

<span><i class="fas fa-video" id="btn-video"></i></span>

<span><i class="fas fa-phone" id="btn-call"></i></span>

</div> -->

</div>
<!-- 
<span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
 -->
<!-- <div class="action_menu">

<ul>

<li><i class="fas fa-user-circle"></i> View profile</li>

<li><i class="fas fa-users"></i> Add to close friends</li>

<li><i class="fas fa-plus"></i> Add to group</li>

<li><i class="fas fa-ban"></i> Block</li>

</ul>

</div> -->

</div>

 <div class="alert alert-danger w-50 mt-3 d-none" style="margin-left: 130px;" role="alert" id="alert">
       </i> Impossible de faire l'appel</i>
   </div>
<div class="alert alert-danger w-50 mt-3 d-none" style="margin-left: 130px;" role="alert" id="alert2">
       </i> le récepteur a refusé l'appel</i>
  </div>

<div class="card-body msg_card_body" id="messageArea">

<!-- to send -->

<c:forEach items="${Messages}" var="message" varStatus="status">

<!-- <div class="msg_cotainer" id="messageArea">

Hi, how are you samim? </div> -->

<c:choose>

<c:when test="${message.typeMsg == 'text'}">

<div class="d-flex justify-content-end mb-4">

<div class="row msg_cotainer_send">

<div class=col-xs-5 col-md-3 col-lg-1 centreVerticalement>

<div ><c:out value="${message.contenu}"></c:out> </div> </div>

<div class=col-xs-5 col-md-7 col-lg-9 centreVerticalement>

<a href="${message.contenu}" download>

<i class="fas fa-download"></i>

</a> </div>

<!-- <span class="msg_time_send">9:10 AM, Today</span> -->

</div>

<div class="img_cont_msg">

<img src="${user_emet.photo}" class="rounded-circle user_img_msg">

</div>

</div>
</c:when>

<c:when test="${message.typeMsg =='video' }">

<div class="d-flex justify-content-end mb-4">

<div class="msg_cotainer_send ">

<div class="warning d-flex justify-content-center ">

<div>
<video class="w-100" controls><source src="${message.contenu}"></video>

<a href="${message.contenu}" download>

<i class="fas fa-download"></i>

</a>
</div>
</div>

</div>

<div class="img_cont_msg">

<img src="${user_emet.photo}" class="rounded-circle user_img_msg">

</div>

</div>

</c:when>

<c:when test="${message.typeMsg =='fichier' }">

<div class="d-flex justify-content-end mb-4">

<div class="msg_cotainer_send">

<div class="warning">

<embed class="mb-3" src="${message.contenu}" width="500" height="375" type="application/pdf">

<a href="${message.contenu}" download>

<i class="fas fa-download"></i>

</a>

</div>

<!-- <span class="msg_time_send">9:10 AM, Today</span> -->

</div>

<div class="img_cont_msg">

<img src="${user_emet.photo}" class="rounded-circle user_img_msg">

</div>

</div>

</c:when>

<c:when test="${message.typeMsg=='audio'}">

<div class="d-flex justify-content-end mb-4">

<div class="msg_cotainer_send">

<div class="warning">

<audio class="" controls><source src="${message.contenu}"></audio>

<a href="${message.contenu}" download>

<i class="fas fa-download"></i>

</a>

</div>


</div>

<div class="img_cont_msg">

<img src="${user_emet.photo}" class="rounded-circle user_img_msg">

</div>

</div>

</c:when>

<c:otherwise>

<div class="d-flex justify-content-end mb-4">

<div class="msg_cotainer_send">

<div class="warning">

<img class="" src="${message.contenu}"/>

<a href="${message.contenu}" download>

<i class="fas fa-download"></i>

</a>

</div>

<!-- <span class="msg_time_send">9:10 AM, Today</span> -->

</div>

<div class="img_cont_msg">

<img src="${user_emet.photo}" class="rounded-circle user_img_msg">

</div>

</div>

</c:otherwise>

</c:choose>

</c:forEach>

 <video id="video" width="600" height="300" class="d-none my-2"></video>
</div>

<div class="card-footer">

<form action="" method="post" id="myForm" enctype="multipart/form-data">





<div class="input-group">
 <div >
    <span class="input-group-text attach_btn" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-paperclip"></i></span>
    
    <div class="dropdown m-3">
    
    
    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton">
    
    <li><a class="dropdown-item" href="#" data-type="audio"><i class="fas fa-music"></i> Audio</a></li>
    
    <li> <a class="dropdown-item" href="#" data-type="video"><i class="fas fa-video"></i> Video</a></li>
    
    <li> <a class="dropdown-item" href="#" data-type="fichier"><i class="fas fa-file"></i>Fichier</a></li>
    
    <li><a class="dropdown-item" href="#" data-type="image"><i class="fas fa-image"></i> Image</a></li>
    
    </ul>
    
    </div>
    
    </div>
    
     <input type="text" class="form-control type_msg" name="message" placeholder="Type your message...">
        
    <span class="input-group-text send_btn" name="ajout" id="send" onclick="validate(null);" disabled><i class="fas fa-location-arrow"></i></span>
    
    

<div class="input-group-append">


 
     <%-- <div class="ml-2 mb-2">
     
                     <h5><i id="recordBtn" class="fas fa-microphone fa-2x text-light fw-1"></i></h5>
                     <i id="stopBtn" class="fas fa-stop-circle fa-2x text-danger d-none"></i>
                    </div>
                   <div>
                    <i class="fas fa-camera fa-2x text-success" id="stream"></i>
                    <i class="fas fa-dot-circle fa-2x text-danger d-none" id="take"></i>
                    <canvas id="canvas" style="display: none;"></canvas>
                   </div>
       </div> --%>

<div class="input-group-append">


<div >

<input type="hidden" name="mediaType" id="mediaType">

<input type="hidden" name="mediaUrl" id="mediaUrl">

<input type="hidden" name="mediaUrlR" id="mediaUrlR">

</div>

</div>

</div>

</form>
</div>

</div>

</div>

</div>

</div>
<!-- Button trigger modal
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button> -->

<!-- Modal video1 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Demande d'appel</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-footer">
        <button type="button" id="nonAppel" class="btn btn-secondary" data-bs-dismiss="modal">refuser</button>
        <button type="button" id="okAppel" class="btn btn-primary">accepter</button>
      </div>
    </div>
  </div>
</div>
<!-- /// modal video 2 -->
<div class="modal fade" id="example" tabindex="-1" aria-labelledby="exampleModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModal">Video Room</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body d-flex justify-content-between">
        <video id="localVideo" width="200" height="200"></video>
        <video id="remoteVideo" width="200" height="200"></video>
      </div>
      <div class="modal-footer">
        <button type="button" id="stopAppel" class="btn btn-secondary" data-bs-dismiss="modal">Stop l'appel</button>
      </div>
    </div>
  </div>
</div>
<!-- //////////////AUDIO -->
<!-- Modal audio1 -->
<div class="modal fade" id="audio1" tabindex="-1" aria-labelledby="Label" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="Label">Demande d'appel</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-footer">
        <button type="button" id="nonCall" class="btn btn-secondary" data-bs-dismiss="modal">refuser</button>
        <button type="button" id="okCall" class="btn btn-primary">accepter</button>
      </div>
    </div>
  </div>
</div>
<!-- /// modal audio 2 -->
<div class="modal fade" id="audio2" tabindex="-1" aria-labelledby="ex" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ex">Appel Room</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body d-flex justify-content-between">
        <audio id="localAudio" width="200" height="200"></audio>
        <audio id="remoteAudio" width="200" height="200"></audio>
      </div>
      <div class="modal-footer">
        <button type="button" id="stopCall" class="btn btn-secondary" data-bs-dismiss="modal">Stop l'appel</button>
      </div>
    </div>
  </div>
</div>
<!-- Load Bootstrap JS and jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" ></script>  
    <!--  <script src="https://unpkg.com/peerjs@1.4.7/dist/peerjs.min.js"></script> -->
     
<p id="id" class="d-none">${id}</p>
<p id="id_rec" class="d-none">${id_rec}</p>
	
                  
	<script>
	/////WEB SOCKETS
	let id=document.getElementById("id").textContent;
	var cpt=10000;
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
/* 	 var peer1;
	 var peer = new Peer(id);
	 peer.on("open", idp=>{
		 
  	   peer1=idp;
  	   console.log("open peer! "+peer1);
  	 
  	 
	 });  */
	 var socket = new WebSocket("ws://localhost:8081/WebChat/ServerEndPoint?userID="+id+"="+urlParams.get('id'));
	 socket.onopen = function(e) {
		 document.getElementById('send').removeAttribute("disabled");
		  console.log("[open] Connection established");
		 
		};
	
		
		socket.onmessage=function(event){
			
			  const Data = event.data;
			  
			  var objectR = JSON.parse(Data);
			  console.log("objectR "+objectR.content);
			  var data = "contenu=" + encodeURIComponent(objectR.content)+ "&key=" + encodeURIComponent(objectR.key);
			  console.log(objectR);
			  
			 //var data = "contenu=" + encodeURIComponent(objectR.content);
			  var xhr = new XMLHttpRequest();
			   xhr.open('POST', 'http://localhost:8081/WebChat/AjaxCall3',true);
			   /* var formData = new FormData();
			   formData.append("message", objectR.content);
			   formData.append("key", objectR.key); */
			   xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			   xhr.onload = function() {
			     if (xhr.status === 200) {
			  	   valeur = xhr.responseText;
					//  console.log('nouveau message arrive de '+objectR.recepteurId +" msg "+objectR.content);
					 // console.log('longeur msg '+objectR.content.length);
					  var messageElement = document.createElement('div');
						//messageElement.classList.add('alert', 'alert-success');
						
					  if (objectR.type === 'text') { 
						    console.log('Variable is a text');   
						    messageElement.id="text"+cpt;
						    messageElement.innerHTML = '<div class="msg_cotainer_send"><i class="fas fa-download text-primary mx-2 px-3"   onclick="downloadText('+cpt+')"></i>'+valeur+'</div><div class="img_cont_msg"><img src="${user_emet.photo}" class="rounded-circle user_img_msg"></div>';
						    messageElement.classList.add('d-flex');
							 messageElement.classList.add('justify-content-end');
							 messageElement.classList.add('mb-4');
						    //messageElement.innerHTML = objectR.content+'<i class="fas fa-download"   onclick="downloadText('+cpt+')"></i>';
							cpt++;
						}
					  
					  else if(objectR.type=== 'video') {
						  var contenu =valeur;
						  console.log('apres longeur msg '+contenu+" "+contenu.length);
						     messageElement.innerHTML = '<div class="msg_cotainer_send"><video class="w-100 mb-3 " controls><source src="' +contenu + '"></video><a href="'+contenu+'" download><i class="fas fa-download"></i></a></div><div class="img_cont_msg"><img src="${user_emet.photo}" class="rounded-circle user_img_msg"></div>';
							
						     console.log("Je suis un contenu: "+contenu);
						     messageElement.classList.add('d-flex');
							 messageElement.classList.add('justify-content-end');
							 messageElement.classList.add('mb-4');
						  //
						 
						//	messageElement.innerHTML = '<video class="w-50 mb-3 h-50" controls><source src="' +contenu+ '"></video><a href="'+contenu+'" download><i class="fas fa-download"></i></a>';
			              } else if (objectR.type === 'audio') {
			            	  console.log("audio "+valeur);
			            	  var contenu =valeur;  //.substring(0,objectR.content.length-2);
			            	  console.log('apres longeur msg '+contenu+" "+contenu.length);
			            	  console.log("aprés sub "+contenu);
			            	  messageElement.innerHTML = '<div class="msg_cotainer_send"><audio class="w-100 mb-3 h-50" controls><source src="' +contenu+ '"></audio><a href="'+contenu+'" download><i class="fas fa-download"></i></a></div><div class="img_cont_msg"><img src="${user_emet.photo}" class="rounded-circle user_img_msg"></div>';
								 messageElement.classList.add('d-flex');
								 messageElement.classList.add('justify-content-end');
								 messageElement.classList.add('mb-4');
			            	  //
			            	
			            	 // messageElement.innerHTML = '<audio class="w-50 mb-3 h-50" controls><source src="' +contenu+ '"></audio><a href="'+contenu+'" download><i class="fas fa-download"></i></a>';
			              }else if (objectR.type === 'fichier') {
			            	  
			            	  console.log("fichier");
			            	  var contenu =valeur;  //.substring(0,objectR.content.length-2);
			            	  console.log('apres longeur msg '+contenu+" "+contenu.length);
			            	  messageElement.innerHTML = '<div class="msg_cotainer_send"><embed class="mb-3 w-100" src="'+contenu+'" height="375"  type="application/pdf"><a href="'+contenu+'" download><i class="fas fa-download"></i></a></div><div class="img_cont_msg"><img src="${user_emet.photo}" class="rounded-circle user_img_msg"></div>';
								 messageElement.classList.add('d-flex');
								 messageElement.classList.add('justify-content-end');
								 messageElement.classList.add('mb-4');
			            	  //
			            	 // messageElement.innerHTML = '<embed class="mb-3" src="'+contenu+'" width="500" height="375"  type="application/pdf"><a href="'+contenu+'" download><i class="fas fa-download"></i></a>';
			              } else {
			            	  console.log("image");
			            	  
			            	  var contenu =valeur;  //.substring(0,objectR.content.length-2);
			            	  //const blob = new Blob(['C:/Users/HP/Web-workspace/WebChat/src/main/webapp/'+contenu], {type: 'image/jpeg'});

			            	  // Create a new URL object from the Blob
			            	 // const url = URL.createObjectURL(blob);
			            	  console.log('apres longeur msg '+contenu+" "+contenu.length);
			            	  messageElement.innerHTML = '<div class="msg_cotainer_send"><img class="w-100" src="'+contenu+'"/><a href="'+contenu+'" download><i class="fas fa-download"></i></a></div><div class="img_cont_msg"><img src="${user_emet.photo}" class="rounded-circle user_img_msg"></div>';
								 messageElement.classList.add('d-flex');
								 messageElement.classList.add('justify-content-end');
								 messageElement.classList.add('mb-4');
			            	  //
			            	//  var contenu =objectR.content.substring(0,objectR.content.length-2);
			            	  //messageElement.innerHTML = '<img class="w-50 mb-3 h-50" src="' +contenu+ '"/><a href="'+contenu+'" download><i class="fas fa-download"></i></a>';
			              }
					  var messageArea = document.getElementById('messageArea');	
					  messageArea.appendChild(messageElement); 
			     }
			   }
			   console.log(data);
			   xhr.send(data); 
		
		}
		// CLOSE
		socket.onclose=function(){
			console.log("cloosed!");
		}
		
		// DECONNECTER
		function deconnecter(){
			socket.close();
			 window.location.href = 'http://localhost:8081/WebChat/Login';
		}
		
		// ERROR
		socket.onerror = function(error) {
			  console.log(error);
		};
    //******************** END WEB SOCKETS*************************************************
	   /*  send Message */
		function sendMessage(type,url,file) {
			console.log('ana f send message .');
			const queryString = window.location.search;
			const urlParams = new URLSearchParams(queryString);
		  // console.log('im here'+urlParams.get('id'));
			var messageElement = document.createElement('div');
			 var val=document.querySelector('input[type="text"]').value;
		  if(type=='text'){
			  console.log('text');
			  if(val!==""){
				
				     messageElement.innerHTML = '<div class="img_cont_msg"><img src="${user_rec.photo}" class="rounded-circle user_img_msg"></div><div class="msg_cotainer">'+val+'</div>';
					 messageElement.classList.add('d-flex');
					 messageElement.classList.add('justify-content-start');
					 messageElement.classList.add('mb-4');
					 
					 //
					 var data = "contenu=" + encodeURIComponent(val);
					// var formData1 = new FormData();
				//	formData1.append("message", val);
					 var xhr = new XMLHttpRequest();
	                 xhr.open('POST', 'http://localhost:8081/WebChat/MsgEncrypt');
	                 xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	                 xhr.onload = function() {
	                 if (xhr.status === 200) {
	    	         var encryptMsg=xhr.responseText;
	    	         var msg =  JSON.parse(encryptMsg);
	    	         console.log(msg);
	    	         var message = {
							    "recepteurId": urlParams.get('id'),
							    "content": msg.Msg,
							    "type" : type,
							    "key" : msg.key,
							  };
					 var messageJSON = JSON.stringify(message);
					 console.log("messageJSON: "+messageJSON);
					 socket.send(messageJSON); 
					 console.log("sent nn"+val.length);
	    	     //   console.log('Response text:', responseAjax);
	    	      
	                 } else {
	    	             console.log('Error:', xhr.status);
	                 }
	               }; 
	              // xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	               xhr.send(data);  
	                /// FIN AJAX 
			//*********************
					
			  }
		 }else{
			if (type === 'video') {
				messageElement.innerHTML = '<div class="img_cont_msg"><img src="${user_rec.photo}" class="rounded-circle user_img_msg"></div><div class="msg_cotainer"><video class="w-100" controls><source src="' + url + '"></video></div>';
				 messageElement.classList.add('d-flex');
				 messageElement.classList.add('justify-content-start');
				 messageElement.classList.add('mb-4');
				//
				//messageElement.innerHTML = '<video class="w-50 h-50" controls><source src="' + url + '"></video>';
              } else if (type === 'audio') {
            	  messageElement.innerHTML = '<div class="img_cont_msg"><img src="${user_rec.photo}" class="rounded-circle user_img_msg"></div><div class="msg_cotainer"><audio class="w-100" controls><source src="' + url + '"></audio></div>';
  				 messageElement.classList.add('d-flex');
  				 messageElement.classList.add('justify-content-start');
  				 messageElement.classList.add('mb-4');
            	 // messageElement.innerHTML = '<audio class="w-50 h-50" controls><source src="' + url + '"></audio>';
              }else if (type === 'fichier') {
            	  messageElement.innerHTML = '<div class="img_cont_msg"><img src="${user_rec.photo}" class="rounded-circle user_img_msg"></div><div class="msg_cotainer"><embed class="mb-3" src="'+url+'" width="500" height="375"  type="application/pdf"></div>';
   				 messageElement.classList.add('d-flex');
   				 messageElement.classList.add('justify-content-start');
   				 messageElement.classList.add('mb-4');
            	 // messageElement.innerHTML = '<embed class="mb-3" src="'+url+'" width="500" height="375"  type="application/pdf">';
              } else {
            	  messageElement.innerHTML = '<div class="img_cont_msg"><img src="${user_rec.photo}" class="rounded-circle user_img_msg"></div><div class="msg_cotainer"><img class="w-100 h-50" src="' + url + '"/></div>';
    				 messageElement.classList.add('d-flex');
    				 messageElement.classList.add('justify-content-start');
    				 messageElement.classList.add('mb-4');
            	 // messageElement.innerHTML = '<img class="w-50 h-50" src="' + url + '"/>';
              }
			  var formData = new FormData();
			if(file==null){
				const fileInput = document.getElementById('file');
				var file_input =fileInput.files[0];
				console.log("file_input :"+file_input);
				document.body.removeChild(fileInput); 
				 formData.append("message", file_input);
			}
			else{
				if(type=='audio'){
					console.log("file audio "+file);
					const timestamp = new Date().getTime();
					const filename = 'audio_' + timestamp + '.mp3';
					formData.append("message", file, filename);
				}// image
				else{
					console.log("file image"+file);
					const timestamp = new Date().getTime();
					const filename = 'image_' + timestamp + '.jpeg';
					formData.append("message", file, filename);
				}
				
			}
			//console.log(fileInput.files[0]);
			//**********************
			 // SEND SERVER AJAX
	      
          
	     // const data = new URLSearchParams(new FormData(form));
	      console.log(formData);
	      console.log('call ajax .');
	     var xhr = new XMLHttpRequest();
	     xhr.open('POST', 'http://localhost:8081/WebChat/AjaxCall');
	     xhr.onload = function() {
	       if (xhr.status === 200) {
	    	   var responseAjax=xhr.responseText;
	    	   var msg =  JSON.parse(responseAjax);
  	         console.log(msg);
	    	   console.log('Response text:', responseAjax);
	    	   var message = {
					    "recepteurId": urlParams.get('id'),
					    "content":msg.Msg,
					    "type" : type,
					    "key":msg.key,
					  };
	    	   var messageJSON = JSON.stringify(message);
				 console.log("messageJSON: "+messageJSON);
				 socket.send(messageJSON); 
				 console.log("sent nn"+message.content.length);
	       } else {
	    	   console.log('Error:', xhr.status);
	       }
	     }; 
	    // xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	     xhr.send(formData); 
	     /// FIN AJAX 
			//*********************
	}
	     
		   var messageArea = document.getElementById('messageArea');	
			messageArea.appendChild(messageElement);
			document.querySelector('input[type="text"]').value = '';
			
			// var btnSend = document.getElementById('send');
           //  btn.onclick="sendMessage('text','')";
			 var inputHidden = document.getElementById('mediaType');
             var UrlHidden = document.getElementById('mediaUrl');
             var UrlHiddenR = document.getElementById('mediaUrlR');
             UrlHidden.value="";
             inputHidden.value="";
             UrlHiddenR.value="";
		}
		////////////////////Validate/////////////////////////////////////////
		      function validate(file){
		    	  console.log(' ana f validate.');
                var inputHidden = document.getElementById('mediaType');
                var UrlHidden = document.getElementById('mediaUrl');
               
    	        var url = UrlHidden.value;
    	        var type= inputHidden.value;
    	      
    	        if(url==""){
    	        	 sendMessage('text','');
    	        }
    	        else{
    	        	console.log('send message call.');
    	        	sendMessage(type,url,file);
    	        }

            }
		
		///////////////////
		/* dropdown */
	  var dropdownItems = document.querySelectorAll('.dropdown-item');
      dropdownItems.forEach(function(item) {
    	  
        item.addEventListener('click', function(event) {
          event.preventDefault();
          console.log('hi');
          var type = this.getAttribute('data-type');
          var input = document.createElement('input');
          input.type = 'file';
          input.id="file";
          if(type=="fichier"){
        	  input.accept = '.txt,.pdf';
          }else{
        	  input.accept = type + '/*';
          }
          input.style.display = 'none';
          document.body.appendChild(input);
          
          input.addEventListener('change', function() {
            var file = this.files[0];
           // console.log(file);
            if (file) {
                var url = URL.createObjectURL(file);
                var inputHidden = document.getElementById('mediaType');
                var UrlHidden = document.getElementById('mediaUrl');
                var UrlHiddenR = document.getElementById('mediaUrlR');
                UrlHidden.value=url;
                inputHidden.value=type;
              }  
          });
          
          input.click();
        });
        
      });
      ///////////////////////////////////////////////////////////////////
      // quit page

  /*   window.addEventListener("beforeunload", async function(event) {
    // Call the AJAX servlet
    const urlParams = new URLSearchParams(window.location.search);
    id=urlParams.get('id');
    var xhr2 = new XMLHttpRequest();
    xhr2.open("GET", "http://192.168.8.164:8081/WebChat/AjaxCall?id="+id, false); 
    console.log("i'm quit");
    xhr2.send();
    console.log("send request ");
    await new Promise(resolve => setTimeout(resolve, 1000)); 
}); */
window.addEventListener("beforeunload", function(event) {
    // Call the AJAX servlet using sendBeacon()
    id2=document.getElementById('id').textContent;
    const urlParams = new URLSearchParams(window.location.search);
    id=urlParams.get('id');
    const url = 'http://localhost:8081/WebChat/AjaxCall2?id='+id+'&id2='+id2;
    console.log("i'm quit");
    navigator.sendBeacon(url);
    console.log("i'm quit");
   // navigator.sendBeacon('http://192.168.8.164:8081/WebChat/AjaxCall?id='+id, data);
});
//
      
     function downloadText(id) {
    	 console.log("id : "+id);
    	  const text = document.getElementById('text'+id).textContent;
    	  console.log(text);
    	  const filename = 'myTextImage.txt';
    	  const blob = new Blob([text], { type: 'text/plain' });
    	  const link = document.createElement('a');
    	  link.href = URL.createObjectURL(blob);
    	  link.download = filename;
    	  document.body.appendChild(link);
    	  link.click();
    	  document.body.removeChild(link);
    	}
     
     
  /*     ///RECORD AUDIO
     var isRecording = false;
    var startTime;
    var TimeInterval;
  var mediaRecorder;
var chunks = [];
const recordBtn = document.getElementById('recordBtn');
const stopBtn = document.getElementById('stopBtn'); */
/* function startRecording() { 
	recordBtn.addEventListener('click', function() {
		console.log("click start ....");
		
		if (isRecording) {
	        // Stop recording
	       
	      } else {
	        // Start recording
	        isRecording = true;
	        startTime = new Date().getTime();
	        console.log("startTime" +startTime);
	        document.getElementById("recordBtn").classList.remove("text-light");
	        document.getElementById("recordBtn").classList.add("text-success");
	        document.getElementById("stopBtn").classList.remove("d-none");
	        TimeInterval = setInterval(updateTime, 1000);
	        console.log("Recording started.");
	        
	      //µµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµ
		    
	        navigator.mediaDevices.getUserMedia({audio: true}).then(function(stream) {
				  mediaRecorder = new MediaRecorder(stream);
				  console.log("mediaRecorder "+mediaRecorder);
				  
				  mediaRecorder.start();
				  console.log('Recording started...'); 
				  
				  mediaRecorder.addEventListener('start', function() {
					  console.log('Recording started.capturing..');
					  mediaRecorder.addEventListener('dataavailable', function(event) {
						    console.log("event" +event);
						    chunks=[];
						    chunks.push(event.data);
						  });
					});
				
				}).catch(function(err) {
				  console.log('Error: ' + err);
				});
	      }
		
		  });
		  
	  stopBtn.addEventListener('click', function() {
		   if(mediaRecorder){
			   mediaRecorder.stop();
			    isRecording = false;
		        clearInterval(TimeInterval);
		       // var duration = new Date().getTime() - startTime;
		        document.getElementById("recordBtn").classList.remove("text-success");
		        document.getElementById("recordBtn").classList.add("text-light");
		        document.getElementById("recordBtn").textContent = "";
		        document.getElementById("stopBtn").classList.add("d-none");
		      //  console.log("Recording stopped. Duration: " + duration + "ms");
			    console.log('Recording stopped.');
			    mediaRecorder.addEventListener('stop', function() {
			    const audioBlob = new Blob(chunks, { 'type' : 'audio/mpeg' });
			    console.log('create audio.');
			    const audioUrl = URL.createObjectURL(audioBlob);
			    //**
	              var inputHidden = document.getElementById('mediaType');
	              var UrlHidden = document.getElementById('mediaUrl');
	              var UrlHiddenR = document.getElementById('mediaUrlR');
	              UrlHidden.value=audioUrl;
	              inputHidden.value='audio';
			    //**
			    console.log("validate call")
			     console.log('validate call.');
			    validate(audioBlob);
			 
			
			    

		   });
		  };
	});
	

    // Function to update time on recording icon
    function updateTime() {
      var Time = new Date().getTime() - startTime;
      console.log("elapsedTime "+Time);
      var seconds = Math.floor(Time / 1000);
      var minutes = Math.floor(seconds / 60);
      seconds = seconds % 60;
      document.getElementById("recordBtn").textContent = minutes + ":" + (seconds < 10 ? "0" : "") + seconds;
    }
 
 //  PHOTO
 const streamBtn = document.getElementById('stream');
 const takeBtn = document.getElementById('take');
 const video = document.getElementById('video');
 const canvas = document.getElementById('canvas');
 const context = canvas.getContext('2d');

 streamBtn.addEventListener('click', function(){
	 console.log("click photo");
	 video.classList.remove("d-none");
	 takeBtn.classList.remove("d-none");
	 navigator.mediaDevices.getUserMedia({ video: true })
	  .then(stream => {
		  console.log("stream video...");
		  video.srcObject = stream;
	    video.play();
	  })
	  .catch(error => {
	    console.error('Error accessing user media:', error);
	  });
 });
 takeBtn.addEventListener('click', function(){
	 takeBtn.classList.add("d-none");
	 console.log("take photo");
	 video.pause();
	  video.classList.add("d-none");
	 console.log("video pause..");
	 
	  canvas.width = 200;
	  canvas.height = 200;
	  context.imageSmoothingQuality = 0.5;
	  context.drawImage(video, 0, 0, canvas.width, canvas.height);
	 
	  const imageData = canvas.toDataURL('image/jpeg',0.5);
	 
	  console.log("put image");
	
	   if (video.srcObject  && video.srcObject.getTracks) {
		   console.log("stream found");
		   video.srcObject.getTracks().forEach(function(track) {
            track.stop();
          });
        };
	
	   //-----------------------------
	   var inputHidden = document.getElementById('mediaType');
       var UrlHidden = document.getElementById('mediaUrl');
       var UrlHiddenR = document.getElementById('mediaUrlR');
       UrlHidden.value= imageData;;
       inputHidden.value='image';
//**
       console.log('validate call.');
		  canvas.toBlob(function(blob) {
			  validate(blob);
	    });
		  //----------------------------
	 
 }); */

///////////VIDEO
      
      /*  var localStream;
       const inputLocalPeerId=peer1;
       var inputRemotePeerId;
       var ok; */
     //  const stopBtn=document.getElementById("stop");
      /*  var idf=document.getElementById('id_rec').textContent;
       var idm=document.getElementById("id").textContent;
       console.log("idf :"+idf+" idm : "+idm);
       inputRemotePeerId=idf;
       console.log("inputRemotePeerId :"+inputRemotePeerId);
       const btnCall=document.getElementById("btn-video");
       const okAppel=document.getElementById("okAppel");
       const nonAppel=document.getElementById("nonAppel");
    	   btnCall.addEventListener("click", function(){    
    		   console.log("clicked call!");
    		   //-------------------------------------------
    		   var xhr3 = new XMLHttpRequest();
    		     xhr3.open('POST', "AppelVideo?idf="+idf+"&idm="+idm);
    		     xhr3.onload = function() {
    		       if (xhr3.status === 200) {
    		    	   ok=xhr3.responseText; 
    		    	   console.log('Response text peer:'+ ok+ "bool "+(ok==1));
    		    	   //---------------------------------------------
 
    	    		   if(ok==1){
    	    			   console.log("ok=1");
    	    			   $('#example').modal('show'); 
    	        	       const remotePeerId=inputRemotePeerId;
    	                  navigator.mediaDevices.getUserMedia({video : true}).then(stream => {
    	               	   localStream=stream;
    	               	   const videoElement = document.getElementById("localVideo");
    	               	   videoElement.srcObject=localStream;
    	               	   videoElement.onloadedmetadata=()=>videoElement.play();
    	                  });
    	               	   //
    	               	   navigator.mediaDevices.getUserMedia({video : true,audio: true}).then(stream2 => {
    	               		 var call= peer.call(remotePeerId, stream2);
    	            	       call.on("stream", stream=>{
    	            		   console.log("call on 1");
    	            		   const remoteVideo=document.getElementById("remoteVideo");
    	            		   remoteVideo.srcObject=stream;
    	            		   remoteVideo.onloadedmetadata=()=>remoteVideo.play();
    	            	     });
    	                   }); 
    	    		   }else{
    	    			   
    	    			   console.log("ok=0 => alert");
    	    			   var alert = document.getElementById('alert');
    	    			   alert.classList.remove('d-none');
    	    			   setTimeout(function() {
    	    			     alert.classList.add('d-none');
    	    			 }, 5000);
    	    		   }
    		    	   //------------------------------------------
    		       } else {
    		    	   console.log('Error:', xhr3.status);
    		       }
    		     }; 
    		     console.log("send ajax call appel video");
    		     xhr3.send(); 
    		   //-------------------------------------------
       
    	   });
    	   
    	   peer.on("call", call=>{ 
    		   
    		   console.log("someone call me");
    			   $('#exampleModal').modal('show'); 
    			   console.log(" display the modal");// display the modal
    			   okAppel.addEventListener("click", function(){
    				   
    				   console.log(" appel accepté");
    				   $("#exampleModal").modal("hide");
    				   setTimeout(function() {
    					   $('#example').modal('show'); 
    	    			 }, 1000);
    				  
    				   navigator.mediaDevices.getUserMedia({video : true}).then(stream => {
    	            	   localStream=stream;
    	            	   //**    
    	        	         const videoElement = document.getElementById("localVideo");
    	        	         videoElement.srcObject=localStream;
    	        	         videoElement.onloadedmetadata=()=>videoElement.play();
    	    		   });
    	            	   navigator.mediaDevices.getUserMedia({video : true,audio: true}).then(stream3 => {
    	            		   call.answer(stream3);
    	            		     call.on("stream", stream=>{
    	            			   console.log("call on 2");
    	            			   const remoteVideo = document.getElementById("remoteVideo");
    	            			   remoteVideo.srcObject=stream;
    	            			   remoteVideo.onloadedmetadata=()=>remoteVideo.play();
    	            	       });
    	                 }); 
    			   });
    			   nonAppel.addEventListener("click", function(){
    				   $("#exampleModal").modal("hide");
    				   console.log("refuser ");
    				   var alert2 = document.getElementById('alert2');
    				   alert2.classList.remove('d-none');
        			   setTimeout(function() {
        			     alert2.classList.add('d-none');
        			 }, 5000);
    			   });
    
    		   });
    	   
    	   document.getElementById('stopAppel').addEventListener("click",function(){
    		   if (remoteVideo.srcObject  && remoteVideo.srcObject.getTracks) {
    			   console.log("stream found a");
    			   remoteVideo.srcObject.getTracks().forEach(function(track) {
    	            track.stop();
    	          });
    	        };
    	        if (videoElement.srcObject  && videoElement.srcObject.getTracks) {
     			   console.log("stream found b");
     			  videoElement.srcObject.getTracks().forEach(function(track) {
     	            track.stop();
     	          });
     	        };
     	         peer.close();
     	       peer.destroy(); 
    	   });
    	   
    	   //Appel Audio
    	   var localS;
       const LocalPeerId=peer1;
       var RemotePeerId;
       var ok2;
     //  const stopBtn=document.getElementById("stop");
       
       RemotePeerId=idf;
       console.log("RemotePeerId :"+RemotePeerId);
       const btnCall2=document.getElementById("btn-call");
       const okCall=document.getElementById("okCall");
       const nonCall=document.getElementById("nonCall");
    	   btnCall2.addEventListener("click", function(){  
    		   console.log("clicked call audio!");
    		   //-------------------------------------------
    		   var xhr4 = new XMLHttpRequest();
    		     xhr4.open('POST', "AppelVideo?idf="+idf+"&idm="+idm);
    		     xhr4.onload = function() {
    		       if (xhr4.status === 200) {
    		    	   ok2=xhr4.responseText; 
    		    	   console.log('Response text peer:'+ ok2+ "bool "+(ok2==1));
    		    	   //---------------------------------------------
    	    		   if(ok2==1){
    	    			   console.log("ok2=1");
    	               	   navigator.mediaDevices.getUserMedia({audio: true}).then(streamA => {
    	               		 var callA= peer.call(remotePeerId, streamA);
    	            	       callA.on("stream", stream=>{
    	            		   console.log("call audio on 1");
    	            		   const remoteAudio=document.getElementById("remoteAudio");
    	            		   remoteAudio.srcObject=stream;
    	            		   remoteAudio.onloadedmetadata=()=>remoteAudio.play();
    	            	     });
    	                   }); 
    	    		   }else{
    	    			   
    	    			   console.log("ok=0 => alert");
    	    			   var alert = document.getElementById('alert');
    	    			   alert.classList.remove('d-none');
    	    			   setTimeout(function() {
    	    			     alert.classList.add('d-none');
    	    			 }, 5000);
    	    		   }
    		    	   //------------------------------------------
    		       } else {
    		    	   console.log('Error:', xhr4.status);
    		       }
    		     }; 
    		     console.log("send ajax call appel audio");
    		     xhr4.send(); 
    		   //-------------------------------------------
       
    	   });
    	   
    	   peer.on("call", call2=>{ 
    		   
    		   console.log("someone call me audio");
    		         $('#audio1').modal('show'); 
    			   okCall.addEventListener("click", function(){
    				   $("#audio1").modal("hide");
    				   setTimeout(function() {
    					   $('#audio2').modal('show'); 
    	    			 }, 1000);
    				   
    				   console.log(" appel accepté audio");
    	            	   navigator.mediaDevices.getUserMedia({audio: true}).then(streamA2 => {
    	            		   call2.answer(streamA2);
    	            		     call2.on("stream", stream=>{
    	            			   console.log("call on 2");
    	            			   const remoteVideo = document.getElementById("remoteAudio");
    	            			   remoteAudio.srcObject=stream;
    	            			   remoteAudio.onloadedmetadata=()=>remoteAudio.play();
    	            	       });
    	                 }); 
    			   });
    			   nonCall.addEventListener("click", function(){
    				   $("#audio2").modal("hide");
    				   console.log("refuser ");
    				   var alert2 = document.getElementById('alert2');
    				   alert2.classList.remove('d-none');
        			   setTimeout(function() {
        			     alert2.classList.add('d-none');
        			 }, 5000);
    			   });
    
    		   });
    	   
    	   document.getElementById('stopCall').addEventListener("click",function(){
    		   if (remoteAudio.srcObject  && remoteAudio.srcObject.getTracks) {
    			   console.log("stream found a");
    			   remoteAudio.srcObject.getTracks().forEach(function(track) {
    	            track.stop();
    	          });
    	        };
    	        if (remoteAudio.srcObject  && remoteAudio.srcObject.getTracks) {
     			   console.log("stream found b");
     			  remoteAudio.srcObject.getTracks().forEach(function(track) {
     	            track.stop();
     	          });
     	        };
     	         peer.close();
     	       peer.destroy(); 
    	   }); */
    	   
</script>
	
</body>
</html>