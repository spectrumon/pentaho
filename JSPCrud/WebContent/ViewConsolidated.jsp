<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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



<title>view Detail Attendance</title>
</head>


   <%
        String email=(String)session.getAttribute("email");
        String role=(String)session.getAttribute("role");
        
        //redirect user to login page if not logged in
        if(email==null){
            response.sendRedirect("sindex.jsp");
        }
        %>








<body>
<%
	//UserBean user = new UserBean();
	UserDao dao = new UserDao();
	//List<UserBean> userList = dao.getAllUsers();
	
	 List<UserBean> userList = dao.getSum();
	
	//Iterator<UserBean> itr = userList.iterator();
%>
<div class="container">
<p>Welcome <%=email%></p>    
        <a href="logout.jsp">Logout</a>
<br><p><a href="index.jsp">Home</a></p> <br>

<table class="table table-hover">

<button class="btn danger">view Consolidated  Attendance And Credit</button> <br></br>


	<tr>
		<th>Emp_Id</th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Total Attendance</th>
		<th>Total Credit</th>
		<th>User_Type</th>
		<th>creation_time</th>
		
	</tr>
	<tr>
		<%
			/*while(itr.hasNext())
			 {
			 System.out.println(user.getId());*/
			for (UserBean user : userList) {
		%>
		<td><%=user.getId()%></td>
		<td><%=user.getfName()%></td>
		<td><%=user.getlName()%></td>
		<td><%=user.getPresent()%></td>
		<td><%=user.getCredit()%></td>
		<td><%=user.getCreadit_type()%></td>
		<td><%=user.getcreation_time()%></td>
		
		
		<td>
		 
		<%if(role.equals("Admin")){%>
		<a
			href="UserHandler?action=deleteSum&userId=<%=user.getId()%>">Delete</a></td>
		<td>
		<%}%>
		
		
		
		
		<!-- 
		
		<a
			href="UserHandler?action=delete&userId=<%=user.getId()%>">Delete</a></td>
         <td><a
			href="UserHandler?action=InsertRec&userId=<%=user.getId()%>">Mark Today's Attendance</a></td>
	-->
	
	
	
	</tr>
	<%
		}
		//}
	%>
	
	
	

	
	
</table>
<!--  <p><a href="UserHandler?action=insert">Add User</a></p> -->
<p><a href="index.jsp">Home</a></p>
</div>
</body>
</html>