package com.softserveacademy.objectgenerator;

import com.softserveacademy.model.*;

import java.time.DayOfWeek;
import java.util.Random;

/**
 * An instance of this class is used to generate a random Event
 * or a random instances of other models
 */
public class ObjectGenerator {

    private Teacher teacher;
    private Group group;
    private Room room;
    private Subject subject;
    private Student student;
    Random random = new Random();

    /**
     * Creates a new random 20 characters long String.
     * It used to generate names
     */
    public String generateString(){
        char[] chars = "abcdefghijklmnopqrstuvwxyz".toCharArray();
        StringBuilder sb = new StringBuilder(20);
        for (int i = 0; i < 20; i++) {
            char c = chars[random.nextInt(chars.length)];
            sb.append(c);
        }
        String output = sb.toString();
        return output;
    }

    /**
     * Creates a new random int.
     * It used to generate numbers & ages
     * @param maxInt maximum value of the generated number
     */
    public int generateInt(int maxInt){
        int i = random.nextInt(maxInt);
        return i;
    }

    public void generateTeacher(){
        Teacher teacher = new Teacher(generateString(), generateString());
        teacher.setId(generateInt(9999));
        teacher.setAge(generateInt(70));
        this.teacher = teacher;
    }

    public void generateRoom(){
        Room room = new Room(generateInt(100), generateString());
        this.room = room;
    }

    public void generateSubject(){
        Subject subject = new Subject(generateString());
        this.subject = subject;
    }

    public void generateStudent(){
        Student student = new Student(generateString(), generateString());
        student.setId(generateInt(9999));
        student.setAge(generateInt(70));
        this.student = student;
    }
    public void generateGroup(){
        Group group = new Group(generateString());
        this.teacher = teacher;
    }

    public Event generateEvent(DayOfWeek dayOfWeek, NumberEvent numberEvent) {
        Event event;
        generateTeacher();
        generateSubject();
        teacher.addSubjects(subject);
        generateRoom();
        generateStudent();
        generateGroup();
        group.addStudent(student);
        event = new Event();
        return event;
    }
}
