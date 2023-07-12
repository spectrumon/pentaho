
<html>
    <head>
        <title>Login System</title>
    </head>
 
    <body>
    
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    
    
        <%
        String email=(String)session.getAttribute("email");
        
        //redirect user to home page if already logged in
        if(email!=null){
            response.sendRedirect("index.jsp");
        }
 
        String status=request.getParameter("status");
        
        if(status!=null){
            if(status.equals("false")){
                   out.print("Incorrect login details!");                       
            }
            else{
                out.print("Some error occurred!");
            }
        }
        %>
    
    
    <div class="container">
    
    
    
        <form action="loginRequestHandler.jsp">
            <table class="table table-hover">
                <tr>
                    <td><b>Email:</b></td>
                    <td><input type="text" name="email" required/></td>
                </tr>
 
                <tr>
                    <td><b>Password:</b></td>
                    <td><input type="password" name="password" required/></td>
                </tr>
                
                
                
                
                <tr>
	<td>Role</td>
	<td> <select name="role" required>
   <option value="User">User</option>
   <option value="Admin">Admin</option>
   <option value="Super_Admin">Super_Admin</option></td>
  </select>
	</tr>
                
                
                
                
                <!--  
                
                <tr>
                    <td><b>role:</b></td>
                    <td><input type="text" name="role" required/></td>
                </tr>
                -->
 
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Login"/></td>
                </tr>
 
            </table>
        </form>
    
    </div>
    </body>
</html>