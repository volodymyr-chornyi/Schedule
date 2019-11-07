package com.softserveacademy.service;

import com.softserveacademy.model.entities.*;

import java.time.DayOfWeek;

public class EventCreator {

    private DayOfWeek dayOfWeek;
    private NumberEvent numberEvent;
    private Teacher teacher;
    private Group group;
    private Subject subject;
    private Room room;

    public EventCreator setDayOfWeek(DayOfWeek dayOfWeek){
        this.dayOfWeek = dayOfWeek;
        return this;
    }

    public EventCreator setNumberEvent(NumberEvent numberEvent){
        this.numberEvent = numberEvent;
        return this;
    }

    public EventCreator setTeacher(Teacher teacher){
        this.teacher = teacher;
        return this;
    }

    public EventCreator setGroup(Group group){
        this.group = group;
        return this;
    }

    public EventCreator setSubject(Subject subject){
        this.subject = subject;
        return this;
    }

    public EventCreator setRoom(Room room){
        this.room = room;
        return this;
    }

    public EventCreator setSubjectToTeacher(Teacher teacher, Subject subject){
        teacher.addSubjects(subject);
        return this;
    }

    public Event create() throws IllegalArgumentException {
        Event event = new Event();
        event.setDayOfWeek(dayOfWeek);
        event.setNumberEvent(numberEvent);
        event.setTeacher(teacher);
        event.setGroup(group);
        event.setSubject(subject);
        event.setRoom(room);
        return event;
    }

}
