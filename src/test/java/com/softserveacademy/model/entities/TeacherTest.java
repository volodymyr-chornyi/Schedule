package com.softserveacademy.model.entities;

import com.softserveacademy.model.Subject;
import com.softserveacademy.model.Teacher;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import static org.junit.Assert.*;

@RunWith(JUnit4.class)
public class TeacherTest {

    @Test
    public void testSetSubjects() {
        Teacher teacher = new Teacher("Stepan", "Ivanov");
        Subject subject = new Subject("Phi");
        Subject subject2 = new Subject("Math");
        teacher.addSubjects(subject);
        teacher.addSubjects(subject);
        teacher.addSubjects(subject2);
        assertEquals(2, teacher.getSubjects().size());
    }
}