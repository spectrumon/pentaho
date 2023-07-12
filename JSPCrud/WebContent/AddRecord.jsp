<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="net.roseindia.bean.UserBean"%>
<%@ page import="net.roseindia.dao.UserDao"%>

<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>


<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<form method="POST" action='UserHandler' name="frmEditUser"><input
	type="hidden" name="action" value="AddRecord" /> <%
 	String uid = request.getParameter("userId");
 	if (!((uid) == null)) {
 		int id = Integer.parseInt(uid);
 		user = dao.getAttenById(id);
		
 %>
 
 
 <div class="container">
 
 <p>Welcome <%=email%></p>    
        <a href="logout.jsp">Logout</a> <br>

<table class="table table-hover">

<button class="btn danger">Add  Attendance </button> <br>


	<tr>
		<td>User ID</td>
		<td><input type="text" name="userId" 
			value="<%=user.getId()%>"></td>
	</tr>
	<tr>
		<td>First Name</td>
		<td><input type="text" name="firstName"  value="<%=user.getfName()%>"/></td>
	</tr>
	<tr>
		<td>Last Name</td>
		<td><input type="text" name="lastName"  value="<%=user.getlName()%>"/></td>
	</tr>
	
	<tr>
	<td>Present</td>
	<td> <select name="Present">
   <option value="1">Present</option>
   <option value="0.5">Half Day</option>
   <option value="0">Absent</option></td>
  </select>
	</tr>
	
	
	   <%
         Date dNow = new Date( );
       
		  SimpleDateFormat ft2 = new SimpleDateFormat ("dd-MM-yyyy");
		  String dNow1 = user.getcreation_time();
	      SimpleDateFormat ft3 = new SimpleDateFormat ("yyyy-MM-dd");
	      SimpleDateFormat fmt = new SimpleDateFormat("dd-MM-yyyy");  

        
		  String syadate = fmt.format(dNow);
		  
		 // String syadate = "kk";
		// String db_date1 = "bb";


 
		 // if(!(dNowy1.equals(dNowz1) || (dNowy1.equals(null)) ))
			  
			 
			 // if( ((db_date1)==null) || (db_date1)!= (syadate) )
				 
				 
				 
				 
				 
				  if( (dNow1)==null ) 
		   { %> 

       <br> </br>
	<tr>
		<td></td>
		<td><input type="submit" value="Mark Attendance" /></td>
	</tr>
<% }
  
				 
				
				 
			 if( (dNow1)!=null ) 
		   { 	 
				
				
			      SimpleDateFormat ft1 = new SimpleDateFormat ("yyyy-MM-dd");
				  Date db_date = ft1.parse(dNow1);
				  String db_date1 = fmt.format(db_date);
				  
				  
				  // String syadate = "kk";
					// String db_date1 = "k";
				 // out.println(db_date1);
				 // out.println(syadate);
				 
				// out.write("<h4> Attendance already marked for "  + db_date1 +"</h4>" );
				  
				  if((db_date1)!= (syadate) ) 
		              { %> 
                           <h3>Attendance already marked</h3>
   
                      <% }
				  
    else { %>
                     <br> 
	                 <tr>
		            <td></td>
		            <td><input type="submit" value="Mark Attendance" /></td>
	                </tr>

    <% } %>
	
	 <% } %>


	
	
	
	
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