<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="net.roseindia.bean.UserBean"%>
<%@ page import="net.roseindia.dao.UserDao"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




<title>Edit User</title>
</head>

<body>
     <%
        String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
            response.sendRedirect("sindex.jsp");
        }
        %>




<%
	UserBean user = new UserBean();
%>
<%
	UserDao dao = new UserDao();
%>
<form method="POST" action='UserHandler' name="frmEditUser1"><input
	type="hidden" name="action" value="AddRecord" /> <%
 	String uid = request.getParameter("userId");
 	if (!((uid) == null)) {
 		int id = Integer.parseInt(uid);
 		user = dao.getUserById(id);
 %>
 
 
 <div class="container">
 
 <p>Welcome <%=email%></p>    
        <a href="logout.jsp">Logout</a> <br>

<table class="table table-hover">

<button class="btn danger">Add  Attendance And Credit </button> <br>


	<tr>
		<td>User ID</td>
		<td><input type="text" name="userId" readonly="readonly"
			value="<%=user.getId()%>"></td>
	</tr>
	<tr>
		<td>First Name</td>
		<td><input type="text" name="firstName" readonly="readonly" value="<%=user.getfName()%>"/></td>
	</tr>
	<tr>
		<td>Last Name</td>
		<td><input type="text" name="lastName" readonly="readonly" value="<%=user.getlName()%>"/></td>
	</tr>

	 
	<tr>
		<td>Credit</td>
		<td><input type="text" name="Credit" value="<%=user.getCredit()%>"/></td>
	</tr>
	
	<!--  
	<tr>
		<td>creation_time</td>
		<td><input type="text" name="creation_time" value="<%=user.getcreation_time()%>"/></td>
	</tr>
	-->
	
	
	<tr>
	<td>Creadit_type</td>
	<td> <select name="Creadit_type">
   <option value="Customer">Customer</option>
   <option value="Employee">Employee</option>
   <option value="Other">Other</option></td>
  </select>
	</tr>
	
	
	<br> </br>
	<tr>
		<td></td>
		<td><input type="submit" value="Add Credit" /></td>
	</tr>
</table>
<p><a href="index.jsp">Home</a></p>
</div>
<%
	} else
		out.println("ID Not Found");
%>
</form>



</body>
</html>