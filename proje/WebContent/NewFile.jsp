<%@page import="com.luv2code.jsp.FunUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>deneme</h1>

the time on server is <%= new java.util.Date() %>
<br><br>
25 multiplied by equals : <%= 25*4 %> <!-- basit islemler fonk  tanimlama -->
<br><br>
Is 75 less than 69? <%= 75 < 69 %>
<br><br>
Buyuk harf yapma <%= new String("Hello ").toUpperCase() %>
<br><br><br><br>

<%
for(int i = 0 ; i<=5; i++){
	out.println("</br> Sayma : " + i);
}

%>
<br><br><br><br>
<%! String tolower(String data){
	return data.toLowerCase();	
}%>

Return  data : <%= tolower("MERHABA") %>
<br><br><br><br>
<%= FunUtils.makeLower("DENEME")  %>



</body>
</html>