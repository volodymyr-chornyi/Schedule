package com.softserveacademy.service.exception;

import com.softserveacademy.model.Event;

import java.util.Set;

public class IncorrectScheduleExcepttion extends Exception {

    public IncorrectScheduleExcepttion(Event event, Set<Event> events) {
        for (Event e : events) {
            if (e.equals(event)) {
                if (e.getTeacher().equals(event.getTeacher())) {
                    System.err.println("Teacher is busy at this time ");
                }
                if (e.getGroup().equals(event.getGroup())) {
                    System.err.println("Group is busy at this time ");
                }
                if (e.getRoom().equals(event.getRoom())) {
                    System.err.println("Room is busy at this time ");
                }
            }
        }
    }
}