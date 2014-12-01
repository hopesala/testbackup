<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import ="com.ht.servlet.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'book1.jsp' starting page</title>
    
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
   <form action="Addbook.jsp">
   <p>选择日期<p>
  <select name="day">
 <%
 for (int i = 1; i <= 7; i++) { 
   TeacherTimeWeek tmp=new TeacherTimeWeek();
   tmp.setWeek(i);
   %> 
    <option value="<%=i %>" ><%=tmp.getWeeks()%></option>
    <% 
   }%>
 </select>
 <input type="submit" value="提交">
  <input type="button" value="登出" onclick="window.location.href='successt.jsp'"  style="background:White;width:400px;height:40px;font-size:20px;">
 </form>
  </body>
</html>
