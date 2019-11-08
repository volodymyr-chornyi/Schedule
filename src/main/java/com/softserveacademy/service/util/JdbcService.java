package com.softserveacademy.service.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcService {

    private static Connection connection;

    public static Connection getConnection() {
        final JdbcSettings jdbcSettings = JdbcSettings.getInstance();
        try {
            connection = DriverManager.getConnection(jdbcSettings.value("jdbc.url"),
                                                    jdbcSettings.value("jdbc.username"),
                                                    jdbcSettings.value("jdbc.password"));
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
