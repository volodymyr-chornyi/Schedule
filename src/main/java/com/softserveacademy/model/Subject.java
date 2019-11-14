package com.softserveacademy.model;

import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

public class Subject implements Comparable<Subject>{

    @NotNull private int id;
    @NotNull private String name;
    private Set<Teacher> teachers = new HashSet<>();

    public Subject(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Teacher> getTeachers() {
        return teachers;
    }

    public void setTeachers(Set<Teacher> teachers) {
        this.teachers = teachers;
    }

    public void addTeachers(Set<Teacher> teachers) {
        this.teachers.addAll(teachers);
    }

    public void addTeachers(Teacher teacher) {
        this.teachers.add(teacher);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Subject)) return false;
        Subject subject = (Subject) o;
        return name.equals(subject.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name);
    }

    @Override
    public String toString() {
        return name;
    }

    @Override
    public int compareTo(Subject subject) {
        return this.getName().compareToIgnoreCase(subject.getName());
    }
}
