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
    
    <title>My JSP 'Addbook.jsp' starting page</title>
    
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
      <form action="MybooktAdd.jsp">
      <% String day = request.getParameter("day");
      session.setAttribute("day",day);
      TeacherTimeWeek tmp=new TeacherTimeWeek();
      tmp.setWeek(Integer.valueOf(day)) ; 
       %>
           <p>  日期: <%=tmp.getWeeks() %> <p>
         <p>   开始时间:
          <select name="hour1">
 <%
 for (int i = 7; i <22; i++) {      
   if(i>=7 && i<10) 
   {
   %> 
    <option value="<%='0'+String.valueOf(i) %>" ><%='0'+String.valueOf(i)%></option>
    <% 
   }else{
   %>
   <option value="<%=String.valueOf(i) %>" ><%=String.valueOf(i)%></option>
   <%}
   } %>
 </select>
 :
  <select name="min1">
 <%
 for (int i = 0; i <60; i+=10) {  
  if(i==0) {  
   %> 
   <option value="<%="00" %>" ><%="00"%></option>
   <%}else{ %>
    <option value="<%=String.valueOf(i) %>" ><%=i%></option>
    <% 
   }
   }%>
 </select>
 <p>
 <p>
           结束时间:
<select name="hour2">
 <%
 for (int i = 7; i <22; i++) {    
   if(i>=7 && i<10) 
   {
   %> 
    <option value="<%='0'+String.valueOf(i) %>" ><%='0'+String.valueOf(i)%></option>
    <% 
   }else{
   %>
   <option value="<%=String.valueOf(i) %>" ><%=String.valueOf(i)%></option>
   <%}
   } %>
 </select>
 :
  <select name="min2">
 <%
 for (int i = 0; i <60; i+=10) {    
   if(i==0) {  
   %> 
   <option value="<%="00" %>" ><%="00"%></option>
   <%}else{ %>
    <option value="<%=String.valueOf(i) %>" ><%=i%></option>
    <% 
   }
   }%>
 </select>
 <p>
           事件（可不填）:<input type="text" name="thing"><br>
    <input type="submit" value="提交">
    </form>
  </body>
</html>
