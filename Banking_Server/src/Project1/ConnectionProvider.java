package Project1;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

public static Connection getCon()
{
	try{
		System.out.println("kapil");
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/banking","root","");
		return con;
	}
	catch(Exception e)
	{
	return null;
	}
}
}
