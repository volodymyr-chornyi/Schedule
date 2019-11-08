package com.softserveacademy.service.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class TableEditor {

    private Connection connection;

    public TableEditor(Connection connection) {
        this.connection = connection;
    }

    public void editTable(String sql) {
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
