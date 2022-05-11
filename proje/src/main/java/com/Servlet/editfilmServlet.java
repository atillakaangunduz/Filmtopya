package com.Servlet;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.PartialResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)

public class editfilmServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String cat , movieN, infof , image,id;
   public void doPost(HttpServletRequest req ,HttpServletResponse res) throws IOException , ServletException{
	   final String UPLOAD_DIR = "images";
	   String dbFileName = "";
	 res.setContentType("text/html");
	 id = req.getParameter("id");
	 movieN = req.getParameter("fname");
	 cat = req.getParameter("category-choice");
	 infof = req.getParameter("finfo");
	 
	 //PrintWriter out = res. getWriter();
		//out.println(movieName);
	 
	 Part part = req.getPart("file");//
     String fileName = extractFileName(part);//file name
     
     String applicationPath = getServletContext().getRealPath("");
     String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
     System.out.println("applicationPath:" + applicationPath);
     File fileUploadDirectory = new File(uploadPath);
     if (!fileUploadDirectory.exists()) {
         fileUploadDirectory.mkdirs();
     }
     String savePath = uploadPath + File.separator + fileName;
     System.out.println("savePath: " + savePath);
     String sRootPath = new File(savePath).getAbsolutePath();
     System.out.println("sRootPath: " + sRootPath);
     part.write(savePath + File.separator);
     //File fileSaveDir1 = new File(savePath);
     /*if you may have more than one files with same name then you can calculate some random characters
      and append that characters in fileName so that it will  make your each image name identical.*/
     dbFileName = UPLOAD_DIR + File.separator + fileName;
     part.write(savePath + File.separator);

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
	 Statement stat = null;
	  PreparedStatement stmt = null;
	  ResultSet myRs = null;
	 try
	 {
		 Connection conn =null;
		 Statement stat = null;
		 ResultSet myRs =null;
		 PreparedStatement stmt = null;
		 Class.forName("com.mysql.jdbc.Driver");
		 conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","ab123");
		 stat = conn.createStatement();
	        String idmovie =req.getParameter("idmovie");
	        int num = Integer.parseInt(idmovie);
	        myRs = stat.executeQuery("select * from movie where idmovie = '"+num+"'");
	        while(myRs.next()){
	        
	        }
	        
	       /* String a = req.getParameter("idmovie");
	        String movieN = req.getParameter("fname");
	        String cat = req.getParameter("category-choice");
	        String infof = req.getParameter("finfo");
*/
	        if(a!=null && movieN != null && cat!=null && infof != null){
	        	String query = "update movie set movieName=?, info=?, category=? where idmovie='"+a+"'";
	        	stmt = conn.prepareStatement(query);
	        	stmt.setString(1,movieN);
	        	stmt.setString(2,infof);
	        	stmt.setString(3,cat);
	        	stmt.executeUpdate();
	        	
	        	String query1 = "select * from user where iduser";
	        	java.sql.ResultSet rs =  stat.executeQuery(query1);


	        	if(rs.next())
	        	{
	        		if (rs.getInt("iduser") == 1) {
	        			res.sendRedirect("viewmovie-admin.jsp");				
	        			}
	        		
	        		//HttpSession anasayfa = request.getSession(true);
	        		//response.sendRedirect("viewmovie-user.jsp");
	        		
	        		//out.println("Giriþ Baþarýlý");
	        	} 

	        	else
	        	res.sendRedirect("viewmovie-user.jsp");
		 
		 
	 }
	 conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","ab123");
	 //tring query = "insert into movie(category , info ,  movieName,filename,path) values (?,?,?,?,?)";
	 // PreparedStatement ps= conn.prepareStatement(query);
	 
	  stat = conn.createStatement();
	  String a = req.getParameter("idmovie");
	  String movieN = req.getParameter("fname");
	  String cat = req.getParameter("category-choice");
	  String infof = req.getParameter("finfo");
     
      int num = Integer.parseInt(a);
      myRs = stat.executeQuery("select * from movie where idmovie = '"+num+"'");
      while(myRs.next()){
    	  

	/*  String a = req.getParameter("idmovie");
	  String movieN = req.getParameter("fname");
	  String cat = req.getParameter("category-choice");
	  String infof = req.getParameter("finfo");*/

	   if(a!=null && movieN != null && cat!=null && infof != null) {
	  	String query = "update movie set movieName=?, info=?, category=? , filename=?,path=? where idmovie='"+a+"'";
	  	stmt = conn.prepareStatement(query);
	  	stmt.setString(1,movieN);
	  	stmt.setString(2,infof);
	  	stmt.setString(3,cat);
	  	stmt.setString(4, dbFileName);
	  	stmt.setString(5, savePath);
	  	stmt.executeUpdate(query);
	  }
	  
	  stat = conn.createStatement();
		String query1 = "select * from user where iduser";
		java.sql.ResultSet rs =  stat.executeQuery(query1);

	
		if(rs.next())
		{
			if (rs.getInt("iduser") == 1) {
				res.sendRedirect("viewmovie-admin.jsp");				
				}
			
			//HttpSession anasayfa = request.getSession(true);
			//response.sendRedirect("viewmovie-user.jsp");
			
			//out.println("Giriþ Baþarýlý");
		}
	  }

	  res.sendRedirect("viewmovie-user.jsp");
	 //out.println("basarýlý");
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
	 return; }
	 }
   
	 private String extractFileName(Part part) {//This method will print the file name.
	       String contentDisp = part.getHeader("content-disposition");
	        String[] items = contentDisp.split(";");
	        for (String s : items) {
	            if (s.trim().startsWith("filename")) {
	                return s.substring(s.indexOf("=") + 2, s.length() - 1);
	            }
	        }
			return "";}}

 
   

	 
 
 
 
 
 
 
 
 
 
 
 



