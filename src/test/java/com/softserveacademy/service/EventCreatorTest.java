package com.softserveacademy.service;

import com.softserveacademy.model.*;
import java.time.DayOfWeek;
import org.junit.Test;

import static org.junit.Assert.*;

public class EventCreatorTest {

    private EventCreator eventCreator = new EventCreator();
    Teacher teacher = new Teacher("Stepan", "Ivanov");
    Group group = new Group("102");
    Subject subject = new Subject("Phi");
    Room room = new Room(200, "2");

    @Test (expected = IllegalArgumentException.class)
    public void create() {
        Event event = null;
        event = eventCreator.setDayOfWeek(DayOfWeek.MONDAY)
                            .setNumberEvent(NumberEvent.FIRST)
                            .setTeacher(teacher)
                            .setGroup(group)
                            .setSubject(subject)
                            .setRoom(room)
                            .create();
        event = eventCreator.setDayOfWeek(DayOfWeek.MONDAY)
                            .setNumberEvent(NumberEvent.FIRST)
                            .setTeacher(teacher)
                            .setGroup(group)
                            .setSubject(subject)
                            .setRoom(room)
                            .setSubjectToTeacher(teacher, subject)
                            .create();
        assertFalse(event.equals(null));
    }
}