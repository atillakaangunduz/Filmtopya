package com.Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class addfilmServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String cat , movieN, infof , image;
 public void doPost(HttpServletRequest req ,HttpServletResponse res) throws IOException {
	res.setContentType("text/html");
	 movieN = req.getParameter("fname");
	 cat = req.getParameter("category-choice");
	 infof = req.getParameter("finfo");
	 
	 PrintWriter out = res. getWriter();
		//out.println(movieName);
	 try
	 {

	 // Reflection
	 Class.forName("com.mysql.jdbc.Driver");
	 }
	 catch (ClassNotFoundException e)
	 {
	 System.out.println("MySQL driver bulunamadý");
	 return;
	 }
	 System.out.println("MYSQL Driver Kurulu!");
	 Connection conn = null;
	 try
	 {
	 conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","ab123");
	 String query = "insert into movie(category , info ,  movieName ) values (?,?,?)";
	  PreparedStatement ps= conn.prepareStatement(query);
	  
	  ps.setString(1, cat);
	  ps.setString(2, infof);
	  ps.setString(3, movieN);
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
	 System.out.println("Sistemsel bir hata oluþtu");
	 return;
	 }

 
 }
}
	 
 
 
 
 
 
 
 
 
 
 
 



