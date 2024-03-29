package com.softserveacademy.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

@Entity
@Table(name = "groups")
public class Group implements Comparable<Group>{

    @NotNull
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id")
    private int id;

    @NotNull
    @Pattern(regexp = "^[a-zA-Z]{2,}'?-?")
    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "group")
    private transient Set<Student> students = new HashSet<>();

    public Group(String name) {
        this.name = name;
    }

    public Group() {
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

    public Set<Student> getStudents() {
        return students;
    }

    public String getStudentsToString() {
        return getStudents().stream()
                .map(Student::getName)
                .sorted()
                .collect(Collectors.joining(", ", "", ""));
    }

    public int getGroupSize(){
        return students.size();
    }

    public void setStudents(Set<Student> students) {
        this.students = students;
    }

    public void addStudent(Set<Student> students) {
        this.students.addAll(students);
        for (Student student: students) {
            student.setGroup(this);
        }
    }

    public void addStudent(Student student) {
        this.students.add(student);
        student.setGroup(this);
    }

    public void removeStudent (Student student){
        students.remove(student);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Group)) return false;
        Group group = (Group) o;
        return name.equals(group.name) &&
                students.equals(group.students);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, students);
    }

    @Override
    public String toString() {
        return "Group{" +
                "name='" + name + '\'' +
                '}';
    }

    @Override
    public int compareTo(Group group) {
        return (this.getName().compareToIgnoreCase(group.getName()));
    }
}
