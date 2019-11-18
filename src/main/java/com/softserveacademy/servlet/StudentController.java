//package com.softserveacademy.servlet;
//
//import com.softserveacademy.dao.SubjectDAO;
//import com.softserveacademy.dao.TeacherDAO;
//import com.softserveacademy.garbage.ValidationException;
//import com.softserveacademy.model.Subject;
//import com.softserveacademy.model.Teacher;
//import com.softserveacademy.service.exception.IncorrectAddingException;
//import com.softserveacademy.service.exception.NoMatchesException;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//public class StudentController extends HttpServlet {
//
//    TeacherDAO teacherDAO = new TeacherDAO();
//    SubjectDAO subjectDAO = new SubjectDAO();
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        if (request.getParameter("id") == null || request.getParameter("id").isEmpty()) {
//            add(request);
//            response.sendRedirect("/teacherlist");
//        }
//        else {
//            try {
//                update(request);
//            } catch (ValidationException e) {
//                e.printStackTrace();
//            }
//            response.sendRedirect("/teacherlist");
//
////            edit(request, response);
////
////            request.getRequestDispatcher("/teacherupdate").forward(request, response);
//        }
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String submit = request.getParameter("submit");
//        if ("remove".equalsIgnoreCase(submit)) {
//            remove(request);
//            request.getRequestDispatcher("/teacherlist").forward(request,response);
//        }
//        if ("edit".equalsIgnoreCase(submit)){
//            edit(request);
//
//            request.getRequestDispatcher("/teacherupdate").forward(request, response);
//        }
//
//    }
//
//
//    private void add(HttpServletRequest request){
//        String firstName = request.getParameter("firstName");
//        String lastName = request.getParameter("lastName");
//        int age = Integer.parseInt(request.getParameter("age"));
//        Subject subject = subjectDAO.findByName(request.getParameter("subject"));
//        Teacher teacher = new Teacher(firstName, lastName);
//        teacher.setAge(age);
//        try {
//            teacherDAO.add(teacher);
//        } catch (IncorrectAddingException e) {
//            e.printStackTrace();
//        }
//        if (subject != null)
//            subjectDAO.addSubjectTeacher(subject, teacher);
//    }
//
//    private void update(HttpServletRequest request) throws ValidationException {
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
//    }
//
//    private void remove(HttpServletRequest request){
//        if(request.getParameter("id") != null)
//            teacherDAO.removeById(Integer.parseInt(request.getParameter("id")));
//    }
//
//    private void edit(HttpServletRequest request) {
//        int teacherId = Integer.parseInt(request.getParameter("id"));
//        Teacher teacher = teacherDAO.findById(teacherId);
//        String firstName = teacher.getFirstName();
//        request.setAttribute("teacher", teacher);
//        request.setAttribute("teacher", teacher);
//        request.setAttribute("firstName", firstName);
//        request.setAttribute("id", teacherId);
//        request.setAttribute("subject", teacher.getSubjects());
//    }
//}