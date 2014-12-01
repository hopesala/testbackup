<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
    <base href="<%=basePath%>">
    
    <title>在线预约首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
  .cao {
	text-align: center;
	font-family: "Comic Sans MS", cursive;
}
  </style>
  </head>
  
  <body>
  <h1 class="cao">Welcome To the Online Campus Appointment!</h1>
  	<hr>
  <img src="flower.PNG" width="977" height="713" alt="flower">
  	<style type="text/css">

body{background:url(flower.png);}

</style>
  	<a href="Login.jsp" data-role="button" class= "cao">StudentLogin</a>
  		<a href="register.jsp" data-role="button" class= "cao">StudentRegister</a>
  		<a href="Logint.jsp" data-role="button"class= "cao">TeacherLogin</a>
  		<a href="registert.jsp" data-role="button"class= "cao">TeacherRegister</a>
  	<input type="button" value="学生登录"
  		onclick="window.location.href='Login.jsp'"
  		style="background:White;width: 100px;height:40px;font-size:20px;">
  	<input type="button" value="学生注册"
  		onclick="window.location.href='register.jsp'"
  		style="background:White;width: 100px;height:40px;font-size:20px;">
  	<input type="button" value="教师登陆"
  		onclick="window.location.href='Logint.jsp'"
  		style="background:White;width: 100px;height:40px;font-size:20px;">
  	<input type="button" value="教师注册"
  		onclick="window.location.href='registert.jsp'"
  		style="background:White;width: 100px;height:40px;font-size:20px;">
  	<br>
  	
  	<div data-role="controlgroup" id="buttons-1">
  	<a href="AboutUs.jsp" data-role="button" class= "cao">AboutUs</a>
  		<a href="Login.jsp" data-role="button" class= "cao">StudentLogin</a>
  		<a href="register.jsp" data-role="button" class= "cao">StudentRegister</a>
  		<a href="Logint.jsp" data-role="button"class= "cao">TeacherLogin</a>
  		<a href="registert.jsp" data-role="button"class= "cao">TeacherLogin</a>
	</div>
  	
  </body>
</html>
