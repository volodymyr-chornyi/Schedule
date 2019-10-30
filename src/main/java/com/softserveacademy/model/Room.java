package com.softserveacademy.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import java.util.Objects;

public class Room {

    @Min(value = 1)
    @Max(value = 9999)
    private int buildingNumber;
    @NotNull
    private String name;

    public Room(int buildingNumber, String name) {
        this.buildingNumber = buildingNumber;
        this.name = name;
    }

    public int getBuildingNumber() {
        return buildingNumber;
    }

    public void setBuildingNumber(int buildingNumber) {
        this.buildingNumber = buildingNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Room)) return false;
        Room room = (Room) o;
        return buildingNumber == room.buildingNumber &&
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
}
