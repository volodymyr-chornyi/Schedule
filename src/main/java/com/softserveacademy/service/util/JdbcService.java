package com.softserveacademy.service.util;

import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcService {

    private static Logger logger = Logger.getLogger(JdbcService.class);
    private static Connection connection;

    public static Connection getConnection() {
        final JdbcSettings jdbcSettings = JdbcSettings.getInstance();
        try {
            Class.forName("org.postgresql.Driver");

            connection = DriverManager.getConnection(jdbcSettings.value("jdbc.url"),
                                                    jdbcSettings.value("jdbc.username"),
                                                    jdbcSettings.value("jdbc.password"));
        } catch (SQLException | ClassNotFoundException e) {
            logger.error(e);
        }
        return connection;
    }

    public static void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                logger.error(e);
            }
        }
    }
}
