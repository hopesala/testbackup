package com.ht.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Book2 extends HttpServlet {

 @Override
 protected void doPost(HttpServletRequest req, HttpServletResponse resp)
   throws ServletException, IOException {
  doGet(req,resp);
 }

 @Override
 public void doGet(HttpServletRequest req, HttpServletResponse resp)
   throws ServletException, IOException {
  HttpSession session = req.getSession();
  String tti=(String)req.getSession().getAttribute("tti");
  System.out.println("tti"+tti);
  Student st=(Student)req.getSession().getAttribute("account");  
  System.out.println("studentid="+st.getStudentid());
  dbconnection d = new dbconnection();
  Connection t = d.getConnection();
	Statement stmt;
	stmt=null;
	try {
		stmt = t.createStatement();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
	String sql1="select * from  studenttime  where teachertimeid=\""+tti+"\"and  studentid=\""+st.getStudentid()+"\";";
	ResultSet rs=null;
	rs=stmt.executeQuery(sql1);
	if(rs.next())
	{
		resp.sendRedirect("Mybookfa.jsp");
		return;
	}
	String sql="update  teachertime set timeed=timeed+1 where teachertimeid=\""+tti+"\";";
	stmt.executeUpdate(sql);
	sql="insert into studenttime values(\""+st.getStudentid()+"\", \""+tti+"\")";
	stmt.executeUpdate(sql);
	t.close();
	 resp.sendRedirect("Mybook.jsp");
	}catch (Exception E) {
	E.printStackTrace();	
}
 }
}