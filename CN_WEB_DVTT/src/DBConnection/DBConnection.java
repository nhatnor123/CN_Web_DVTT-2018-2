package DBConnection;

import java.sql.DriverManager;
import java.sql.Connection;

public class DBConnection {
	private static final String USERNAME = "root";
    private static final String PASSWORD = "112233123";
    private static final String URL = "jdbc:mysql://localhost:3306/web";
    
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("connect successfully!");
        } catch (Exception ex) {
            System.out.println("connect failure!");
            ex.printStackTrace();
        }
        return conn;
    }

}