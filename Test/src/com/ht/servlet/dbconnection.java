package com.ht.servlet;


import java.sql.*;



public class dbconnection {
	  private Connection con =null;
	  public dbconnection() 
	  {
	   try{   
	       //����MySql��������   
	       Class.forName("com.mysql.jdbc.Driver") ;   
	       }catch(ClassNotFoundException e1){   
	       System.out.println("�Ҳ������������� ����������ʧ�ܣ�");   
	       e1.printStackTrace() ;   
	       } 
	   String url = "jdbc:mysql://localhost:3306/test" ;    
       String username = "root" ;   
       String password = "root" ;   
	       try{   
	        con = DriverManager.getConnection(url , username , password ) ;
	       }catch(SQLException se){   
	      System.out.println("���ݿ�����ʧ�ܣ�");   
	      se.printStackTrace() ;   
	         }   
	  }
	  public Connection getConnection()
	  {
	   return con;
	  }
	 }