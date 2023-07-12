<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Add New User</title>
</head>
<body>

   <%
        String email=(String)session.getAttribute("email");
        

   
        //redirect user to login page if not logged in
        if(email==null){
            response.sendRedirect("sindex.jsp");
        }
        %>








<div class="container">
<p>Welcome <%=email%></p>    
        <a href="logout.jsp">Logout</a>

<form method="POST" action='UserHandler' name="frmAddUser"><input
	type="hidden" name="action" value="insert" />





<table class="table table-hover">

<button class="btn danger">Create Employee Data </button> <br></br>

	<tr>
		<td>User ID</td>
		<td><input type="text" name="userid" /></td>
	</tr>
	<tr>
		<td>First Name</td>
		<td><input type="text" name="firstName" /></td>
	</tr>
	<tr>
		<td>Last Name</td>
		<td><input type="text" name="lastName" /></td>
	</tr>
	<!--  
	<tr>
		<td>Present</td>
		<td><input type="text" name="Present" /></td>
	</tr>
	
	
	<tr>
		<td>creation_time</td>
		<td><input type="text" name="creation_time" /></td>
	</tr>
	
	
	
	<tr>
		<td>Credit</td>
		<td><input type="text" name="Credit" /></td>
	</tr>
	
	-->
	
	
	<tr>
		<td></td>
		<td><input type="submit" value="Submit" /></td>
	</tr>
</table>
</form>

<p><a href="UserHandler?action=listUser">View-All-Records</a></p>
<p><a href="index.jsp">Home</a></p>

</div>
</body>
</html>