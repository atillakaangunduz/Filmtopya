<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="stil.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>

body{
    background-color: #060d13;
}    


      #maincontent {
    text-align: center;
    background-color: #060d13;
    margin: 0.1%;
    width: 100%;
    height: 100%;
    color: aliceblue;
  }
  #img1{
      margin: -5%;
      width: 110%;
      height: 110%;
  }

  #film-img{
      height: 20%;
      width: 10%;
       position:absolute;
      left: 50%;
       top: 70%;
      transform: translate(-50%,-50%);



  }
  
</style>

</head>
<body>
    <div id= "header">
        <div id="menubaslik">
        <h1 id = "logo">Filmtopya</h1>
        <div id="myNav" class="overlay">

            <!-- Button to close the overlay navigation -->
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
          
            <!-- Overlay content -->
            <div class="overlay-content">
              <a href="#">About</a>
              <a href="#">Services</a>
              <a href="#">Clients</a>
              <a href="#">Contact</a>
            </div>
          
          </div>
          
          <!-- Use any element to open/show the overlay navigation menu -->
          <button onclick="openNav()", id="menubutton"><i class="fa fa-fw fa-bars"></i> Menu </button>
          
    </div>

    

        <div id="buttons">

        <button id="giris">GİRİŞ YAP</button>
        <button id="kayit">KAYIT OL</button>
       

</div>  
    </div>


    <div id="maincontent">
        <form  id="filminfo" method="post" action ="addfilm" > 
        

          <div id="film-img" class="film-pic-div">
            <img id="img1" src="image.png">
            <input type="file" id="file">
            <label for="file" id="uploadBtn">Afiş Ekle</label>
          </div>


        <script src="app.js"></script>
    
   <br/>
        <label for="fname">Film İsmi </label><br/>
        <input type="text" id="fname" name="fname"><br><br>

        <label for="finfo">Film Bilgisi </label>
        <br/>
           <input type="text" id="finfo" name="finfo"><br><br>

        <label for="category-choice" id="categoryselection">Kategoriyi Seçiniz:</label>
        <input list="category-flavors" id="category-choice" name="category-choice" />
        
        <datalist id="category-flavors">
            <option value="Chocolate">
            <option value="Coconut">
            <option value="Mint">
            <option value="Strawberry">
            <option value="Vanilla">
        </datalist>
        

        <br/>
        <input type="submit" value="Submit" id="submit">

       
    </form>


    </div>
</body>

<script>
    /* Open */
function openNav() {
  document.getElementById("myNav").style.height = "100%";
}

/* Close */
function closeNav() {
  document.getElementById("myNav").style.height = "0%";
}
    

</script>
        
        
</html>