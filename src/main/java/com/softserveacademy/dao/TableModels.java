package com.softserveacademy.dao;

public class TableModels {

    public String teachersTable(){
        String sql = "CREATE TABLE IF NOT EXISTS TEACHERS " +
                    "(id serial primary key, " +
                    " age INTEGER, " +
                    " first_name VARCHAR(20), " +
                    " last_name VARCHAR(20))";
        return sql;
    }
}
