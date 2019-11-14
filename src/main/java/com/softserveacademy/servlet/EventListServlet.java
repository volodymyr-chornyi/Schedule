package com.softserveacademy.servlet;

import com.softserveacademy.dao.*;
import com.softserveacademy.model.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.DayOfWeek;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class EventListServlet extends HttpServlet {

    EventDAO eventDAO = new EventDAO();
    TeacherDAO teacherDAO = new TeacherDAO();
    SubjectDAO subjectDAO = new SubjectDAO();
    GroupDAO groupDAO = new GroupDAO();
    RoomDAO roomDAO = new RoomDAO();
    List<DayOfWeek> allDays = Arrays.asList(DayOfWeek.values());
    List<NumberEvent> allNumberEvent = Arrays.asList(NumberEvent.values());
    List<Event> sortEvents;
    List<Teacher> sortTeachers;
    List<Subject> sortSubjects;
    List<Group> sortGroups;
    List<Room> sortRooms;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Event> sortEvents = eventDAO.findAll().stream().sorted().collect(Collectors.toList());
        List<Teacher> sortTeachers = teacherDAO.findAll().stream().sorted().collect(Collectors.toList());
        List<Subject> sortSubjects = subjectDAO.findAll().stream().sorted().collect(Collectors.toList());
        List<Group> sortGroups = groupDAO.findAll().stream().sorted().collect(Collectors.toList());
        List<Room> sortRooms = roomDAO.findAll().stream().sorted().collect(Collectors.toList());
        this.sortEvents = sortEvents;
        this.sortTeachers = sortTeachers;
        this.sortSubjects = sortSubjects;
        this.sortGroups = sortGroups;
        this.sortRooms = sortRooms;
        request.setAttribute("allEvents", this.sortEvents);
        request.setAttribute("allDays", this.allDays);
        request.setAttribute("allNumberEvent", this.allNumberEvent);
        request.setAttribute("allTeachers", this.sortTeachers);
        request.setAttribute("allSubjects", this.sortSubjects);
        request.setAttribute("allGroups", this.sortGroups);
        request.setAttribute("allRooms", this.sortRooms);
        request.getRequestDispatcher("/eventmain").forward(request, response);
    }
}

