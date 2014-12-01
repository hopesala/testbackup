<%@ page contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import ="com.ht.servlet.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
<title>用户登陆</title>
  </head>
  
<body>
  <%
  Teacher teacher = new Teacher();
  String username = request.getParameter("username");
  String pwd = request.getParameter("pwd");
  teacher.setPassword(pwd);
  teacher.setUsername(username);
  teacher.check();
  if(teacher.isLogin())
   {
    System.out.println("success");
    session.setAttribute("teacher", teacher);
   %>
   <jsp:forward page="successt.jsp" />
   <% 
   }
  %>
   <jsp:forward page="Logint.jsp" />
  </body>
</html>  
