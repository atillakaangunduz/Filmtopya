<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>Giriş Yap</title>

<style>
body {
margin:0;
padding:0;
font-family;sans-serif;
background-color:#060D13;
}

.giris
{
width: 300px;
padding:40px;
position:absolute;
top: 50%;
left:50%;
transform: translate(-50%,-50%);
background: #191919;
text-align:center;
}

.giris h1
{
color: white;
text-transform:uppercase;
font-weight:500;
}

.giris input[type="text"],.giris input[type= "password"]
{
border:0;
background: none;
display:block;
margin: 20px auto;
text-align:center;
border: 2px solid #3498db;
padding: 14px 10px;
width: 200px;
outline: none;
color:white;
border-radius:24px;
transition: 0.25s;

}
.giris input[type="text"]:focus, .giris input[type="password"]:focus
{
width: 280px;
border-color: #2ecc71;

}

.giris input[type="submit"]
{
border:0;
background:0;
display:block;
margin: auto;
text-align:center;
border: solid 2px #2ecc71;
padding: 14px 40px;
outline: none;
color:white;
border-radius: 24px;
transition: 0.25s;
cursor:pointer;
}

.giris input[type="submit"]:hover
{
 background: #2ecc71;

}

#buttons #giris
{
visibility: hidden;
}
</style>

</head>
<body>
<jsp:include page="header.jsp"/>

<form class ="giris"action="login" method="post">
<h1>GİRİŞ</h1>
<input type="text" name="isim" placeholder="Kullanıcı Adı">
<input type="password" name="sifre" placeholder="Şifre">
<input type="submit" value="Giriş">

</form>

<script>
document.getElementById("kayit").onclick = function(){
	location.href= 'register.jsp';
}

</script>


</body>
</html>