package com.softserveacademy.service.util;

import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class TableEditor {

    private Connection connection;
    private static Logger logger = Logger.getLogger(TableEditor.class);

    public TableEditor(Connection connection) {
        this.connection = connection;
    }

    public void editTable(String sql) {
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
    }
}
