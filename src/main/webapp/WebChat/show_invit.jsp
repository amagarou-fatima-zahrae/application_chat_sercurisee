<%@ page language="java" %>
<%@ page import="java.sql.*"%>
<%@include file="WEB-INF/includes/sidebar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>hey</title>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
<script  type="text/javascript" src="//cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="jquery-1.11.2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#myTable').dataTable({
    	lengthMenu: [5,10,20,30,40,50,100],
    	language: {
    		 "emptyTable": "Aucun enregistrement trouvé",
    		"info": "Affichage de _START_ à _END_ sur _TOTAL_ entrées", /* set custom text for info */
    		"paginate": {
    		          "next": "Suivant", /* set text for "Next" button */
    		          "previous": "Précédent", /* set text for "Previous" button */
    		        	  
    		        },
    		
            search: "" ,
            lengthMenu: "Afficher _MENU_ contact", 
            searchPlaceholder: "Cherchez un contact spécifique" // add placeholder text
          }
    
    });
  });


</script>
<style>

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


</style>
<script>
function supprimerLigne(button, id) {
  var row = button.parentNode.parentNode;
  row.parentNode.removeChild(row);
  var xhr = new XMLHttpRequest();
  xhr.open('GET', 'FetchData?id2=' + id, true);
  xhr.send();
}
</script>
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
			try {
				 Class.forName("com.mysql.cj.jdbc.Driver");
				 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/application_chat_reseau", "root", "");
				 HttpSession varS=request.getSession();
				 int id_recepteur= (Integer)varS.getAttribute("id");
				
				 PreparedStatement pst=con.prepareStatement("SELECT invitation.id_invit,utilisateur.nom,utilisateur.prenom,utilisateur.state FROM invitation,utilisateur WHERE invitation.id_user_emetteur =utilisateur.id_user and  etat='attente' and id_user_recepteur=? ");
			
				pst.setInt(1,id_recepteur);
				
				
				ResultSet rs=pst.executeQuery();
				
				while(rs.next()){
					String stateInit=(rs.getInt(4)==1)?"green":"red";
					%>
					<tr>
						<td style="width:30px;">
							<div class="img_cont">
				
									<a href="show_contact.jsp?id=<%=rs.getString(1)%>" ><img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img">
									</a>
						
						</div>
						</td>
						<td  style="margin-left:-100px;width:70px;"><%=rs.getString(2) %> <%=rs.getString(3)%> </td>
						<td style="display:flex;margin-top:15px;margin-left:50px; width:200px;">
							<a style="margin-left:-30px;" href="AcceptInvit?id=<%=rs.getString(1)%>">
								<button class="btn btn-sm btn-info" style="width:100px;" >Accepter</button>
							</a>
							<a style="margin-left:10px;margin-right:0px;"href="Refuser?id=<%=rs.getString(1)%>">
								<button class="btn btn-sm btn-danger" style="width:100px;" >Refuser</button>
							</a>
						</td>
						
					</tr>
	
    <%
				}
	rs.close();
	pst.close();
	con.close();
	
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


</body>
</html>