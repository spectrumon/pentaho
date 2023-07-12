
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


<title>HPS Attendance Management system</title>

<style>
.btn {
    border: none;
    color: white;
    padding: 14px 28px;
    font-size: 16px;
    cursor: pointer;
}

.success {background-color: #4CAF50;} /* Green */
.success:hover {background-color: #46a049;}

.info {background-color: #2196F3;} /* Blue */
.info:hover {background: #0b7dda;}

.warning {background-color: #ff9800;} /* Orange */
.warning:hover {background: #e68a00;}

.danger {background-color: #f44336;} /* Red */ 
.danger:hover {background: #da190b;}

.default {background-color: #e7e7e7; color: black;} /* Gray */ 
.default:hover {background: #ddd;}

.default {background-color: #666699; color: black;} /* Gray */ 
.default:hover {background: #b3b3cc;}





</style>

</head>
<body>
   <%
        String email=(String)session.getAttribute("email");
        String role=(String)session.getAttribute("role");
        
        //redirect user to login page if not logged in
        if(email ==null){
            response.sendRedirect("sindex.jsp");
        }
        %>

<div class="container">

<p>Welcome <%=email%></p>   
 <a href="logout.jsp">Logout</a> <br>


<button class="btn danger">Hotel HPS Creadit and Attendance Management System</button>
<br>
<button class="btn info" onclick="window.location.href='index.jsp'">Home</button>

<button class="btn info" onclick="window.location.href='user.jsp'">Add Employee</button>
<button class="btn success" onclick="window.location.href='UserHandler?action=listUser'">View Records</button>
<button class="btn success" onclick="window.location.href='UserHandler?action=listUserAtten'">Manage Attendance</button>



<%if(role.equals("Admin")){%>
<button class="btn success" onclick="window.location.href='UserHandler?action=listUserCredit'">Manage Credit</button>
<button class="btn success" onclick="window.location.href='UserHandler?action=totalAtten'">Total Attendance</button>

<button class="btn success" onclick="window.location.href='UserHandler?action=totalCredit'">Total Credit</button>

<button class="btn warning" onclick="window.location.href='UserHandler?action=ViewSumAllRec'">View All Consolidated Record</button>
<button class="btn danger" onclick="window.location.href='UserHandler?action=ViewAttendata'">View Transaction Detail </button>


<%}%>

<br></br>

<!-- <p><a href="user.jsp">Add user</a></p> -->

</div>



</body>
</html>














