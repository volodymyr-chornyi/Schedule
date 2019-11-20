package com.softserveacademy.service.util;

import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcService {

    private static Logger logger = Logger.getLogger(JdbcService.class);
    private static Connection connection;
    static String URL = "jdbc:postgresql://localhost:5432/schedule";
    static String userName = "postgres";
    static String password = "p3747281";

    public static Connection getConnection() {
//        final JdbcSettings jdbcSettings = JdbcSettings.getInstance();
        try {
//            Class.forName("org.postgresql.Driver");
//
//            connection = DriverManager.getConnection(jdbcSettings.value("jdbc.url"),
//                                                    jdbcSettings.value("jdbc.username"),
//                                                    jdbcSettings.value("jdbc.password"));
            connection = DriverManager.getConnection(URL, userName, password);
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return connection;
    }

    public static void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                logger.error(e.getMessage(), e);
            }
        }
    }
}
