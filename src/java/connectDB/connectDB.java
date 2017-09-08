package connectDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Pham Ngoc Phi
 */
public class connectDB {
    public static Connection getConnection() {
		// Create a variable for the connection string.
		String connectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=QuanLyTTTA;user=sa;password=phiphong";  

		// Declare the JDBC objects.
		Connection con = null;

		try {
			// Establish the connection.
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(connectionUrl);
		}

		// Handle any errors that may have occurred.
		catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	public static void main(String[] args) {
        System.out.println(getConnection());
    }
	
	public static void closeAll(Connection con, PreparedStatement pstmt, ResultSet rs) {
        if (con != null) {
            try {
                con.close();
            } catch (Exception e) {
            	e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (Exception e) {
            	e.printStackTrace();
            }
        }
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {
            	e.printStackTrace();
            }
        }
    }
}
