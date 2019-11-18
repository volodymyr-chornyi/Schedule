package com.softserveacademy.servlet;

import com.softserveacademy.dao.GroupDAO;
import com.softserveacademy.dao.StudentDAO;
import com.softserveacademy.model.Group;
import com.softserveacademy.model.Student;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class StudentListServlet extends HttpServlet {

    StudentDAO studentDAO = new StudentDAO();
    GroupDAO groupDAO = new GroupDAO();
    List<Student> sortStudents;
    List<Group> sortGroups;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Set<Student> students = studentDAO.findAll();
        Set<Group> groups = groupDAO.findAll();
        List<Student> sortStudents = students.stream().sorted().collect(Collectors.toList());
        List<Group> sortGroups = groups.stream().sorted().collect(Collectors.toList());
        this.sortStudents = sortStudents;
        this.sortGroups = sortGroups;
        request.setAttribute("allStudents", this.sortStudents);
        request.setAttribute("allGroups", this.sortGroups);
        request.getRequestDispatcher("/studentmain").forward(request, response);
    }
}

