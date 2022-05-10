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

.register
{
width: 300px;
padding:40px;
position:absolute;
top: 57.5%;
left:50%;
transform: translate(-50%,-50%);
background: #191919;
text-align:center;
}

.register h1
{
color: white;
text-transform:uppercase;
font-weight:500;
}

.register input[type="text"],.register input[type= "password"]
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
.register input[type="text"]:focus, .register input[type="password"]:focus
{
width: 280px;
border-color: #2ecc71;

}

.register input[type="submit"]
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

.register input[type="submit"]:hover
{
 background: #2ecc71;

}

#buttons #kayit
{
visibility: hidden;
}

#buttons #giris
{
float:right;
}
</style>

</head>
<body>
<jsp:include page="header.jsp"/>

<form class ="register"action="register " method="post">
<h1>KAYIT OL</h1>
<input type="text" name="isim" placeholder="Kullanıcı Adı">
<input type="text" name="eposta" placeholder="E-posta">
<input type="text" name="yas" placeholder="Yaş">
<input type="password" name="sifre" placeholder="Şifre">
<input type="password" name="sifre2" placeholder="Şifre tekrar girin">

<input type="submit" value="Kayıt">

</form>

<script>
document.getElementById("giris").onclick = function(){
	location.href= 'login.jsp';
}

</script>



</body>
</html>