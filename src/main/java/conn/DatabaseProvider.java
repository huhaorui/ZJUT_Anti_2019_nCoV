package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseProvider {
    private final static String server = "101.132.194.207:3306";
    private final static String database = "zjut_health_code";
    private final static String uri = "jdbc:mysql://" + server + "/" + database + "?useUnicode=true&characterEncoding=utf8";
    private final static String user = "zjut_health_code";
    private final static String password = "123456zjut";

    public static Connection getConn() {
        if (conn == null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(uri, user, password);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
        return conn;
    }

    private static Connection conn = null;

}
