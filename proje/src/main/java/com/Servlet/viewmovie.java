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

import com.mysql.cj.PreparedQuery;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSet;


public class viewmovie extends HttpServlet {

	private static final long serialVersionUID = 1L;
	java.sql.Connection conn;
	//PreparedStatement ps;
	java.sql.ResultSet rs;
	int row;
	
	public void doGet(HttpServletRequest req ,HttpServletResponse res) throws IOException{
		res.setContentType("text/html");
		PrintWriter out = res. getWriter();
		
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
		conn = (Connection) DriverManager
		.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "ab123");
		Statement statement= (Statement) conn.createStatement();
		ResultSet myRs = statement.executeQuery("Select * from user");
		while(myRs.next()) {
			System.out.println(myRs.getString("username"));
		}

		System.out.println("MYSQL ILE BASARILI BIR SEKILDE BAGLANTI KURULDU");

		}
		catch (SQLException e)
		{
		System.out.println("Kullanýcý Adý ve Þifreniz Hatalý.");
		return;
		}
		catch (Exception e)
		{
		System.out.println("Sistemsel bir hata oluþtu");
		return;
		}
		/*
		 try
		 {
		 Class.forName("com.mysql.jdbc.Driver");
		 conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","ab123");
		
		 String sql;
		 sql = "select * from user";
		 Statement stmt = conn.createStatement();
		 rs =  stmt.executeQuery(sql);
		 
		 out.println("<table cellspacing='0' width='350px' border='1'>");
		 
		 out.println("<tr>");
		 out.println("<td> Catagory </td>");
		 out.println("<td> Bilgi </td>");
		 out.println("<td> Adý </td>");
		 out.println("<td> Düzenle </td>");
		 out.println("<td> Sil </td>");
		 
		 out.println("</tr>");
		 
		 while(rs.next())
		 {
			 out.println("<tr>");
			 out.println("<td>" +rs.getString("category")+ "<td>");
			 out.println("<td>" +rs.getString("info")+ "<td>");
			 out.println("<td>" +rs.getString("movieName")+ "<td>");
			 out.println("<td>" +"<a href='Editreturn?movieName'" + rs.getString("movieName")+"'> Düzenle </a>" + "<td>");
			 out.println("<td>" +"<a href='Deletereturn?movieName'" + rs.getString("movieName")+"'> Sil </a>" + "<td>");

			 
			 out.println("</tr>");
			 
			 
			 
		 }
		 
		 
		 
		 out.println("</table>");
		 
		 }
		 catch (Exception e) {
			e.printStackTrace();
		}
	}*/

}
