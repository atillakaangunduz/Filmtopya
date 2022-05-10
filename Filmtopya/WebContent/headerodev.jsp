<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Filmliyorum</title>
<link rel="stylesheet" type="text/css" href="stil.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
body{
margin: 0px;
padding: 0;
display: flex;
flex-direction: column;
}

#header{
background-color : #0B1621 ;
height: 100%;
width: auto;
color: azure;
display: flex;
justify-content:space-between;
padding: 1%;
}


#logo{
display: inline-block;
}

#giris{
display: inline-block;
height: 40%;
width: auto;
background-color: #0B1621;
color: aliceblue;
border: 0 px;
border-radius: 15%;
}

#kayit{
display: inline-block;
height: 40%;
width: auto;
background-color: #0B1621;
color: aliceblue;
border: 0 px;
border-radius: 15%;
}

#giris:hover{
background-color: #0B0d13;
border-radius: 15%;
}

#kayit:hover{
background-color: #0B0d13;
border-radius: 15%;
}

.overlay {
    height: 0%;
    width: 100%;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0, 0.9);
    overflow-y: hidden;
    transition: 0.5s;
  }
  
  .overlay-content {
    position: relative;
    top: 25%;
    width: 100%;
    text-align: center;
    margin-top: 30px;
  }
  
  .overlay a {
    padding: 8px;
    text-decoration: none;
    font-size: 36px;
    color: #818181;
    display: block;
    transition: 0.3s;
  }
  
  .overlay a:hover, .overlay a:focus {
    color: #f1f1f1;
  }
  
  .overlay .closebtn {
    position: absolute;
    top: 20px;
    right: 45px;
    font-size: 60px;
  }
  
  @media screen and (max-height: 450px) {
    .overlay {overflow-y: auto;}
    .overlay a {font-size: 20px}
    .overlay .closebtn {
    font-size: 40px;
    top: 15px;
    right: 35px;
    }
  }
  
  #menubutton{
display: inline-block;
height: 40%;
width: auto;
background-color: #0B1621;
color: aliceblue;
border: 0 px;
border-radius: 15%;
font-size: large;
  }
 #menubutton:hover{
    background-color: #060d13;
    border-radius: 15%;

    }

</style>


</head>
<body>
<div id= "header">
<div id="menubaslik">
<h1 id="logo">Filmtopya</h1>
<div id = "myNav" class="overlay">

<a href="javascript:void(0)" class="cclosebtn" onclick="closeNav()">&times;</a>

<div class="overlay-content">
<a href="#">About</a>

</div>

</div>

<button onclick="openNav()"  id= "menubutton"><i class= "fa fa-fw fa-bars"></i>Menu </button>

</div>

<div id="buttons">
<button id="giris">GİRİŞ YAP</button>
<button id="kayit">KAYIT OL</button>

</div>


</div>
</body>
<script>
function openNav(){
	document.getElementById("myNav").style.height ="100%"
}
function closeNav() {
	document.getElementById("myNav").style.height = "0%"
}

</script>


</html>