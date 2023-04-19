<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
    

<%@page import= "java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>

<%@page import= "connexBD.MySQLDatabase" %>




    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>



 
  
  

  
  <%
	Connection con= MySQLDatabase.getConnexion();
  HttpSession varS=request.getSession();
	int id= (Integer)varS.getAttribute("id");
  ResultSet rs = con.createStatement().executeQuery("Select * from Utilisateur where id_user = "+id);
  
  %>
  
  <% while(rs.next()) { %>
  
  <div class="card">
  <div class="d-flex justify-content-center align-items-center vh-100">
  
   <div class="card mx-auto">
  <div class="card-body">
  <h3> Profil </h3>
  <br/>

   <img src="<%= "./"+rs.getString(10) %>" alt="Avatar" > <br/> 
  
     <div class="text-center mb-4">
    <h5 class="card-title">Nom :  <%=  rs.getString(2) %></h5>
    <h5 class="card-title"> Prénom: <%=  rs.getString(3) %> </h5>
    </div> <br/>
<%--     <h6 class="card-subtitle mb-2 text-muted">Profession :<%=  rs.getString(10) %> </h6>
 --%>   <%--  <p class="card-text">Description: <%=  rs.getString(11) %> </p> --%>
    <ul class="list-group list-group-flush">
     
      <li class="list-group-item"><strong>Email:</strong> <%=  rs.getString(4) %></li>
      <li class="list-group-item"><strong>Date de naissance:</strong> <%=  rs.getString(6) %></li>
      <li class="list-group-item"><strong>Profession:</strong><%=  rs.getString(8) %></li>
      <li class="list-group-item"><strong>État:</strong> <%=  rs.getString(7) %> </li>
      <li class="list-group-item"><strong>Description:</strong> <%=  rs.getString(9) %></li>
    </ul>
  </div>
  <div class="card-footer">
    <button class="btn btn-primary"> <a href="Update" style="text-decoration:none; color:white;">Update</a> </button>
   
    <button class="btn btn-danger">Supprimer</button>
  </div>
</div>
 </div>
  </div>
  
    <%
    }
    %>
  
  
<%--   <table>
  
  <tr><th> Id: </th><th> Nom: </th><th> Prenom: </th><th> Email: </th><th> Date de Naissance: </th><th> etat Familiale: </th><th> Profession: </th><th> Description: </th></tr>
  
  <% while(rs.next()) { %>
  <h1> Hiiiiiiiiiiiiiiiii<%=  rs.getString(3) %>  </h1>
    <tr><th><%= rs.getInt(1) %> </th><th> <%=  rs.getString(2) %> </th><th> <%=  rs.getString(3) %> </th><th> <%=  rs.getString(4) %> </th>
    <th> <%=  rs.getString(8) %> </th><th> <%=  rs.getString(9) %> </th><th> <%=  rs.getString(10) %> </th><th> <%=  rs.getString(11) %> </th>
    <th> <a href="Update">Update</a> </th>
    </tr>
    
    <%
    }
    %> --%>
  
  </table> 
  




</body>
</html>