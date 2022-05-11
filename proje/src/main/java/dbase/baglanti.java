package dbase;

import java.nio.channels.SelectableChannel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.cj.jdbc.BlobFromLocator;



class baglanti {
public static void main(String[] argv) {

try
{

// Reflection
Class.forName("com.mysql.jdbc.Driver");
}
catch (ClassNotFoundException e)
{
System.out.println("MySQL driver bulunamadý");
return;
}
System.out.println("MYSQL Driver Kurulu!");
Connection conn = null;
try
{
conn = (Connection) DriverManager
.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "ab123");
Statement statement= (Statement) conn.createStatement();
ResultSet myRs = statement.executeQuery("Select * from user");
while(myRs.next()) {
	System.out.println(myRs.getString("username"));
}

System.out.println("MYSQL ILE BASARILI BIR SEKILDE BAGLANTI KURULDU");

}
catch (SQLException e)
{
System.out.println("Kullanýcý Adý ve Þifreniz Hatalý.");
return;
}
catch (Exception e)
{
System.out.println("Sistemsel bir hata oluþtu");
return;
}

}



}