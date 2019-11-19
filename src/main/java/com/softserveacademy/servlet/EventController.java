package com.softserveacademy.servlet;

import com.softserveacademy.dao.*;
import com.softserveacademy.model.*;
import com.softserveacademy.service.EventCreator;
import com.softserveacademy.service.exception.IncorrectAddingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.DayOfWeek;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class EventController extends HttpServlet {

    EventDAO eventDAO = new EventDAO();
    TeacherDAO teacherDAO = new TeacherDAO();
    SubjectDAO subjectDAO = new SubjectDAO();
    GroupDAO groupDAO = new GroupDAO();
    RoomDAO roomDAO = new RoomDAO();
    EventCreator eventCreator;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("id") == null || request.getParameter("id").isEmpty()) {
            try {
                add(request);
            } catch (IncorrectAddingException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/eventlist");
        } else {
            try {
                update(request);
            } catch (IncorrectAddingException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/eventlist");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String submit = request.getParameter("submit");
        if ("remove".equalsIgnoreCase(submit)) {
            remove(request);
            request.getRequestDispatcher("/eventlist").forward(request, response);
        }
        if ("edit".equalsIgnoreCase(submit)) {
            List<DayOfWeek> allDays = Arrays.asList(DayOfWeek.values());
            List<NumberEvent> allNumberEvent = Arrays.asList(NumberEvent.values());
            List<Teacher> sortTeachers = teacherDAO.findAll().stream().sorted().collect(Collectors.toList());
            List<Subject> sortSubjects = subjectDAO.findAll().stream().sorted().collect(Collectors.toList());
            List<Group> sortGroups = groupDAO.findAll().stream().sorted().collect(Collectors.toList());
            List<Room> sortRooms = roomDAO.findAll().stream().sorted().collect(Collectors.toList());

            request.setAttribute("allDays", allDays);
            request.setAttribute("allNumberEvent", allNumberEvent);
            request.setAttribute("allTeachers", sortTeachers);
            request.setAttribute("allSubjects", sortSubjects);
            request.setAttribute("allGroups", sortGroups);
            request.setAttribute("allRooms", sortRooms);

            int eventId = Integer.parseInt(request.getParameter("id"));
            Event event = eventDAO.findById(eventId);
            request.setAttribute("event", event);
            request.getRequestDispatcher("/eventupdate").forward(request, response);
        }
    }


    private void add(HttpServletRequest request) throws IncorrectAddingException {
        int dayOfWeek = Integer.parseInt(request.getParameter("day"));
        int numberEvent = Integer.parseInt(request.getParameter("number"));
        int subjectId = Integer.parseInt(request.getParameter("subject"));
        int teacherId = Integer.parseInt(request.getParameter("teacher"));
        int groupId = Integer.parseInt(request.getParameter("group"));
        int roomId = Integer.parseInt(request.getParameter("room"));
        Subject subject = subjectDAO.findById(subjectId);
        Teacher teacher = teacherDAO.findById(teacherId);
        if(subjectDAO.showTeachers(subject).contains(teacher)) {
            eventCreator = new EventCreator();
            Event event = eventCreator.setDayOfWeek(DayOfWeek.of(dayOfWeek))
                    .setNumberEvent(NumberEvent.of(numberEvent))
                    .setSubject(subject)
                    .setTeacher(teacher)
                    .setGroup(groupDAO.findById(groupId))
                    .setRoom(roomDAO.findById(roomId))
                    .create();

            try {
                eventDAO.add(event);
            } catch (IncorrectAddingException e) {
                e.printStackTrace();
            }
        } else throw new IncorrectAddingException(teacher, subject);
    }

    private void update(HttpServletRequest request) throws IncorrectAddingException {
        if(request.getParameter("id") != null){
            int id = Integer.parseInt(request.getParameter("id"));
            int dayOfWeek = Integer.parseInt(request.getParameter("day"));
            int numberEvent = Integer.parseInt(request.getParameter("number"));
            int subjectId = Integer.parseInt(request.getParameter("subject"));
            int teacherId = Integer.parseInt(request.getParameter("teacher"));
            int groupId = Integer.parseInt(request.getParameter("group"));
            int roomId = Integer.parseInt(request.getParameter("room"));
            Subject subject = subjectDAO.findById(subjectId);
            Teacher teacher = teacherDAO.findById(teacherId);
            if(subjectDAO.showTeachers(subject).contains(teacher)) {
                eventCreator = new EventCreator();
                Event event = eventCreator.setDayOfWeek(DayOfWeek.of(dayOfWeek))
                        .setNumberEvent(NumberEvent.of(numberEvent))
                        .setSubject(subject)
                        .setTeacher(teacher)
                        .setGroup(groupDAO.findById(groupId))
                        .setRoom(roomDAO.findById(roomId))
                        .create();
                event.setId(id);
                try {
                    eventDAO.update(event);
                } catch (IncorrectAddingException e) {
                    e.printStackTrace();
                }
            } else throw new IncorrectAddingException(teacher, subject);
        }
    }

    private void remove(HttpServletRequest request){
        if(request.getParameter("id") != null)
            eventDAO.removeById(Integer.parseInt(request.getParameter("id")));
    }
}
