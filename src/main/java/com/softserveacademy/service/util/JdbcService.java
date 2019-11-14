package com.softserveacademy.service.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class JdbcService {

    private static Connection connection;
    static String URL = "jdbc:postgresql://localhost:5432/schedule";
    static String userName = "postgres";
    static String password = "p3747281";

    public static Connection getConnection() {
//        final JdbcSettings jdbcSettings = JdbcSettings.getInstance();
        try {
//            Class.forName("org.postgresql.Driver");

//            connection = DriverManager.getConnection(jdbcSettings.value("jdbc.url"),
//                                                    jdbcSettings.value("jdbc.username"),
//                                                    jdbcSettings.value("jdbc.password"));
            connection = DriverManager.getConnection(URL, userName, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
