<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3>JSP BUILT IN PROJECT</h3>

Request user agent : <%= request.getHeader("User-Agent") %>

<br> <br>

Request language : <%= request.getLocale() %>

<br><br>
<jsp:include page= "My-header.html"/>
<br>
ozlesemde seni bit ddesemde yine bitmese<br>
yillardir cekitgim bu hsaret cilemi<br>
<br><br>


<jsp:include page= "my-footer.jsp"/> 



</body>
</html>