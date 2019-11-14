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

public class SubjectController extends HttpServlet {

    TeacherDAO teacherDAO = new TeacherDAO();
    SubjectDAO subjectDAO = new SubjectDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        add(request);
        response.sendRedirect("/subjectlist");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String submit = request.getParameter("submit");
        if ("remove".equalsIgnoreCase(submit)) {
            remove(request);
        }
        if ("update".equalsIgnoreCase(submit)) {
            update(request);
        }

        request.getRequestDispatcher("/subjectlist").forward(request,response);
    }


    private void add(HttpServletRequest request){
        String name = request.getParameter("name");
        Subject subject = new Subject(name);
        try {
            subjectDAO.add(subject);
        } catch (IncorrectAddingException e) {
            e.printStackTrace();
        }
    }

    private void update(HttpServletRequest request){
        if(request.getParameter("id") != null){
            String name = request.getParameter("name");
            int id = Integer.parseInt(request.getParameter("id"));
            Subject subject = new Subject(name);
            subject.setId(id);
            try {
                subjectDAO.update(subject);
            } catch (NoMatchesException e) {
                e.printStackTrace();
            }
        }
    }

    private void remove(HttpServletRequest request){
        if(request.getParameter("id") != null)
            subjectDAO.removeById(Integer.parseInt(request.getParameter("id")));
    }
}
