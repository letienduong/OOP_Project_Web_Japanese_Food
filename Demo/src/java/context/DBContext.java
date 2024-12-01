package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {

    /*USE BELOW METHOD FOR YOUR DATABASE CONNECTION FOR BOTH SINGLE AND MULTIPLE MYSQL SERVER INSTANCE(s)*/
    /*DO NOT EDIT THE BELOW METHOD, YOU MUST USE ONLY THIS ONE FOR YOUR DATABASE CONNECTION*/
    public Connection getConnection() throws Exception {
        String url = "jdbc:mysql://" + serverName + ":" + portNumber + "/" + dbName + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, userID, password);
    }

    /*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
    private final String serverName = "localhost";
    private final String dbName = "wish";
    private final String portNumber = "3306";
    private final String userID = "root"; // Thay "root" bằng tên người dùng của bạn
    private final String password = "cochomoibiet1"; // Thay "password" bằng mật khẩu của bạn

    /* Main method to test the database connection */
    public static void main(String[] args) {
        DBContext dbContext = new DBContext();
        try {
            Connection conn = dbContext.getConnection();
            if (conn != null) {
                System.out.println("Kết nối cơ sở dữ liệu thành công!");
                conn.close();
            }
        } catch (Exception e) {
            System.err.println("Kết nối cơ sở dữ liệu thất bại!");
            e.printStackTrace();
        }
    }
}
