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
  <table border="1">
  <tr>
  <td>日期</td>
  <td>时间</td>
  <td>事件</td>
  <td>总人数</td>
  <td>已预约人数</td>
  <td>老师姓名</td>
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
	 stmt1=null;
	 	try {
			stmt1 = t.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 stmt2=null;
	 	try {
			stmt2 = t.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 Student st=(Student)request.getSession().getAttribute("account");
	 String studentid=st.getStudentid();
	 String teachertimeid=null;
	 ResultSet rs=null;
	 ResultSet rs1=null;
	  ResultSet rs2=null;
	 String sql="select * from studenttime where studentid=\""+studentid+"\";";
		try {
		rs=stmt.executeQuery(sql);
		while(rs.next())
		{
		%>
		<tr>
		<% 
			teachertimeid=rs.getString(2);
		    String sql1="select * from teachertime where teachertimeid=\""+teachertimeid+"\";"; 
		try {
		rs1=stmt1.executeQuery(sql1);
			
		if(rs1.next())
		{	   
	        %>
	   <td><%=rs1.getString(2) %></td>
        <td><%=rs1.getString(6) %></td>
         <td><%=rs1.getString(7) %></td>
          <td><%=rs1.getString(4) %></td>
           <td><%=rs1.getString(5) %></td>
              
		<% 
		
		
		
		
		String sql2="select * from teacher where teacherid=\""+rs1.getString(3)+"\";"; 
		try {
		rs2=stmt2.executeQuery(sql2);
		if(rs2.next())
		{	   
	    %>		    
		 <td><%=rs2.getString(4) %></td>
		 <td><a href="Mybookdele.jsp?name=<%=teachertimeid%>"> 取消</a> </td> 
		 </tr>
		<% 	
		}
		}catch (Exception E) {
		E.printStackTrace();	
	     }
		}
		}catch (Exception E) {
		E.printStackTrace();	
	     }
		}
		}catch (Exception E) {
		E.printStackTrace();	
	     }
	     %>
	     </table>
	     <input type="button" value="return" onclick="window.location.href='success.jsp'"  style="background:White;width:400px;height:40px;font-size:20px;">
  </body>
</html>
