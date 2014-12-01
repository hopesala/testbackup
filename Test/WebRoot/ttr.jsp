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
    
    <title>My JSP 'ttr.jsp' starting page</title>
    
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
  <form action="result.jsp">
<% Teachertime[] tt=(Teachertime[])session.getAttribute("tt");
   String num=(String)session.getAttribute("num");
   TeacherTimeWeek ttw=(TeacherTimeWeek)session.getAttribute("ttw");
   int Num=Integer.valueOf(num);
 %>
 该教师可预约的日期
  <select name="day">
 <%
 for (int i = 1; i <= 7; i++) {  
   if(ttw.getDay(i)==1)
   {
   TeacherTimeWeek tmp=new TeacherTimeWeek();
   tmp.setWeek(i);
   %> 
    <option value="<%=i %>" ><%=tmp.getWeeks()%></option>
    <% 
   }
}%>
 </select>
 <input type="submit" value="查询">
 </form>
  </body>
</html>
