String ADI = request.getParameter("fname");
String SOYAD = request.getParameter("SOYAD");
String il = request.getParameter("il");

<%@ page import="java.io.*" %>
<%@ page language="java" import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
public static void main(String[] argv) {

try
{

// Reflection
Class.forName("com.mysql.jdbc.Driver");
}
catch (ClassNotFoundException e)
{
System.out.println("MySQL driver bulunamadı");
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
System.out.println("Kullanıcı Adı ve Şifreniz Hatalı.");
return;
}
catch (Exception e)
{
System.out.println("Sistemsel bir hata oluştu");
return;
}

}
}
%>
