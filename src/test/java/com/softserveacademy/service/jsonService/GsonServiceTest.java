package com.softserveacademy.service.jsonService;

import com.softserveacademy.model.*;
import com.softserveacademy.service.EventCreator;
import com.softserveacademy.service.Schedule;
import com.softserveacademy.service.exception.IncorrectAddingException;
import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.time.DayOfWeek;
import java.util.Set;

import static org.junit.Assert.*;

public class GsonServiceTest {

    Schedule schedule = new Schedule();
    Teacher teacher = new Teacher("Stepan", "Ivanov");
    Group group = new Group("102");
    Subject subject = new Subject("Phi");
    Room room = new Room("100", "2");
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
    final File emptyFile = new File("emptyTestFile.json");
    final File testFile = new File("testFile.json");

    GsonService gsonService = new GsonService();

    public GsonServiceTest() throws IllegalArgumentException {
    }

    @Test
    public void writeEventListToFile() throws IOException, IncorrectAddingException {
        File emptyFile = this.emptyFile;
        if(emptyFile.exists())
            emptyFile.delete();
        emptyFile.createNewFile();
        teacher.addSubjects(subject);
        schedule.addEvent(event);
        schedule.addEvent(event2);
        gsonService.writeEventListToFile(emptyFile, schedule.getEvents());
        assertNotEquals(0, emptyFile.length());
    }

    @Test
    public void readEventsFromFile() {
        File testFile = this.testFile;
        Set<Event> set;
        set = gsonService.readEventsFromFile(testFile);
        assertTrue (set.size() > 0);
    }

    @Test
    public void addEventsFromFileToEventList() throws IncorrectAddingException {
        File testFile = this.testFile;
        int startSize = schedule.getEvents().size();
        gsonService.addEventsFromFileToEventList(testFile, schedule);
        int endSize = schedule.getEvents().size();
        assertTrue(endSize > startSize);
    }
}