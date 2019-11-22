package com.softserveacademy.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.Objects;

@Entity
@Table(name = "room")
public class Room implements Comparable<Room>{

    @NotNull
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id")
    private int id;

    @NotNull
    @Pattern(regexp = "^[a-zA-Z]{2,},?'?-?")
    @Column(name = "buildingNumber")
    private String buildingNumber;

    @NotNull
    @Pattern(regexp = "^[a-zA-Z]{2,}'?-?")
    @Column(name = "name")
    private String name;

    public Room(String buildingNumber, String name) {
        this.buildingNumber = buildingNumber;
        this.name = name;
    }

    public Room() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBuildingNumber() {
        return buildingNumber;
    }

    public void setBuildingNumber(String buildingNumber) {
        this.buildingNumber = buildingNumber;
    }

    public String getName() {
        return name;
    }

    public String getFullName() {
        return (buildingNumber + ", " + name);
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Room)) return false;
        Room room = (Room) o;
        return buildingNumber.equalsIgnoreCase(room.buildingNumber) &&
                name.equals(room.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(buildingNumber, name);
    }

    @Override
    public String toString() {
        return "Room{" +
                "buildingNumber=" + buildingNumber +
                ", name='" + name + '\'' +
                '}';
    }

    @Override
    public int compareTo(Room room) {
        int i = this.getBuildingNumber().compareToIgnoreCase(room.getBuildingNumber());
        if (i != 0)
            return i;
        return (this.getName().compareToIgnoreCase(room.getName()));
    }
}
