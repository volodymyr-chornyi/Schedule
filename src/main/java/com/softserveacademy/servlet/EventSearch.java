package com.softserveacademy.servlet;

import com.softserveacademy.dao.*;
import com.softserveacademy.model.*;
import com.softserveacademy.service.exception.NoMatchesException;

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

public class EventSearch extends HttpServlet {

    private EventDAO eventDAO = new EventDAO();
    private TeacherDAO teacherDAO = new TeacherDAO();
    private SubjectDAO subjectDAO = new SubjectDAO();
    private GroupDAO groupDAO = new GroupDAO();
    private RoomDAO roomDAO = new RoomDAO();
    private StudentDAO studentDAO = new StudentDAO();
    private List<DayOfWeek> allDays = Arrays.asList(DayOfWeek.values());
    private List<NumberEvent> allNumberEvent = Arrays.asList(NumberEvent.values());
    private List<Event> sortEvents;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Event> sortEvents = eventDAO.findAll().stream().sorted().collect(Collectors.toList());
        this.sortEvents = sortEvents;

        if (request != null) {
            try {
                search(request);
            } catch (NoMatchesException e) {
                e.printStackTrace();
            }
        }

        if(request.getParameter("search") != null && request.getParameter("search").equals("schedule")) {
            List<Event> mondayEvent = sortEvents.stream()
                    .filter(event -> event.getDayOfWeek().equals(DayOfWeek.MONDAY))
                    .collect(Collectors.toList());
            List<Event> tuesdayEvent = sortEvents.stream()
                    .filter(event -> event.getDayOfWeek().equals(DayOfWeek.TUESDAY))
                    .collect(Collectors.toList());
            List<Event> wednesdayEvent = sortEvents.stream()
                    .filter(event -> event.getDayOfWeek().equals(DayOfWeek.WEDNESDAY))
                    .collect(Collectors.toList());
            List<Event> thursdayEvent = sortEvents.stream()
                    .filter(event -> event.getDayOfWeek().equals(DayOfWeek.THURSDAY))
                    .collect(Collectors.toList());
            List<Event> fridayEvent = sortEvents.stream()
                    .filter(event -> event.getDayOfWeek().equals(DayOfWeek.FRIDAY))
                    .collect(Collectors.toList());
            List<Event> saturdayEvent = sortEvents.stream()
                    .filter(event -> event.getDayOfWeek().equals(DayOfWeek.SATURDAY))
                    .collect(Collectors.toList());
            List<Event> sundayEvent = sortEvents.stream()
                    .filter(event -> event.getDayOfWeek().equals(DayOfWeek.SUNDAY))
                    .collect(Collectors.toList());

            request.setAttribute("mondayEvent", mondayEvent);
            request.setAttribute("tuesdayEvent", tuesdayEvent);
            request.setAttribute("wednesdayEvent", wednesdayEvent);
            request.setAttribute("thursdayEvent", thursdayEvent);
            request.setAttribute("fridayEvent", fridayEvent);
            request.setAttribute("saturdayEvent", saturdayEvent);
            request.setAttribute("sundayEvent", sundayEvent);

            request.getRequestDispatcher("/schedule").forward(request, response);
        } else {
            List<Teacher> sortTeachers = teacherDAO.findAll().stream().sorted().collect(Collectors.toList());
            List<Subject> sortSubjects = subjectDAO.findAll().stream().sorted().collect(Collectors.toList());
            List<Group> sortGroups = groupDAO.findAll().stream().sorted().collect(Collectors.toList());
            List<Room> sortRooms = roomDAO.findAll().stream().sorted().collect(Collectors.toList());
            List<Student> sortStudents = studentDAO.findAll().stream().sorted().collect(Collectors.toList());

            request.setAttribute("resultEvents", this.sortEvents);
            request.setAttribute("allDays", this.allDays);
            request.setAttribute("allNumberEvent", this.allNumberEvent);
            request.setAttribute("allTeachers", sortTeachers);
            request.setAttribute("allSubjects", sortSubjects);
            request.setAttribute("allGroups", sortGroups);
            request.setAttribute("allRooms", sortRooms);
            request.setAttribute("allStudents", sortStudents);

            request.getRequestDispatcher("/eventsearch").forward(request, response);
        }
    }

    private void search(HttpServletRequest request) throws NoMatchesException {

        Set<Event> currentEvents;
        String dayReq = request.getParameter("day");
        String numberReq = request.getParameter("number");
        String subjectReq = request.getParameter("subject");
        String teacherReq = request.getParameter("teacher");
        String groupReq = request.getParameter("group");
        String roomReq = request.getParameter("room");
        String studentReq = request.getParameter("student");

        if(dayReq != null && (!dayReq.isEmpty())) {
            int day = Integer.parseInt(dayReq);
            currentEvents = eventDAO.findByDayOfWeek(DayOfWeek.of(day));
            sortEvents.retainAll(currentEvents);
        }
        if(numberReq != null && (!numberReq.isEmpty())) {
            int numberEvent = Integer.parseInt(numberReq);
            currentEvents = eventDAO.findByNumberEvent(NumberEvent.of(numberEvent));
            sortEvents.retainAll(currentEvents);
        }
        if(subjectReq != null && (!subjectReq.isEmpty())) {
            int subjectId = Integer.parseInt(subjectReq);
            currentEvents = eventDAO.findBySubject(subjectDAO.findById(subjectId));
            sortEvents.retainAll(currentEvents);
        }
        if(teacherReq != null && (!teacherReq.isEmpty())) {
            int teacherId = Integer.parseInt(teacherReq);
            currentEvents = eventDAO.findByTeacher(teacherDAO.findById(teacherId));
            sortEvents.retainAll(currentEvents);
        }
        if(groupReq != null && (!groupReq.isEmpty())) {
            int groupId = Integer.parseInt(groupReq);
            currentEvents = eventDAO.findByGroup(groupDAO.findById(groupId));
            sortEvents.retainAll(currentEvents);
        }
        if(roomReq != null && (!roomReq.isEmpty())) {
            int roomId = Integer.parseInt(roomReq);
            currentEvents = eventDAO.findByRoom(roomDAO.findById(roomId));
            sortEvents.retainAll(currentEvents);
        }
        if(studentReq != null && (!studentReq.isEmpty())) {
            int studentId = Integer.parseInt(studentReq);
            Group studentGroup = studentDAO.findById(studentId).getGroup();
            if(groupReq != null && (!groupReq.isEmpty())) {
                int groupId = Integer.parseInt(groupReq);
                if (!groupDAO.findById(groupId).equals(studentGroup)) {
                    throw new NoMatchesException(studentGroup);
                }
            }
            currentEvents = eventDAO.findByGroup(studentGroup);
            sortEvents.retainAll(currentEvents);
        }
    }
}

