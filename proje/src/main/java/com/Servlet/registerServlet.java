package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class registerServlet extends HttpServlet{

	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String user,email,age,password1,password2;
	 public void doPost(HttpServletRequest req ,HttpServletResponse res) throws IOException {
			res.setContentType("text/html");
			user = req.getParameter("isim");
			email = req.getParameter("eposta");
			age = req.getParameter("yas");
			password1 = req.getParameter("sifre");
			password2 = req.getParameter("sifre2");
			
		 PrintWriter out = res. getWriter();
			//out.println(movieName);
		 try
		 {

		 // Reflection
		 Class.forName("com.mysql.jdbc.Driver");
		 }
		 catch (ClassNotFoundException e)
		 {
			 e.printStackTrace();
		 System.out.println("MySQL driver bulunamadý");
		 return;
		 }
		 System.out.println("MYSQL Driver Kurulu!");
		 
		 Connection conn = null;
		 try
		 {
		 conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","ab123");
		 String query = "insert into user(username , age ,  password , email  ) values (?,?,?,?)";
		  PreparedStatement ps= conn.prepareStatement(query);
		  
		  ps.setString(1, user);
		  ps.setString(2, age);
		  ps.setString(3, password1);
		  ps.setString(4, email);
		//  ps.setString(5, password2);
		  ps.executeUpdate();
		 out.println("basarýlý");
		 /*Statement statement= (Statement) conn.createStatement();
		 ResultSet myRs = statement.executeQuery("Select * from user");
		 while(myRs.next()) {
		 	System.out.println(myRs.getString("username"));
		 }
	*/
		 System.out.println("MYSQL ILE BASARILI BIR SEKILDE BAGLANTI KURULDU");

		 }
		 catch (SQLException e)
		 {
			 e.printStackTrace();
		 System.out.println("Kullanýcý Adý ve Þifreniz Hatalý.");
		 return;
		 }
		 catch (Exception e)
		 {
			 e.printStackTrace();
		 System.out.println("Sistemsel bir hata oluþtu");
		 return;
		 }

	 
	 }
	}
		 