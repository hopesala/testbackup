<%@ page contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*"%>
<%@ page import ="com.ht.servlet.*"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MybooktAdd.jsp' starting page</title>
    
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
   String thing = request.getParameter("thing");
   String Starttime = request.getParameter("hour1")+':'+request.getParameter("min1");
   String Endtime = request.getParameter("hour2")+':'+request.getParameter("min2");
   String stime=Starttime+'-'+Endtime;
   String day = (String)session.getAttribute("day");
   Teacher te=(Teacher)session.getAttribute("teacher");
   String teacherid=te.getTeacherid();
   int time=0;
   %>
  <%
  dbconnection d = new dbconnection();
  Connection t = d.getConnection();
  Statement stmt;
	stmt=null;
	ResultSet rs=null;
	try {
		stmt = t.createStatement();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
	String sql="select * from teachertime;";
	rs=stmt.executeQuery(sql);
	int Teachertimeidint=0;
	while (rs.next()) 
	{
	Teachertimeidint=rs.getInt(1)+1;
	}
	
	String Teachertimeid=String.valueOf(Teachertimeidint);
	String sql1="insert into teachertime values(\""+Teachertimeid+"\", \""+day+"\",\""+teacherid+"\", \""+time+"\",\""+time+"\", \""+stime+"\",\""+thing+"\")";
	stmt.executeUpdate(sql1);
	t.close();
	}catch (Exception E) {
	E.printStackTrace();	
}
   %>
    <jsp:include  page="Mybookt.jsp"/>
  </body>
</html>
