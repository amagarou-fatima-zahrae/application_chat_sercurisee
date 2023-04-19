<%@ page language="java" contentType="text/html; charset=UTF-8"

pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@include file="/./WEB-INF/includes/sidebar.jsp" %>


<!DOCTYPE html>

<html>

<head>

<%@ include file="header.jsp" %>

<meta charset="UTF-8">

<title>Insert title here</title>

<style>

body,
html {
/* 	height: 100%;
 */
  width: 125vw;
	
}

.chat {
	margin-top: auto;
	margin-bottom: auto;
}

.card {
	margin: 40;
	height: 500px;
	border-radius: 15px !important;
	background-color: rgba(0, 0, 0, 0.4) !important;
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
	height:48px;
}

.search:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

.type_msg {
	background-color: rgba(0, 0, 0, 0.3) !important;
	border: 0 !important;
	color: white !important;
	height: 60px !important;
	overflow-y: auto;
}

.type_msg:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

/* .attach_btn {
	border-radius: 15px 0 0 15px !important;
	background-color: rgba(0, 0, 0, 0.3) !important;
	border: 0 !important;
	color: white !important;
	cursor: pointer;
} */

.send_btn {
	border-radius: 0 15px 15px 0 !important;
	background-color: rgba(0, 0, 0, 0.3) !important;
	border: 0 !important;
	color: white !important;
	cursor: pointer;
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



./* msg_cotainer {
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
} */

/* .msg_time {
	position: absolute;
	left: 0;
	bottom: -15px;
	color: rgba(255, 255, 255, 0.5);
	font-size: 10px;
} */

/* .msg_time_send {
	position: absolute;
	right: 0;
	bottom: -15px;
	color: rgba(255, 255, 255, 0.5);
	font-size: 10px;
} */

.msg_head {
	position: relative;
}



/* width */

 ::-webkit-scrollbar {
	width: 10px;
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

.message-count {

background-color: #25d366;

color: #fff;

border-radius: 50%;

font-size: 12px;

width: 20px;

height: 20px;

display: flex;

align-items: center;

justify-content: center;

margin-bottom: 5px;

}

.message-time {

font-size: 12px;

color: #999;

}


</style>

<%@ include file="header.jsp" %>

<%@ page import="com.chaApp.models.*" %>

</head>

<body>

<div class="container-fluid h-50">

<div class="row justify-content-center h-100 vh-70">

<div class="col-md-8 col-xl-7 justify-content-center">

<div class="card mb-sm-3 mb-md-0 contacts_card">

<div class="card-header">
						<div class="input-group">
							<input id="myInput" type="text" placeholder="Search..." name="" class="form-control search">
							<div class="input-group-prepend">
								<span class="input-group-text search_btn"><i class="fas fa-search"></i>kkkkk</span>
							</div>
						</div>
					</div> 

<div class="card-body contacts_body">

<ui class="contacts" id="contacts">

<c:forEach items="${derniersMessages}" var="message">

<li class="active ">

<div class="message row justify-content-between align-items-center" id="${message.id_emetteur}" >

<c:set var="id_emet" value="${message.id_emetteur}"/>

<c:set var="id_rec" value="${message.id_recepteur}"/>

<%

int id_emet=(Integer)pageContext.getAttribute("id_emet");

int id_rec=(Integer)pageContext.getAttribute("id_rec");

Utilisateur user = DAOUser.recupererUser(id_emet);

%>

<div class="col-7 d-flex bd-highlight">

<div class="img_cont">

<!-- image de profil -->

  <img src="././<%= user.getPhoto() %>" class="rounded-circle user_img"/>

</div>

<div class="user_info">

<!-- nom -->

<span><%= user.getNom() %></span>

<p id="m${message.id_emetteur}" class="fz-2"> <strong>${message.contenu}</strong></p>

</div>

</div>

<div class="col-3 message-details">

<div class="message-count ml-5" id="count${message.id_emetteur}"> <% out.println(new MessageRecus().nombreMessages(id_rec,id_emet)); %> </div>

<div class="message-time " id="d${message.id_emetteur}">${message.date_envoi}</div>

</div>
</div>
</li>

</c:forEach> </ui> </div></div></div></div></div>



<p class="d-none" id="id">${id}</p>

<script type="text/javascript">
var items = document.querySelectorAll(".active");

var input = document.querySelector("#myInput");

input.addEventListener("keyup", function() {
  var filter = input.value.toUpperCase();

  for (var i = 0; i < items.length; i++) {
    var item = items[i];
    var text = item.textContent.toUpperCase();

    if (text.indexOf(filter) > -1) {
      item.style.display = "";
    } else {
      item.style.display = "none";
    }
  }
});

//

let id=document.getElementById("id").textContent;

const queryString = window.location.search;

const urlParams = new URLSearchParams(queryString);

let socket = new WebSocket("ws://100.104.160.85:8081/WebChat/ServerEndPoint3?userID="+id);

socket.onopen = function(e) {

console.log("[open] Connection established liste messages");

};

socket.onmessage=function(event){

console.log("arrive !!!");

const Data = event.data;
console.log('Hiii ajax ');
var objectR = JSON.parse(Data);
console.log('Hiii ajax 2 ');

var formData = new FormData();
formData.append("contenu", objectR.content);
var xhr = new XMLHttpRequest();
 xhr.open('POST', 'http://localhost:8081/WebChat/AjaxCall3');
 xhr.onload = function() {
   if (xhr.status === 200) {
	  
	   var valeur = xhr.responseText;
       console.log('hellooooooooooooooooooo:', objectR.content);
       var discuss = document.querySelectorAll(".message");
       var found=0;
       /* for (var i = 0; i < discuss.length; i++) {

                 if(discuss[i].id==objectR.emet){

                   console.log(" found hi");

                   var count = document.getElementById("count"+objectR.emet).textContent;

                   document.getElementById("count"+objectR.emet).textContent=parseInt(count)+1;

                   var contenu = document.getElementById("m"+objectR.emet).textContent;

                   document.getElementById("m"+objectR.emet).textContent=valeur;

                   var count = document.getElementById("d"+objectR.emet).textContent;

                   document.getElementById("d"+objectR.emet).textContent=objectR.date;

                   console.log("ah");
                   found=1;
                   break;
                  }

       };
       if(!found){
       	var discussion = document.createElement('li');
       	discussion.innerHTML = '<div class="message row justify-content-between align-items-center" id="'+objectR.emet+'" ><div class="col-7 d-flex bd-highlight"><div class="img_cont"><img src="././'+objectR.photo_rec+'" class="rounded-circle user_img"/></div><div class="user_info"><span>'+objectR.nom_rec+'</span><p id="m'+objectR.emet+'"> <strong>'+valeur+'</strong></p></div></div><div class="col-3 message-details"><div class="message-count ml-5" id="count'+objectR.emet+'">1</div><div class="message-time" id="d'+objectR.emet+'">'+objectR.date+'</div></div></div></li>';
       	 discussion.classList.add('active');
       	 document.getElementById("contacts").appendChild( discussion);
       } */

	   
   } else {
	   console.log('Error:', xhr.status);
   }
  
  
   
 }
 xhr.send(formData); 
console.log(objectR);


}

// CLOSE

socket.onclose=function(){

console.log("cloosed liste disc!");

}

// ERROR

socket.onerror = function(error) {

console.log(error);

};

document.addEventListener("DOMContentLoaded", function() {

var myDivs = document.querySelectorAll(".message");

for (var i = 0; i < myDivs.length; i++) {

myDivs[i].addEventListener("click", function() {

var id = this.id;

var url = "addMessage?id=" + encodeURIComponent(id);

window.location.href = url;

});

}

});

</script>

</body>

</html>
	
