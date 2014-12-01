<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import ="com.ht.servlet.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'registerpage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <%
  Student student = new Student();
  String username = request.getParameter("username");
  String pwd = request.getParameter("pwd");
  String name = request.getParameter("name");
  student.setName(name);
  student.setPassword(pwd);
  student.setUsername(username);
  student.setupcheck();
  if(student.isIsexi()==false)
   {
    System.out.println("success");
    session.setAttribute("account", student);
   %>
   <jsp:forward page="success.jsp" />
   <% 
   }
  %>
   <jsp:forward page="Login.jsp" />
  </body>
</html>
