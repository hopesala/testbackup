package com.ht.servlet;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Student {
	private String username,name;
	private String password,studentid;
	private boolean isLogin,isexi;
	public boolean isIsexi() {
		return isexi;
	}
	public void setIsexi(boolean isexi) {
		this.isexi = isexi;
	}
	public Student(){
		username=null;
		name=null;password=null;studentid=null;
		isLogin=false;
		isexi=false;
	}
	public boolean isLogin() {
		return isLogin;
	}
	public void setLogin(boolean isLogin) {
		this.isLogin = isLogin;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}



	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void check()
	{	
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
    	ResultSet rs=null;
		try {
		String sql="select * from student where username=\""+username+"\"and password=\""+password+"\"";
		rs=stmt.executeQuery(sql);
		if(rs.next())
		{
			name=rs.getString(3);
			studentid=rs.getString(4);
			setName(name);
			setStudentid(studentid);
		    System.out.println("name:"+rs.getString(4));
            isLogin=true;
		}
		else {
			 isLogin=false;
		}
		rs.close();
		t.close();
		}catch (Exception E) {
		E.printStackTrace();	
	}
		
	}
	public void setupcheck()
	{	
		System.out.println("ALL:"+username+password+name);
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
    	ResultSet rs=null;
		try {
		String sql="select * from student where username=\""+username+"\";";
		rs=stmt.executeQuery(sql);
		if(rs.next())
		{
		    System.out.println("exit:");
            isexi=true;
		}
		else {
			 System.out.println("sdsadasd");
			isexi=false;
			String sql1="select count(*) from student;";
			rs=stmt.executeQuery(sql1);
			if (rs.next()) 
			{
			setStudentid(String.valueOf(rs.getInt(1)+1));
			}
			System.out.println("studenid:"+studentid);
			sql="insert into student values(\""+username+"\", \""+password+"\",\""+name+"\", \""+studentid+"\")";
			stmt.executeUpdate(sql);
			
			
		}
		rs.close();
		t.close();
		}catch (Exception E) {
		E.printStackTrace();	
	}
		
	}
		
}
		
	
	

