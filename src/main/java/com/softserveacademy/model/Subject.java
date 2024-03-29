package com.softserveacademy.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

@Entity
@Table(name = "subject")
public class Subject implements Comparable<Subject>{

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id")
    private int id;

    @NotNull
    @Pattern(regexp = "^[a-zA-Z]{2,}'?-?")
    @Column(name = "name")
    private String name;

    @ManyToMany(mappedBy = "subjects")
    private Set<Teacher> teachers = new HashSet<>();

    public Subject(String name) {
        this.name = name;
    }

    public Subject() {
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


    public String getTeachersToString() {
        return getTeachers().stream()
                .map(Teacher::getName)
                .sorted()
                .collect(Collectors.joining(", ", "", ""));
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
