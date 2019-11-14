package com.softserveacademy.servlet;

import com.softserveacademy.dao.SubjectDAO;
import com.softserveacademy.dao.TeacherDAO;
import com.softserveacademy.model.Subject;
import com.softserveacademy.model.Teacher;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class SubjectListServlet extends HttpServlet {

    TeacherDAO teacherDAO = new TeacherDAO();
    SubjectDAO subjectDAO = new SubjectDAO();
    List<Teacher> sortTeachers;
    List<Subject> sortSubjects;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Set<Teacher> teachers = teacherDAO.findAll();
        Set<Subject> subjects = subjectDAO.findAll();
        for (Subject subject: subjects) {
            Set<Teacher> teacher = subjectDAO.showTeachers(subject);
            subject.addTeachers(teacher);
        }
        List<Teacher> sortTeachers = teachers.stream().sorted().collect(Collectors.toList());
        List<Subject> sortSubjects = subjects.stream().sorted().collect(Collectors.toList());
        this.sortTeachers = sortTeachers;
        this.sortSubjects = sortSubjects;
        request.setAttribute("allTeachers", this.sortTeachers);
        request.setAttribute("allSubjects", this.sortSubjects);
        request.getRequestDispatcher("/subjectmain").forward(request, response);
    }
}

