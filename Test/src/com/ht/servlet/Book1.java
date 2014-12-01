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

public class Book1 extends HttpServlet {

 @Override
 protected void doPost(HttpServletRequest req, HttpServletResponse resp)
   throws ServletException, IOException {
  doGet(req,resp);
 }

 @Override
 public void doGet(HttpServletRequest req, HttpServletResponse resp)
   throws ServletException, IOException {

  String thing = req.getParameter("thing");
  String num = req.getParameter("num");
  Student st=(Student)req.getSession().getAttribute("account");
  String tti=(String)req.getSession().getAttribute("tti");
  dbconnection d = new dbconnection();
  Connection t = d.getConnection();
  int numed=1;
	Statement stmt;
	stmt=null;
	try {
		stmt = t.createStatement();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
	String sql="update  teachertime set time=\""+num+"\", thing=\""+thing+"\",timeed=\""+numed+"\" where teachertimeid=\""+tti+"\"";
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