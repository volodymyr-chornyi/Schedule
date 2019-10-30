package com.softserveacademy.model;

import org.junit.Test;

import java.util.HashSet;
import java.util.Set;

import static org.junit.Assert.*;

public class GroupTest {

    Student ivan = new Student("Ivan", "Ivanov");
    Student stepan = new Student("Stepan", "Stepanov");
    Student boris = new Student("Boris", "Borisov");
    Group group = new Group(101);

    @Test
    public void testSetStudent() {
        group.setStudent(stepan);
        assertEquals(1, group.getGroupSize());
        Set<Student> set = new HashSet<>();
        set.add(ivan);
        set.add(boris);
        group.setStudent(set);
        assertEquals(3, group.getGroupSize());
        group.setStudent(ivan);
        assertEquals(3, group.getGroupSize());
    }

    @Test
    public void testRemoveStudent() {
        group.setStudent(ivan);
        group.setStudent(stepan);
        group.setStudent(boris);
        group.removeStudent(ivan);
        assertEquals(2, group.getGroupSize());
        group.removeStudent(ivan);
        group.removeStudent(stepan);
        group.removeStudent(boris);
        assertTrue(group.getStudents().isEmpty());
    }
}