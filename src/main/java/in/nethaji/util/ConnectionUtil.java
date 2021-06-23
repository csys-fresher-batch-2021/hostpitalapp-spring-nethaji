package in.nethaji.util;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

public class ConnectionUtil {
	
	private ConnectionUtil()
	{
		//Default Constructor
	}
	
	private static String driverClass = System.getenv("spring.datasource.driver-class-name");
	private static String url = System.getenv("spring.datasource.url");
	private static String username = System.getenv("spring.datasource.username");
	private static String password = System.getenv("spring.datasource.password");

	public static DataSource getConnection() {
		BasicDataSource db = new BasicDataSource();
		db.setDriverClassName(driverClass);
		db.setUrl(url);
		db.setUsername(username);
		db.setPassword(password);
		
		return db;
	}
}
