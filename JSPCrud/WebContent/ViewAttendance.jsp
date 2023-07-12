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
<body>




   <%
        String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
            response.sendRedirect("sindex.jsp");
        }
        %>





<%

	//UserBean user = new UserBean();
	UserDao dao = new UserDao();
	//List<UserBean> userList = dao.getAllUsers();
	
	List<UserBean> userList = dao.getAtten();
	
	//Iterator<UserBean> itr = userList.iterator();
%>
<div class="container">
<p>Welcome <%=email%></p>  
<a href="logout.jsp">Logout</a><br>



<button class="btn danger">View  Attendance Detail </button> <br></br>


<table class="table table-hover">
	<tr>
		<th>Emp_Id</th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Present</th>
		<th>Credit</th>
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
		<!--  
		
		<a
			href="UserHandler?action=editform&userId=<%=user.getId()%>">Update</a></td>
		<td><a
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
<!--   <p><a href="UserHandler?action=insert">Add User</a></p> -->
<p><a href="index.jsp">Home</a></p>

</div>
</body>
</html>