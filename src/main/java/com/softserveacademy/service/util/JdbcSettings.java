package com.softserveacademy.service.util;

import org.apache.log4j.Logger;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class JdbcSettings {

    private static final JdbcSettings INSTANCE = new JdbcSettings();
    private static Logger logger = Logger.getLogger(JdbcSettings.class);

    private final Properties properties = new Properties();

    private JdbcSettings(){
        try {
            properties.load(new FileInputStream("jdbc.properties"));
//            properties.load(new FileInputStream(this.getClass().getClassLoader().getResource("jdbc.properties").getFile()));
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
    }

    public static JdbcSettings getInstance(){
        return INSTANCE;
    }

    public String value(String key){
        return this.properties.getProperty(key);
    }
}
