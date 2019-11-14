package com.softserveacademy.servlet;

import com.softserveacademy.dao.*;
import com.softserveacademy.model.Event;
import com.softserveacademy.model.NumberEvent;
import com.softserveacademy.model.Subject;
import com.softserveacademy.model.Teacher;
import com.softserveacademy.service.EventCreator;
import com.softserveacademy.service.exception.IncorrectAddingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.DayOfWeek;

public class EventController extends HttpServlet {

    EventDAO eventDAO = new EventDAO();
    TeacherDAO teacherDAO = new TeacherDAO();
    SubjectDAO subjectDAO = new SubjectDAO();
    GroupDAO groupDAO = new GroupDAO();
    RoomDAO roomDAO = new RoomDAO();
    EventCreator eventCreator;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            add(request);
        } catch (IncorrectAddingException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/eventlist");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String submit = request.getParameter("submit");
        if ("remove".equalsIgnoreCase(submit)) {
            remove(request);
        }
        if ("update".equalsIgnoreCase(submit)) {
            update(request);
        }

        request.getRequestDispatcher("/eventlist").forward(request,response);
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

    private void update(HttpServletRequest request){
//        if(request.getParameter("id") != null){
//            String firstName = request.getParameter("firstName");
//            String lastName = request.getParameter("lastName");
//            int age = Integer.parseInt(request.getParameter("age"));
//            int id = Integer.parseInt(request.getParameter("id"));
//            Teacher teacher = new Teacher(firstName, lastName);
//            teacher.setAge(age);
//            teacher.setId(id);
//            try {
//                teacherDAO.update(teacher);
//            } catch (NoMatchesException e) {
//                e.printStackTrace();
//            }
//        }
    }

    private void remove(HttpServletRequest request){
        if(request.getParameter("id") != null)
            eventDAO.removeById(Integer.parseInt(request.getParameter("id")));
    }
}
