package com.softserveacademy.service.exception;

import com.softserveacademy.model.Group;

public class NoMatchesException extends Exception{

    public NoMatchesException() {
        super("By your request there are no matches in the database");
    }
    public NoMatchesException(Group group) {
        super("This student study not in this group");
    }
}
