<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		/* Define styles for the message section */
		.message-section {
			padding-top: 20px;
		}

		.message {
			display: flex;
			flex-direction: row;
			align-items: center;
			padding: 10px;
			border-bottom: 1px solid #eee;
		}

		.user-photo {
			width: 50px;
			height: 50px;
			border-radius: 50%;
			object-fit: cover;
			margin-right: 10px;
		}

		.user-name {
			font-weight: bold;
			margin-bottom: 5px;
		}

		.message-preview {
			flex: 1;
			margin-right: 10px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
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
	<div class="row justify-content-between">
	  <div class="col-5">
	  </div>
	  <div class="container message-section col-6">
		<c:forEach items="${derniersMessages}" var="message">
		  <div class="message" id="${message.id_emetteur}" >
		  <c:set var="id_emet" value="${message.id_emetteur}"/>
			<c:set var="id_rec" value="${message.id_recepteur}"/>
			 <%
			       int id_emet=(Integer)pageContext.getAttribute("id_emet");
			       int id_rec=(Integer)pageContext.getAttribute("id_rec");
                   Utilisateur user = DAOUser.recupererUser(id_emet);
     
            %>
			<img class="user-photo"  src="././<%= user.getPhoto() %>" />
			<div class="message-preview">
			
				  <p> <%= user.getNom() %> </p>
				 <p id="m${message.id_emetteur}">${message.contenu}</p> 
			</div>
			<div class="message-details">
				<div class="message-count  ml-5" id="count${message.id_emetteur}">  <% out.println(new MessageRecus().nombreMessages(id_rec,id_emet)); %> </div>
				<div class="message-time " id="d${message.id_emetteur}">${message.date_envoi}</div>
			</div>
		 </div> 
         </c:forEach> 	
		<!-- Add more messages here -->
	</div>
	</div>
	<p class="d-none" id="id">${id}</p>
	<script type="text/javascript">
	let id=document.getElementById("id").textContent;
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	let socket = new WebSocket("ws://localhost:8081/WebChat/ServerEndPoint3?userID="+id);
	 socket.onopen = function(e) {
		  console.log("[open] Connection established liste messages");
		 
		};
		
		socket.onmessage=function(event){
			console.log("arrive !!!");
			const Data = event.data;
			var objectR = JSON.parse(Data);
			console.log(objectR);
			 var discuss = document.querySelectorAll(".message");
			  for (var i = 0; i < discuss.length; i++) {
			     if(discuss[i].id==objectR.emet){
			    	 console.log(" found hi");
			    	  var count = document.getElementById("count"+objectR.emet).textContent;
			    	  document.getElementById("count"+objectR.emet).textContent=parseInt(count)+1;
			    	  
			    	  var contenu = document.getElementById("m"+objectR.emet).textContent;
			    	  document.getElementById("m"+objectR.emet).textContent=objectR.content;
			    	  
			    	  var count = document.getElementById("d"+objectR.emet).textContent;
			    	  document.getElementById("d"+objectR.emet).textContent=objectR.date;
			    	  console.log(count);
			    	  break;
			     }
			    };
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