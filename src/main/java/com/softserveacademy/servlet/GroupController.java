package com.softserveacademy.servlet;

import com.softserveacademy.dao.GroupDAO;
import com.softserveacademy.model.Group;
import com.softserveacademy.service.exception.IncorrectAddingException;
import com.softserveacademy.service.exception.NoMatchesException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GroupController extends HttpServlet {

    GroupDAO groupDAO = new GroupDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("id") == null || request.getParameter("id").isEmpty()) {
            add(request);
            response.sendRedirect("/grouplist");
        } else {
            update(request);
            response.sendRedirect("/grouplist");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String submit = request.getParameter("submit");
        if ("remove".equalsIgnoreCase(submit)) {
            remove(request);
            request.getRequestDispatcher("/grouplist").forward(request, response);
        }
        if ("edit".equalsIgnoreCase(submit)) {
            int groupId = Integer.parseInt(request.getParameter("id"));
            Group group = groupDAO.findById(groupId);
            group.addStudent(groupDAO.showStudents(group));
            request.setAttribute("group", group);
            request.getRequestDispatcher("/groupupdate").forward(request, response);
        }
    }

    private void add(HttpServletRequest request) {
        String name = request.getParameter("name");
        Group group = new Group(name);
        try {
            groupDAO.add(group);
        } catch (IncorrectAddingException e) {
            e.printStackTrace();
        }
    }

    private void update(HttpServletRequest request) {
        if (request.getParameter("id") != null) {
            String name = request.getParameter("name");
            int id = Integer.parseInt(request.getParameter("id"));
            Group group = new Group(name);
            group.setId(id);
            try {
                groupDAO.update(group);
            } catch (IncorrectAddingException e) {
                e.printStackTrace();
            }
        }
    }

    private void remove(HttpServletRequest request) {
        if (request.getParameter("id") != null)
            groupDAO.removeById(Integer.parseInt(request.getParameter("id")));
    }

}
