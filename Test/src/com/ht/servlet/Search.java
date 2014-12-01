package com.ht.servlet;
import com.ht.servlet.*;

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


public class Search extends HttpServlet {

 @Override
 protected void doPost(HttpServletRequest req, HttpServletResponse resp)
   throws ServletException, IOException {
  doGet(req,resp);
 }

 @Override
 public void doGet(HttpServletRequest req, HttpServletResponse resp)
   throws ServletException, IOException {
   HttpSession session = req.getSession();
   String name = req.getParameter("name");
   String teacherid=null;
	dbconnection d = new dbconnection();	
	Connection t = d.getConnection();
	Statement stmt=null;
	try {
		stmt = t.createStatement();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	ResultSet rs=null;

		String sql="select * from teacher where name=\""+name+"\"";
		try {
			rs=stmt.executeQuery(sql);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			if(rs.next())
			{
				
				teacherid=(rs.getString(2));
				 System.out.println("teacherid="+teacherid);
				 rs=null;
				
				 try {
						ResultSet rs1=null;
					   
						String sql1="select * from teachertime where teacherid=\""+teacherid+"\"";
						rs1=stmt.executeQuery(sql1);
						Teachertime tt [];
						tt = new Teachertime[40];
						TeacherTimeWeek ttw;
						ttw = new TeacherTimeWeek();
						for (int i = 0; i < 40; i++) 
						{ 
						tt[i] = new Teachertime () ; 
						}
						System.out.println("success="+teacherid);
						int j=0;
						while(rs1.next())
						{
							
							tt[j].setTeachertimeid(rs1.getString(1));
							tt[j].setDay(rs1.getString(2));
							ttw.setDay(rs1.getInt(2));
							tt[j].setTeacherid(rs1.getString(3));
							tt[j].setTime(rs1.getString(4));
							tt[j].setTimeed(rs1.getString(5));
							tt[j].setStime(rs1.getString(6));
							tt[j].setThing(rs1.getString(7));
							tt[j].setName(name);
							j++;
							
						}
						session.setAttribute("tt", tt);
						session.setAttribute("num", String.valueOf(j));
						session.setAttribute("ttw", ttw);
						String result = "ttr.jsp";
						  resp.sendRedirect(result);
			}catch (Exception E) {
			E.printStackTrace();
			}
			
}
			else
				resp.sendRedirect("searchfa.jsp");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 }
}
			 

 

 
