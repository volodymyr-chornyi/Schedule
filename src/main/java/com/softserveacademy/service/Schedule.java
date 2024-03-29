package com.softserveacademy.service;

import com.softserveacademy.model.*;
import com.softserveacademy.service.exception.IncorrectAddingException;
import java.time.DayOfWeek;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

public class Schedule {

    private Set <Event> events = new HashSet<>();

    public Set<Event> getEvents() {
        return events;
    }

    public void addEvent(Event event) throws IncorrectAddingException {
        if (events.contains(event))
            throw new IncorrectAddingException();
        else
            events.add(event);
    }

    public void addEvent(Set<Event> set) throws IncorrectAddingException {
        for (Event event: set) {
            this.addEvent(event);
        }
    }

    public Set<Event> getWeeklyEvents (Object object){
        if(object instanceof Subject)
            return events.stream()
                         .filter(event -> event.getSubject().equals(object))
                         .collect(Collectors.toSet());
        if(object instanceof Group)
            return events.stream()
                         .filter(event -> event.getGroup().equals(object))
                         .collect(Collectors.toSet());
        if(object instanceof Room)
            return events.stream()
                         .filter(event -> event.getRoom().equals(object))
                         .collect(Collectors.toSet());
        if(object instanceof Teacher)
            return events.stream()
                         .filter(event -> event.getTeacher().equals(object))
                         .collect(Collectors.toSet());
        if (object instanceof Student)
            return events.stream()
                         .filter(event -> event.getGroup().getStudents().contains(object))
                         .collect(Collectors.toSet());
        else
            throw new IllegalArgumentException();
    }

    public Set<Event> getDailyEvents (Object object, DayOfWeek dayOfWeek){
        return getWeeklyEvents(object).stream()
                                 .filter(event -> event.getDayOfWeek().equals(dayOfWeek))
                                 .collect(Collectors.toSet());
    }
}
