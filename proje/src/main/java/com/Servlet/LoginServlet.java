package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSet;

public class LoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String email,password;
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException {
		res.setContentType("text/html");
		
		email = req.getParameter("isim");
		password = req.getParameter("sifre");
		
		PrintWriter out = res.getWriter();
		
			
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
		 
		java.sql.Connection conn = null;
		 try
		 {
		 conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","ab123");
		 Statement stmt = conn.createStatement();
			String query1 = "select * from user where email= '"+email+"' and password='"+password+"'";
			java.sql.ResultSet rs =  stmt.executeQuery(query1);
			
			
			if(rs.next())
			{
				out.println("Giriþ Baþarýlý");
			} 
			
			else 
			{
				out.println("Giriþ Baþarýsýz");
			}
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
		
		
		/*try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "ab123");
			Statement stmt = con.createStatement();
			String query = "select * from users where useremail= '"+email+"' and userpass1='"+password+"'";
			ResultSet rs = (ResultSet) stmt.executeQuery(query);
			
			
			if(rs.next())
			{
				out.println("Giriþ Baþarýlý");
			} 
			
			else 
			{
				out.println("Giriþ Baþarýsýz");
			}
			
		}
		catch(Exception e) {
			out.println(e);
		}*/
		
	}

}
