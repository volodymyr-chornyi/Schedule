package com.softserveacademy.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

public class Group {

    @Min(value = 1)
    @Max(value = 999)
    private int number;
    private Set<Student> students = new HashSet<>();

    public Group(int number) {
        this.number = number;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Set<Student> getStudents() {
        return students;
    }

    public int getGroupSize(){
        return students.size();
    }

    public void setStudents(Set<Student> students) {
        this.students = students;
    }

    public void setStudent(Set<Student> students) {
        this.students.addAll(students);
        for (Student student: students) {
            student.setNumberGroup(this.number);
        }
    }

    public void setStudent(Student student) {
        this.students.add(student);
        student.setNumberGroup(this.number);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Group)) return false;
        Group group = (Group) o;
        return number == group.number;
    }

    @Override
    public int hashCode() {
        return Objects.hash(number);
    }

    @Override
    public String toString() {
        return "Group{" +
                "number=" + number +
                '}';
    }

    public void removeStudent (Student student){
        students.remove(student);
    }
}
