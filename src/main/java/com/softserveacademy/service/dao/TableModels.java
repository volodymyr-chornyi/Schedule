package com.softserveacademy.service.dao;

public class TableModels {

    public static String createTeachers(){
        return  "CREATE TABLE IF NOT EXISTS teachers " +
                "(id serial primary key, " +
                "age INTEGER, " +
                "first_name VARCHAR(20), " +
                "last_name VARCHAR(20), " +
                "UNIQUE (first_name, last_name))";
    }

    public static String dropTeachers(){
        return "DROP TABLE teachers";
    }

    public static String createSubjects(){
        return  "CREATE TABLE IF NOT EXISTS subjects " +
                "(id serial primary key, " +
                " name VARCHAR(20) UNIQUE)";
    }

    public static String dropSubjects(){
        return "DROP TABLE subjects";
    }

    public static String createTeachersSubjects(){
        return  "CREATE TABLE IF NOT EXISTS teachers_subjects " +
                "(id serial primary key, " +
                "teacher_id INTEGER, " +
                "subject_id INTEGER, " +
                "FOREIGN KEY(subject_id) REFERENCES subjects(id), " +
                "FOREIGN KEY(teacher_id) REFERENCES teachers(id), " +
                "UNIQUE (teacher_id, subject_id))";
    }

    public static String dropTeachersSubjects(){
        return "DROP TABLE teachers_subjects";
    }

    public static String createGroups(){
        return  "CREATE TABLE IF NOT EXISTS groups " +
                "(id serial primary key, " +
                "name VARCHAR(20) UNIQUE)";
    }

    public static String dropGroups(){
        return "DROP TABLE groups";
    }

    public static String createStudents(){
        return  "CREATE TABLE IF NOT EXISTS students " +
                "(id serial primary key, " +
                "age INTEGER, " +
                "first_name VARCHAR(20), " +
                "last_name VARCHAR(20), " +
                "group_id INTEGER, " +
                "FOREIGN KEY(group_id) REFERENCES groups(id))";
    }

    public static String dropStudents(){
        return "DROP TABLE students";
    }

    public static String createRooms(){
        return "CREATE TABLE IF NOT EXISTS rooms " +
                "(id serial primary key, " +
                "building_number INTEGER, " +
                "name VARCHAR(20), " +
                "UNIQUE (building_number, name))";
    }

    public static String dropRooms(){
        return "DROP TABLE rooms";
    }

    public static String createEvents(){
        return  "CREATE TABLE IF NOT EXISTS events " +
                "(id serial primary key, " +
                "day_of_week INTEGER NOT NULL, " +
                "number_event INTEGER NOT NULL, " +
                "teacher_id INTEGER NOT NULL, " +
                "subject_id INTEGER NOT NULL, " +
                "group_id INTEGER NOT NULL, " +
                "room_id INTEGER NOT NULL, " +
                "FOREIGN KEY(subject_id) REFERENCES subjects(id), " +
                "FOREIGN KEY(teacher_id) REFERENCES teachers(id), " +
                "FOREIGN KEY(group_id) REFERENCES groups(id), " +
                "FOREIGN KEY(room_id) REFERENCES rooms(id))";
    }

    public static String dropEvents(){
        return "DROP TABLE events";
    }

}
