package com.softserveacademy.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.DayOfWeek;
import java.util.Objects;

@Entity
@Table(name = "event")
public class Event implements Comparable<Event>{

    @NotNull
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id")
    private int id;

    @Enumerated(EnumType.STRING)
    @Column(name = "dayOfWeek")
    private DayOfWeek dayOfWeek;

    @Enumerated(EnumType.STRING)
    @Column(name = "numberEvent")
    private NumberEvent numberEvent;

    @ManyToOne
    @JoinColumn(name="teacher_id", nullable=false)
    private Teacher teacher;

    @ManyToOne
    @JoinColumn(name="group_id", nullable=false)
    private Group group;

    @ManyToOne
    @JoinColumn(name="subject_id", nullable=false)
    private Subject subject;

    @ManyToOne
    @JoinColumn(name="room_id", nullable=false)
    private Room room;

    public int getId() {
        return id;
    }

    public DayOfWeek getDayOfWeek() {
        return dayOfWeek;
    }

    public NumberEvent getNumberEvent() {
        return numberEvent;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public Group getGroup() {
        return group;
    }

    public Subject getSubject() {
        return subject;
    }

    public Room getRoom() {
        return room;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDayOfWeek(DayOfWeek dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public void setNumberEvent(NumberEvent numberEvent) {
        this.numberEvent = numberEvent;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Event)) return false;
        Event event = (Event) o;
        if(dayOfWeek.equals(((Event) o).dayOfWeek) && (numberEvent == ((Event) o).numberEvent)) {
            return  teacher.equals(event.teacher) ||
                    group.equals(event.group) ||
                    room.equals(event.room);
        }
        return false;
    }

    @Override
    public int hashCode() {
        return Objects.hash(dayOfWeek, numberEvent, teacher, group, room);
    }

    @Override
    public String toString() {
        return "Event{" +
                "dayOfWeek=" + dayOfWeek +
                ", numberEvent=" + numberEvent +
                ", teacher=" + teacher +
                ", group=" + group +
                ", subject=" + subject +
                ", room=" + room +
                '}';
    }

    public String getSchedule() {
        return (subject.getName() + ", " + group.getName() + ", " + teacher.getName() + ", " + room.getFullName());
    }

    @Override
    public int compareTo(Event event) {
        int i = this.getDayOfWeek().compareTo(event.getDayOfWeek());
        if(i != 0)
            return i;
        i = this.getNumberEvent().compareTo(event.getNumberEvent());
        if(i != 0)
            return i;
        return this.getRoom().compareTo(event.getRoom());
    }
}
