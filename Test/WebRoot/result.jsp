<%@ page contentType="text/html;charset=utf-8"%>
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
  该教师可预约的日期:
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
<%
String day=request.getParameter("day");
int DAY=Integer.valueOf(day); 
 %>
 
 
 
 	<table border="1">
 	<tr>
 	<td>日期</td>
 	<td>教师名字</td>
 	<td>具体时间</td>
 	<td>可预约总人数</td>
 	<td>已经预约人数</td>
 	<td>预约时间</td>
 	<td>预约</td>
 	</tr>
 	<%for(int i=0;i<Num;i++) 
 	{

 	if(tt[i].getDay().equals(day))
 	{%>
 	<tr>
 	<%  TeacherTimeWeek tmp=new TeacherTimeWeek();
 	 tmp.setWeek(Integer.valueOf(tt[i].getDay()));%>
 	<td><%=tmp.getWeeks() %></td>
 	<td><%=tt[i].getName() %></td>
    <td><%=tt[i].getStime() %></td>
    <%if(Integer.valueOf(tt[i].getTime())==0){%>
    <td>未设定</td>
    <td>未设定</td>
    <td>未设定</td>
    <td><a href="book1.jsp?timeid=<%=tt[i].getTeachertimeid()%> &name=<%=tt[i].getName()%>&time=<%=tt[i].getStime()%>&week=<%=tt[i].getDay()%>"> 可预约</a> </td> 
    <%}else {%>
      <td><%=tt[i].getTime() %></td>
        <td><%=tt[i].getTimeed() %></td>
          <td><%=tt[i].getThing() %></td>
          <%if(Integer.valueOf(tt[i].getTime())>Integer.valueOf(tt[i].getTimeed())) { %>
          <td><a href="book2.jsp?name=<%=tt[i].getTeachertimeid()%>"> 可预约</a> </td> 
          <% } else {%>
          <td>不可预约</td>
          <%}
          } %>
          
    <% }
    }%>
    </tr>
     
	</table>
	<input type="button" value="返回" onclick="window.location.href='success.jsp'"  style="background:White;width:400px;height:40px;font-size:20px;">
  </body>
</html>
