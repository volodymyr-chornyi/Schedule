package com.softserveacademy.service.dao;

public class NoMatchesException extends Exception{
    public NoMatchesException() {
        super("By your request there are no matches in the database");
    }
}
