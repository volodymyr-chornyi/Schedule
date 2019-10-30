package com.softserveacademy.service;

import com.softserveacademy.model.*;

import java.time.DayOfWeek;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

public class Schedule {

    private Set <Event> events = new HashSet<>();

    public Set<Event> getEvents() {
        return events;
    }

    public void addEvent(Event event) throws IllegalArgumentException {
        if (events.contains(event))
            throw somethingWentWrongException(event);
        else
            events.add(event);
    }

    public IllegalArgumentException somethingWentWrongException(Event event) {
        String string = "Busy at this time: ";
        for (Event e: events) {
            if (e.equals(event)) {
                if(e.getTeacher().equals(event.getTeacher())){
                    string.concat("teacher ");
                }
                if (e.getGroup().equals(event.getGroup())){
                    string.concat("group ");
                }
                if(e.getRoom().equals(event.getRoom())){
                    string.concat("room ");
                }
            }
        }
        return new IllegalArgumentException(string);
    }

    public void addEvent(Set<Event> set) throws IllegalArgumentException {
        for (Event event: set) {
            this.addEvent(event);
        }
    }

    public Set<Event> getWeeklyEvents (Object o){
        if(o instanceof Subject)
            return events.stream()
                         .filter(event -> event.getSubject().equals(o))
                         .collect(Collectors.toSet());
        if(o instanceof Group)
            return events.stream()
                         .filter(event -> event.getGroup().equals(o))
                         .collect(Collectors.toSet());
        if(o instanceof Room)
            return events.stream()
                         .filter(event -> event.getRoom().equals(o))
                         .collect(Collectors.toSet());
        if(o instanceof Teacher)
            return events.stream()
                         .filter(event -> event.getTeacher().equals(o))
                         .collect(Collectors.toSet());
        if (o instanceof Student)
            return events.stream()
                         .filter(event -> event.getGroup().getStudents().contains(o))
                         .collect(Collectors.toSet());
        else
            throw new IllegalArgumentException();
    }

    public Set<Event> getDailyEvents (Object o, DayOfWeek dayOfWeek){
        return getWeeklyEvents(o).stream()
                                 .filter(event -> event.getDayOfWeek().equals(dayOfWeek))
                                 .collect(Collectors.toSet());
    }
}
