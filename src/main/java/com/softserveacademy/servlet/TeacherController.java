package com.softserveacademy.servlet;

import com.softserveacademy.dao.SubjectDAO;
import com.softserveacademy.dao.TeacherDAO;
import com.softserveacademy.model.Subject;
import com.softserveacademy.model.Teacher;
import com.softserveacademy.service.exception.IncorrectAddingException;
import com.softserveacademy.service.exception.NoMatchesException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TeacherController extends HttpServlet {

    TeacherDAO teacherDAO = new TeacherDAO();
    SubjectDAO subjectDAO = new SubjectDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        add(request);
        response.sendRedirect("/teacherlist");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String submit = request.getParameter("submit");
        if ("remove".equalsIgnoreCase(submit)) {
            remove(request);
        }
        if ("update".equalsIgnoreCase(submit)) {
            update(request);
        }

        request.getRequestDispatcher("/teacherlist").forward(request,response);
    }


    private void add(HttpServletRequest request){
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        int age = Integer.parseInt(request.getParameter("age"));
        Subject subject = subjectDAO.findByName(request.getParameter("subject"));
        Teacher teacher = new Teacher(firstName, lastName);
        teacher.setAge(age);
        try {
            teacherDAO.add(teacher);
        } catch (IncorrectAddingException e) {
            e.printStackTrace();
        }
        if (subject != null)
            subjectDAO.addSubjectTeacher(subject, teacher);
    }

    private void update(HttpServletRequest request){
        if(request.getParameter("id") != null){
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            int age = Integer.parseInt(request.getParameter("age"));
            int id = Integer.parseInt(request.getParameter("id"));
            Teacher teacher = new Teacher(firstName, lastName);
            teacher.setAge(age);
            teacher.setId(id);
            try {
                teacherDAO.update(teacher);
            } catch (NoMatchesException e) {
                e.printStackTrace();
            }
        }
    }

    private void remove(HttpServletRequest request){
        if(request.getParameter("id") != null)
            teacherDAO.removeById(Integer.parseInt(request.getParameter("id")));
    }
}
