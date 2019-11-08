package com.softserveacademy.service;

import com.softserveacademy.model.*;
import com.softserveacademy.service.exception.IncorrectScheduleExcepttion;
import org.junit.Test;
import org.junit.runner.RunWith;
import java.time.DayOfWeek;
import org.junit.runners.JUnit4;
import static org.junit.Assert.assertEquals;

@RunWith(JUnit4.class)
public class ScheduleTest {

    Schedule schedule = new Schedule();
    Teacher teacher = new Teacher("Stepan", "Ivanov");
    Group group = new Group("102");
    Subject subject = new Subject("Phi");
    Room room = new Room(200, "2");
    EventCreator eventCreator = new EventCreator();
    Event event = eventCreator.setDayOfWeek(DayOfWeek.MONDAY)
                            .setNumberEvent(NumberEvent.SECOND)
                            .setTeacher(teacher)
                            .setGroup(group)
                            .setSubject(subject)
                            .setRoom(room)
                            .setSubjectToTeacher(teacher, subject)
                            .create();
    Event event2 = eventCreator.setDayOfWeek(DayOfWeek.FRIDAY)
                            .setNumberEvent(NumberEvent.SECOND)
                            .setTeacher(teacher)
                            .setGroup(group)
                            .setSubject(subject)
                            .setRoom(room)
                            .setSubjectToTeacher(teacher, subject)
                            .create();
    Event event3 = eventCreator.setDayOfWeek(DayOfWeek.FRIDAY)
                            .setNumberEvent(NumberEvent.FIFTH)
                            .setTeacher(teacher)
                            .setGroup(group)
                            .setSubject(subject)
                            .setRoom(room)
                            .setSubjectToTeacher(teacher, subject)
                            .create();

    public ScheduleTest() throws IllegalArgumentException {
    }

    @Test
    public void getEventList() {
        int size = schedule.getEvents().size();
        assertEquals(0, size);
    }

    @Test
    public void addEvent() throws IncorrectScheduleExcepttion {
        schedule.addEvent(event);
        schedule.addEvent(event2);
        schedule.addEvent(event3);
        assertEquals(3, schedule.getEvents().size());
    }

    @Test (expected = IncorrectScheduleExcepttion.class)
    public void addEventException() throws IncorrectScheduleExcepttion {
        schedule.addEvent(event);
        schedule.addEvent(event2);
        schedule.addEvent(event3);
        schedule.addEvent(event);
    }

    @Test
    public void getWeeklyEvents() throws IncorrectScheduleExcepttion {
        schedule.addEvent(event);
        schedule.addEvent(event2);
        schedule.addEvent(event3);
        assertEquals(3, schedule.getEvents().size());
    }

    @Test
    public void getDailyEvents() throws IncorrectScheduleExcepttion {
        schedule.addEvent(event);
        schedule.addEvent(event2);
        schedule.addEvent(event3);
        assertEquals(3, schedule.getEvents().size());
    }
}
