<%@ page contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
<title>学生登录</title>
  </head>
  
<body>
    <form action="login1">
              用户名:<input type="text" name="username"><br>
              密码:<input type="password" name="pwd" style="width: 173px; "><br>
    <input type="submit" value="登录" style="width: 204px; ">
    </form>
     <input type="button" value="返回" href='index.jsp'"  style="background:White;width: 201px;height:40px;font-size:20px;">
  </body>
</html>  
