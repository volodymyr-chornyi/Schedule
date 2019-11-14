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

public class GroupListServlet extends HttpServlet {

    GroupDAO groupDAO = new GroupDAO();
    StudentDAO studentDAO = new StudentDAO();
    List<Group> sortGroups;
    List<Student> sortStudents;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Set<Group> groups = groupDAO.findAll();
        Set<Student> students = studentDAO.findAll();
        for (Group group : groups) {
            for (Student student: students) {
                if(student.getGroup().equals(group))
                    group.addStudent(student);
            }
        }
        List<Group> sortGroups = groups.stream().sorted().collect(Collectors.toList());
        List<Student> sortStudents = students.stream().sorted().collect(Collectors.toList());
        this.sortGroups = sortGroups;
        this.sortStudents = sortStudents;
        request.setAttribute("allGroups", this.sortGroups);
        request.setAttribute("allStudents", this.sortStudents);
        request.getRequestDispatcher("/groupmain").forward(request, response);
    }
}

