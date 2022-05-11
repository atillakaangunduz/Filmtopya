
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


</head>
<%
//read from data
String favLang = request.getParemeter("favoriteLanguage");


//create a cookie
Cookie theCookie = new Cookie("myApp.favoriteLanguage",favlang);

//set a life cycle

theCookie.setMaxAge(60*60*24*365);

//send the cookie
response.addCookie(theCookie);
 



%>
<body>
Thanks! ${param.favoriteLang }

</body>
</html>