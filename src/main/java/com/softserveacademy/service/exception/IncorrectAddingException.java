package com.softserveacademy.service.exception;

import com.softserveacademy.model.*;

public class IncorrectAddingException extends Exception{

    public IncorrectAddingException(Teacher teacher) {
        super(teacher.getName() + " data is already exists in the database");
    }

    public IncorrectAddingException(Subject subject) {
        super(subject.getName() + " data is already exists in the database");
    }

    public IncorrectAddingException(Student student) {
        super(student.getName() + " data is already exists in the database");
    }

    public IncorrectAddingException(Room room) {
        super("The room is already in the database");
    }

    public IncorrectAddingException(Group group) {
        super("The group is already in the database");
    }

    public IncorrectAddingException(Event event, Event existingEvent) {
        if (event.getTeacher().equals(existingEvent.getTeacher()))
            System.err.println("Teacher is busy at this time ");
        if (event.getGroup().equals(existingEvent.getGroup()))
            System.err.println("Group is busy at this time ");
        if (event.getRoom().equals(existingEvent.getRoom()))
            System.err.println("Room is busy at this time ");
    }

    public IncorrectAddingException(Teacher teacher, Subject subject){
        System.err.println("The teacher know nothing about selected subject");
    }

    public IncorrectAddingException() {
        System.err.println(" is busy at this time ");
    }
}
