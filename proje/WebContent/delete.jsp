<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<% 
String idmovie =request.getParameter("idmovie");
int no = Integer.parseInt(idmovie);
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection  conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","ab123");
Statement stat = conn.createStatement();
stat.executeUpdate("delete from movie where idmovie='"+no+"'");
response.sendRedirect("viewmovie-admin.jsp");
%>