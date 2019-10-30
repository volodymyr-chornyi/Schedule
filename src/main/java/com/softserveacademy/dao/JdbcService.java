package com.softserveacademy.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcService {

    private Connection connection;
    private Statement statement;

    public JdbcService() {
        final JdbcSettings jdbcSettings = JdbcSettings.getInstance();
        try {
            this.connection = DriverManager.getConnection(jdbcSettings.value("jdbc.url"),
                                                          jdbcSettings.value("jdbc.username"),
                                                          jdbcSettings.value("jdbc.password"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void createTable(String sql) {
        try {
            statement = connection.createStatement();
            statement.executeUpdate(sql);
            System.out.println("Created table in given database...");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement!=null || connection!=null)
                    connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


}
