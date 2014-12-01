<%@ page contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import ="com.ht.servlet.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Mybook.jsp' starting page</title>
    
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
  <p>我的空挡<p>
  <table border="1">
  <tr>
  <td>日期</td>
  <td>时间</td>
  <td>事件</td>
  <td>总人数</td>
  <td>已预约人数</td>
  <td>操作</td>
  </tr>
    <%
     dbconnection d = new dbconnection();
     Connection t = d.getConnection();
	 Statement stmt,stmt1,stmt2;
	 stmt=null;
	 	try {
			stmt = t.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 Teacher te=(Teacher)request.getSession().getAttribute("teacher");
	 String teacherid=te.getTeacherid();
	 %>
	 <% 
	 ResultSet rs=null;
	 ResultSet rs1=null;
	  ResultSet rs2=null;
	 String sql="select * from teachertime where teacherid=\""+teacherid+"\";";
		try {
		rs=stmt.executeQuery(sql);
		while(rs.next())
		{
		 TeacherTimeWeek tmp=new TeacherTimeWeek();
        tmp.setWeek(Integer.valueOf(rs.getString(2))) ;
		%>
		<tr>
		<td><%=tmp.getWeeks()%></td>
		<td><%=rs.getString(6)%></td>
		<td><%=rs.getString(7)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><a href="Mybooktdele.jsp?name=<%=rs.getString(1)%>"> 取消</a> </td> 
		<% 
		}
		}catch (Exception E) {
		E.printStackTrace();	
	     }
	     %>
	     </table>
	     <input type="button" value="return" onclick="window.location.href='successt.jsp'"  style="background:White;width:400px;height:40px;font-size:20px;">
  </body>
</html>
