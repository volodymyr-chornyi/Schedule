package com.softserveacademy.servlet;

import com.softserveacademy.dao.GroupDAO;
import com.softserveacademy.dao.StudentDAO;
import com.softserveacademy.model.Group;
import com.softserveacademy.model.Student;
import com.softserveacademy.service.exception.IncorrectAddingException;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class StudentController extends HttpServlet {

    StudentDAO studentDAO = new StudentDAO();
    GroupDAO groupDAO = new GroupDAO();
    private static Logger logger = Logger.getLogger(StudentController.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("id") == null || request.getParameter("id").isEmpty()) {
            add(request);
            response.sendRedirect("studentlist");
        } else {
            update(request);
            response.sendRedirect("studentlist");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String submit = request.getParameter("submit");
        if ("remove".equalsIgnoreCase(submit)) {
            remove(request);
            request.getRequestDispatcher("/studentlist").forward(request, response);
        }
        if ("edit".equalsIgnoreCase(submit)) {
            int studentId = Integer.parseInt(request.getParameter("id"));
            Student student = studentDAO.findById(studentId);
            request.setAttribute("student", student);

            Set<Group> groups = groupDAO.findAll();
            List<Group> sortGroups = groups.stream().sorted().collect(Collectors.toList());
            request.setAttribute("allGroups", sortGroups);

            request.getRequestDispatcher("/studentupdate").forward(request, response);
        }
    }

    private void add(HttpServletRequest request) {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        int age = Integer.parseInt(request.getParameter("age"));
        Group group = groupDAO.findByName(request.getParameter("group"));
        Student student = new Student(firstName, lastName);
        student.setAge(age);
        student.setGroup(group);
        try {
            studentDAO.add(student);
        } catch (IncorrectAddingException e) {
            logger.error(e);
        }
    }

    private void update(HttpServletRequest request) {
        if (request.getParameter("id") != null) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            int age = Integer.parseInt(request.getParameter("age"));
            int id = Integer.parseInt(request.getParameter("id"));
            Group group = groupDAO.findByName(request.getParameter("group"));
            Student student = new Student(firstName, lastName);
            student.setAge(age);
            student.setId(id);
            student.setGroup(group);
            studentDAO.update(student);
        }
    }

    private void remove(HttpServletRequest request) {
        if (request.getParameter("id") != null)
            studentDAO.removeById(Integer.parseInt(request.getParameter("id")));
    }
}

