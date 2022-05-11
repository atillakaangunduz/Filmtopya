<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

The student is confirmed : ${param.firstname} ${param.lastname }
<br/>
Country is : ${param.country }
<br/>
Favorite languges is : ${param.favoritelanguges}
<br/>
<ul>
<%
String[] langs = request.getParameterValues("favoriteslanguge");

 for (String tempLang : langs) {
	 out.println("<li>" + tempLang + "</li>");
 }

%>
</ul>
</body>
</html>