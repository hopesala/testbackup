package com.ht.servlet;


import java.sql.*;



public class dbconnection {
	  private Connection con =null;
	  public dbconnection() 
	  {
	   try{   
	       //加载MySql的驱动类   
	       Class.forName("com.mysql.jdbc.Driver") ;   
	       }catch(ClassNotFoundException e1){   
	       System.out.println("找不到驱动程序类 ，加载驱动失败！");   
	       e1.printStackTrace() ;   
	       } 
	   String url = "jdbc:mysql://localhost:3306/test" ;    
       String username = "root" ;   
       String password = "root" ;   
	       try{   
	        con = DriverManager.getConnection(url , username , password ) ;
	       }catch(SQLException se){   
	      System.out.println("数据库连接失败！");   
	      se.printStackTrace() ;   
	         }   
	  }
	  public Connection getConnection()
	  {
	   return con;
	  }
	 }