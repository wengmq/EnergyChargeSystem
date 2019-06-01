package util;


import java.sql.*;


public class JDBCUtil {
   private static String driverName = "com.mysql.jdbc.Driver";	
   private static String url = "jdbc:mysql://localhost:3306/DB43";
    private static String userName = "root";
    private static String password = "990124";

 

    public static Connection getConnection() throws SQLException {		//链接呢数据库
    	try {//连接驱动
            Class.forName(driverName);// 驱动注册
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("找不到驱动");
        }
    	
    	
    	//连接数据库
        Connection conn = null;
        System.out.println("正在连接数据库...");
        conn = DriverManager.getConnection(url, userName, password);
        System.out.println("数据库已连接!");
        return conn;

    }

    public static void closeConnection(Connection conn) {	//关闭数据库
    	//关闭数据库
        System.out.println("正在释放所有资源...");

        if (conn != null) {
            try {
                conn.close();
                conn = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    /*
     * 释放所有资源
     */
    public static void realeaseAll(ResultSet rs, Statement st, Connection conn,PreparedStatement pre) {	//释放资源
        if (rs != null) {
            try {
                rs.close();
                rs = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (st != null) {
            try {
                st.close();
                st = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pre != null) {
            try {
                pre.close();
                pre = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        closeConnection(conn);
    }


}
