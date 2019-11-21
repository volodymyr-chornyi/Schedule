package com.softserveacademy.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.Objects;

public class Student implements Comparable<Student>{

    @NotNull
    private int id;
    @Min(value = 16)
    private int age;
    @NotNull
    private String firstName;
    @NotNull
    private String lastName;
    private Group group;

    public Student(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getName() {
        return lastName + " " + firstName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Student)) return false;
        Student student = (Student) o;
        return firstName.equals(student.firstName) &&
               lastName.equals(student.lastName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(firstName, lastName);
    }

    @Override
    public String toString() {
        return "Student{" +
                "firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", age=" + age +
                ", group='" + group.getName() + '\'' +
                '}';
    }

    @Override
    public int compareTo(Student student) {
        return (this.getName().compareToIgnoreCase(student.getName()));
    }
}
