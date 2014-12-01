package com.ht.servlet;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Teacher {
	  private String username , password,name,teacherid;
		private boolean isLogin,isexi;
	  public boolean isIsexi() {
			return isexi;
		}
		public void setIsexi(boolean isexi) {
			this.isexi = isexi;
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
	public String getTeacherid() {
		return teacherid;
	}
	public void setTeacherid(String teacherid) {
		this.teacherid = teacherid;
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
		String sql="select * from teacher where username=\""+username+"\"and password=\""+password+"\"";
		rs=stmt.executeQuery(sql);
		if(rs.next())
		{
			name=rs.getString(4);
			System.out.println("Name:"+name);
			setName(name);
			teacherid=rs.getString(2);
		    
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
		String sql="select * from teacher where username=\""+username+"\";";
		rs=stmt.executeQuery(sql);
		if(rs.next())
		{
		    System.out.println("exit:");
            isexi=true;
		}
		else {
			 System.out.println("sdsadasd");
			isexi=false;
			String sql1="select count(*) from teacher;";
			rs=stmt.executeQuery(sql1);
			if (rs.next()) 
			{
			setTeacherid(String.valueOf(rs.getInt(1)+1));
			System.out.println("teacherID:"+teacherid);
			}
			
			sql="insert into teacher values(\""+username+"\", \""+teacherid+"\",\""+password+"\", \""+name+"\")";
			stmt.executeUpdate(sql);
			
			
		}
		rs.close();
		t.close();
		}catch (Exception E) {
		E.printStackTrace();	
	}
		
	}
		




}
