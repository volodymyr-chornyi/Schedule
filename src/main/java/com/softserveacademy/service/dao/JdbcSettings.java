package com.softserveacademy.service.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class JdbcSettings {

    private static final JdbcSettings INSTANCE = new JdbcSettings();

    private final Properties properties = new Properties();

    private JdbcSettings(){
        try {
            properties.load(new FileInputStream(this.getClass().getClassLoader().getResource("jdbc.properties").getFile()));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static JdbcSettings getInstance(){
        return INSTANCE;
    }

    public String value(String key){
        return this.properties.getProperty(key);
    }
}
