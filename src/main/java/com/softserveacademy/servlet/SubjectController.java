package com.softserveacademy.servlet;

import com.softserveacademy.dao.SubjectDAO;
import com.softserveacademy.model.Subject;
import com.softserveacademy.service.exception.IncorrectAddingException;
import com.softserveacademy.service.exception.RemoveException;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SubjectController extends HttpServlet {

    SubjectDAO subjectDAO = new SubjectDAO();
    private static Logger logger = Logger.getLogger(SubjectController.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getParameter("id") == null || request.getParameter("id").isEmpty()) {
            add(request);
            response.sendRedirect("/subjectlist");
        } else {
            try {
                update(request);
            } catch (IncorrectAddingException e) {
                logger.error(e.getMessage(), e);
            }
            response.sendRedirect("/subjectlist");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String submit = request.getParameter("submit");
        if ("remove".equalsIgnoreCase(submit)) {
            try {
                remove(request);
            } catch (RemoveException e) {
                logger.error(e.getMessage(), e);
            }
            request.getRequestDispatcher("/subjectlist").forward(request, response);
        }
        if ("edit".equalsIgnoreCase(submit)) {
            int subjectId = Integer.parseInt(request.getParameter("id"));
            Subject subject = subjectDAO.findById(subjectId);
            subject.addTeachers(subjectDAO.showTeachers(subject));
            request.setAttribute("subject", subject);
            request.getRequestDispatcher("/subjectupdate").forward(request, response);
        }
    }

    private void add(HttpServletRequest request){
        String name = request.getParameter("name");
        Subject subject = new Subject(name);
        try {
            subjectDAO.add(subject);
        } catch (IncorrectAddingException e) {
            logger.error(e.getMessage(), e);
        }
    }

    private void update(HttpServletRequest request) throws IncorrectAddingException {
        if(request.getParameter("id") != null){
            String name = request.getParameter("name");
            int id = Integer.parseInt(request.getParameter("id"));
            Subject subject = new Subject(name);
            subject.setId(id);
            subjectDAO.update(subject);
        }
    }

    private void remove(HttpServletRequest request) throws RemoveException {
        if(request.getParameter("id") != null)
            subjectDAO.removeById(Integer.parseInt(request.getParameter("id")));
    }
}
