package com.softserveacademy.model.entities;

import org.junit.Test;

import java.util.HashSet;
import java.util.Set;

import static org.junit.Assert.*;

public class GroupTest {

    Student ivan = new Student("Ivan", "Ivanov");
    Student stepan = new Student("Stepan", "Stepanov");
    Student boris = new Student("Boris", "Borisov");
    Group group = new Group("101");

    @Test
    public void testSetStudent() {
        group.addStudent(stepan);
        Set<Student> set = new HashSet<>();
        set.add(ivan);
        set.add(boris);
        group.addStudent(set);
        assertEquals(3, group.getGroupSize());
    }

    @Test
    public void testSetStudentUnique() {
        group.addStudent(stepan);
        group.addStudent(ivan);
        group.addStudent(boris);
        group.addStudent(ivan);
        assertEquals(3, group.getGroupSize());
    }

    @Test
    public void testRemoveStudent() {
        group.addStudent(ivan);
        group.addStudent(stepan);
        group.addStudent(boris);
        group.removeStudent(ivan);
        assertEquals(2, group.getGroupSize());
    }
}