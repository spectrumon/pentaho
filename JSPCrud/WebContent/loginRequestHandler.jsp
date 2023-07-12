<%@ page import="net.roseindia.bean.UserBean"%>
<%@ page import="net.roseindia.dao.UserDao"%>

<jsp:useBean id="UserBean" class="net.roseindia.bean.UserBean" scope="session"/>
<jsp:setProperty name="UserBean" property="*"/>
 
<%
String result=UserDao.loginCheck(UserBean);


 
if(result.equals("true")){
    session.setAttribute("email",UserBean.getEmail());
    //session.setAttribute("password",UserBean.getPassword());
    session.setAttribute("role",UserBean.getrole());
    
    response.sendRedirect("index.jsp");
}
 
if(result.equals("false")){
    response.sendRedirect("sindex.jsp?status=false");
}
 
if(result.equals("error")){
    response.sendRedirect("sindex.jsp?status=error");
}
 
%>