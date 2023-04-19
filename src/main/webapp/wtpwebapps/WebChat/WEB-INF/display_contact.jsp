<%@ page language="java" %>
<%@ page import="java.sql.*"%>
<%@include file="includes/sidebar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hey</title>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
<script  type="text/javascript" src="//cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    $('#myTable').dataTable({
    	lengthMenu: [5,10,20,30,40,50,100],
    	language: {
    		 "emptyTable": "Aucun enregistrement trouve",
    		"info": "Affichage de _START_  _END_ sur _TOTAL_ entrees", /* set custom text for info */
    		"paginate": {
    		          "next": "Suivant", /* set text for "Next" button */
    		          "previous": "Precedent", /* set text for "Previous" button */
    		        	  
    		        },
    		
            search: "" ,
            lengthMenu: "Afficher _MENU_ contact", 
            searchPlaceholder: "Cherchez un contact specifique" // add placeholder text
          }
    
    });
  });


</script>
<style>
 .dataTables_length {
    margin-top: 40px; 
    margin-left: 50px;/* add margin */
  }
  
    .dataTables_paginate {
    text-align: center; /* center pagination controls */
    margin-top: 20px; /* add margin to top of pagination controls */
  }
  div#myTable_info.dataTables_info{
  margin-left:45px;
  margin-top:20px;
  }
  .dataTables_paginate .paginate_button {
    padding: 5px 10px; /* adjust padding of pagination buttons */
    margin: 0 5px; /* add margin between pagination buttons */
    width:100px;
    margin-right:20px;
     margin-bottom:20px;
  }
  .dataTables_paginate .paginate_button.current {
    background-color: #fff; /* set background color of current page button */
    color: black; /* set text color of current page button */
    width:50px;
  }
div.dataTables_filter input {

    width: 300px;
    margin-top:40px;
    margin-bottom:40px;
    margin-right:50px;
    background:red;
  }
ul{
 list-style-type: none;
}

table {
 
  border-collapse: collapse;
  background-color: #fff;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
  border-radius: 5px;
}

th {
  background-color: #f2f2f2;
  text-align: center;
  padding: 10px;
  width:70px;
}
.img_cont {
	position: relative;
	height: 70px;
	width: 70px;
}
.online_icon {
	position: absolute;
	height: 15px;
	width: 15px;
	border-radius: 50%;
	bottom: 13px;
	right: 13px;
	left:55px;
	top:50px;
	border: 1.5px solid white;
}
.user_img {
	height: 60px;
	width: 60px;
	border: 1.5px solid #f5f6fa;
}

 a{
  text-decoration:none;
 }
td {
  width:70px;
 text-align: left;
 text-decoration:none;

  padding: 10px;
}

tbody tr:nth-child(even) {
  background-color: #f2f2f2;
}
.green-circle {
    margin-left:20px;
    position: relative; /* set position to relative */
    padding-left: 20px; /* add left padding to make room for the circle */
  }
  
  .green-circle:before {
    content: ""; /* add empty content */
    display: block;
    position: absolute; /* set position to absolute */
    top: 50%; /* set top position to center the circle vertically */
    left: 60; /* set left position to align the circle to the left */
    transform: translate(0, -50%); /* center the circle vertically */
    width: 10px; /* set width of the circle */
    height: 10px; /* set height of the circle */
    border-radius: 50%; /* make the element a circle */
    background-color: red; /* set the background color of the circle */
  }


</style>

</head>
<body>
        
   <div class="container">
    <div class="row justify-content-center ">
      <div class="cold-md-2 ml-6 ">
       <div class="card " style="background:#dfe9f5;width:700px;margin-top:50px;margin-left:300px;" >
           
          

              
          
			<table id="myTable" style="width:600px;">
			<thead>
				
			 <th style="width:30px;"></th>
			 <th >Contact</th>
			 <th >Action</th>
			   
			</thead>
			  <tbody>
			
			
			<%
			HttpSession varS80 = request.getSession();
	          int id80 = (Integer)varS80.getAttribute("id");
		      try {
		          Class.forName("com.mysql.jdbc.Driver");
		          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/application_chat_reseau", "root", "");
		          HttpSession varS = request.getSession();
		          int id = (Integer)varS.getAttribute("id");
		          PreparedStatement ps = conn.prepareStatement("select nom, prenom, id_contact,state from contact join utilisateur on contact.id_contact=utilisateur.id_user where contact.id_user=?");
		          ps.setInt(1, id);
		          ResultSet rs = ps.executeQuery();
		          while (rs.next()) {
		            int id2 = rs.getInt(3);
		            String nom = rs.getString(1);
		            String prenom = rs.getString(2);
		            String stateInit=(rs.getInt(4)==1)?"green":"red";
			
					%>
					<tr>
					
						
						<td style="width:30px;">
								
						<div class="img_cont">
				
									<a href="show_contact.jsp?id=<%=id2 %>" ><img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img">
									</a><span id="<%=id2 %>" class="online_icon" style="background-color:<%=stateInit%>;"></span>
						
						</div>
						</td>

						<td  style="margin-left:-100px;width:70px;"><%=nom %> <%=prenom %></td>
						<td style="display:flex;margin-top:5px;margin-left:50px; width:200px;">
							<a style="margin-left:-30px;" href="addMessage?id=<%=id2 %>" >
								<button class="btn btn-sm btn-info" style="width:100px;" >Message</button>
							</a>
							<a style="margin-left:10px;margin-right:0px;"href="">
								<button class="btn btn-sm btn-danger"onclick="supprimerLigne(this, <%= id2 %>)" style="width:100px;" >Supprimer</button>
							</a>
						</td>
						
					</tr>
	
    <%
        }
        rs.close();
        ps.close();
        conn.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>
			
			</tbody>
			</table>

     </div>
       </div>
        </div>
    </div>
    <p id="id_user"style="display:none;"> ${id_user} </p>
<script type="text/javascript">

function supprimerLigne(button, id) {
var row = button.parentNode.parentNode;
row.parentNode.removeChild(row);
var xhr = new XMLHttpRequest();
xhr.open('GET', 'FetchData?id2=' + id, true);
xhr.send();
}

let id=document.getElementById('id_user').textContent;
console.log(id);
//console.log("ws://localhost:8081/WebChat/ServerEndpoint2?userID="+id);
let socket = new WebSocket("ws://100.104.160.85:8081/WebChat/ServerEndpoint2?userID=<%=id80%>");
		 socket.onopen = function(e) {
		console.log("[open] Connection established");
		console.log("Sending to server");
		};
		socket.onmessage=function(event){
		console.log("nouveau");
					  const Data = event.data;
				  var objectR = JSON.parse(Data);
		console.log(objectR);
		let span=document.getElementById(objectR.id);
		if(objectR.state){
		span.style.background="green";
		}else{
			span.style.background="red";
		}}




</script>

</body>
</html>