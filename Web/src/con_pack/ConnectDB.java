package con_pack;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectDB {
	public Connection connect()
	{
		Connection con=null;
		try{
			Context ctx=new InitialContext();
			DataSource ds=(DataSource)ctx.lookup("java:OracleDS");
			con=ds.getConnection();
		}catch(Exception e)
		{
			System.out.print(e);
		}
		return con;
	}
}
