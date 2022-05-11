<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

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
      
          
          </div>
          
         
      
          
    </div>

    

        <div id="buttons">

        <button id="giris">ÇIKIŞ YAP</button>
        
       

</div>  
    </div>

<%
Connection conn =null;
Statement stat = null;
ResultSet res =null;
PreparedStatement stmt = null;
Class.forName("com.mysql.jdbc.Driver");
conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","ab123");
//stat =conn.createStatement();
//String data = "select * from movie order by movieName desc";
//res = stat.executeQuery(data);
%>
    <div id="maincontent">
        <form  id="filminfo" method="post" action =""  autocomplete="off"> 
        <%
        stat = conn.createStatement();
        String idmovie =request.getParameter("idmovie");
        int num = Integer.parseInt(idmovie);
        res = stat.executeQuery("select * from movie where idmovie = '"+num+"'");
        while(res.next()){
        
        
        %>
		<input type = "hidden" name="id" value='<%=res.getString("idmovie") %>'/>
          <div id="film-img" class="film-pic-div">
            <img id="img1" src="image.png">
            <input type="file" id="file">
            <label for="file" id="uploadBtn">Afiş Ekle</label>
          </div>


        <script src="app.js"></script>
    
   <br/>
        <label for="fname">Film İsmi </label><br/>
        <input  type="text" id="fname" name="fname"  value='<%=res.getString("movieName") %>'/>
        <br/><br/>

        <label for="finfo">Film Bilgisi </label>
        <br/>
           <input type="text" id="finfo" name="finfo"   value='<%=res.getString("info") %>'/><br><br>

        <label for="category-choice" id="categoryselection">Kategoriyi Seçiniz:</label>
        <input list="category-flavors" id="category-choice" name="category-choice" value='<%=res.getString("category") %>' />
  <datalist id="category-flavors">
           <option value="Komedi">
            <option value="Aksiyon">
            <option value="Romantik">
            <option value="Korku">
            <option value="Animasyon">
            <option value="Drama">
            <option value="Süper Kahraman">
        </datalist>
        
        
		<%
        }
		%>
        <br/>
        <input type="submit" value="Update" id="submit">

       
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
document.getElementById("giris").onclick = function(){
	location.href= 'logout.jsp';
}
    

</script>
        
        
</html>


<%
String a = request.getParameter("idmovie");
String movieN = request.getParameter("fname");
String cat = request.getParameter("category-choice");
String infof = request.getParameter("finfo");
if(a!=null && movieN != null && cat!=null && infof != null){
	String query = "update movie set movieName=?, info=?, category=? where idmovie='"+a+"'";
	stmt = conn.prepareStatement(query);
	stmt.setString(1,movieN);
	stmt.setString(2,infof);
	stmt.setString(3,cat);
	stmt.executeUpdate();
	

	
	
		//HttpSession anasayfa = req.getSession(true);
		response.sendRedirect("viewmovie-user.jsp");

		//
		
		//HttpSession anasayfa = request.getSession(true);
		//out.println("Giriş Başarılı");
	} 
	
	 
	//response.sendRedirect("viewmovie.jsp");
	


%>