<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>

<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <style>
body{
    background-color: #060d13;
}    

h3{
color :  aliceblue;
}

.form-control {
      background-color: #060d13;
}
td{
background-color: #0B1621;
color :  aliceblue;
}

th{
background-color: #0B1621;
color :  aliceblue;
}

</style>
</head>
<jsp:include page="header2.jsp"/>
<p><br/></p>
      
<div class="row">
<div class="col-md-6">
<h3>Filmler</h3>
<form action="" method="get">
<input type="text" class="form-control" name="q" placeholder="Aramak istediğiniz film">
<input type="submit" value="Ara" class="btn btn-primary">
</form>


</div>
<div class="col-md-6">

</div>
</div>
<p></p>

<table class="table table-bordered table-striped table-hover"  >
<thead>

<tr> 
<th>ID</th>
<th>Film Adı</th>
<th>Katagori</th>
<th>Bilgi </th>
<th>Afiş </th>
<th>Düzenle</th>
</tr>
</thead>
<tbody>
<%
	//String host="jsbc:mysql://localhost:3306/mydb";
	Connection conn =null;
	Statement stat = null;
	ResultSet res =null;
	Class.forName("com.mysql.jdbc.Driver");
	conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","ab123");
	stat =conn.createStatement();

	
	%>
	<% 
	String query = request.getParameter("category-choice");
	String data;//ufak değişiklik
	if(query!=null)
	{
		data = "select * from movie where category= '%"+query+"%'";
	}
	else
	{
		data = "select * from movie order by movieName desc";
		
	}
	//String data = "select * from movie order by idmovie desc";
	res = stat.executeQuery(data);
	while(res.next())
	{	
		

	/*String data = "select * from movie order by idmovie desc";
	res = stat.executeQuery(data);
	while(res.next())
	{	*/
%>


<tr>
<td><%= res.getString("idmovie")%></td>
<td><%= res.getString("movieName")%></td>
<td><%= res.getString("category")%></td>
<td><%= res.getString("info")%></td>
<td><image src="<%=res.getString("filename")%>" width="150" height="200" /></td>
 <td>
<button class="btn btn-warning"><a href='edit-film.jsp?idmovie=<%=res.getString("idmovie")%>'>Düzenle </a></button>


</td>
</tr>

<%
	}
	
%>
</tbody>

</table>
<script>
document.getElementById("giris").onclick = function(){
	location.href= 'logout.jsp';
}
document.getElementById("kayit").onclick = function(){
	location.href= 'add-film.jsp';
}


</script>


</html>