package util;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;

public class DBConnection {
	private static DBConnection dBConnection;
    private static Connection connection;

    private DBConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineBiddingSystem", "root", "1234");
    }

    public static DBConnection getInstance() throws ClassNotFoundException, SQLException {
        if (dBConnection == null || connection.isClosed()) {
            dBConnection = new DBConnection();
        }
        return dBConnection;
    }

    public Connection getConnection() {
        return connection;
    }
}
