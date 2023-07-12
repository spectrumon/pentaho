<<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="net.roseindia.bean.UserBean"%>
<%@ page import="net.roseindia.dao.UserDao"%>
<%@ page import="java.util.*"%>
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

<title>All User</title>
</head>
<body>


   <%
        String email=(String)session.getAttribute("email");
        String role=(String)session.getAttribute("role");
        //redirect user to login page if not logged in
        if(email==null){
            response.sendRedirect("sindex.jsp");
        }
        %>



<%
	//UserBean user = new UserBean();
	UserDao dao = new UserDao();
	List<UserBean> userList = dao.getAllUsers();
	//Iterator<UserBean> itr = userList.iterator();
%>
<div class="container">

<p>Welcome <%=email%></p>  
<a href="logout.jsp">Logout</a>


<table class="table table-hover">

<button class="btn danger">Admin Consol</button><br></br>
	<tr>
		<th>Emp_Id</th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>creation_time</th>
		<!--  <th>Present</th>
		      <th>Credit</th>
		-->
		
	</tr>
	<tr>
		<%
			
			for (UserBean user : userList) {
		%>
		<td><%=user.getId()%></td>
		<td><%=user.getfName()%></td>
		<td><%=user.getlName()%></td>
		<td><%=user.getcreation_time()%></td>
		<!--   <td><%=user.getPresent()%></td> -->
		
		
		<!-- <td><%=user.getCredit()%></td> -->
		
		
		<td><a
			href="UserHandler?action=Insertcredit&userId=<%=user.getId()%>">Add Credit</a></td>
	
		
		
		
		<%if(role.equals("Admin")){%>
		<td><a
			href="UserHandler?action=editform&userId=<%=user.getId()%>">Update</a></td>
		
		
		<td><a
			href="UserHandler?action=delete&userId=<%=user.getId()%>">Delete</a></td>
			
		
			<%}%>
        
	</tr>
	<%
		}
		//}
	%>
</table>


<!--  Testing---------------
<%if(role.equals("Admin")){%>

<p>Welcomeuuuuuuuuuuuuuuu Role <%=role%></p>

<%}%>
End Testing --------------- -->


<!-- 
<p><a href="UserHandler?action=insert">Add User</a></p>
<p><a href="UserHandler?action=ViewAttendata">View Attendance Data</a></p>
<p><a href="UserHandler?action=ViewSumAllRec">View Consolidated Data</a></p>
-->

<p><a href="index.jsp">Home</a></p>












</div>

</body>
</html>