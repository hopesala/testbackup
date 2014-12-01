<%@ page contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import ="com.ht.servlet.*"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
<title>教师登陆</title>
  </head>
  
<body>
教师登陆
    <form action="Loginpage.jsp">
    <p>用户名:<input type="text" name="username"><br><p>
    <p>密码:<input type="password" name="pwd"><br><p>
    <input type="submit">
     <input type="button" value="返回" onclick="window.location.href='index.jsp'"  style="background:White;width:400px;height:40px;font-size:20px;">
    </form>
  </body>
</html>  
