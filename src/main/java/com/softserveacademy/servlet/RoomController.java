package com.softserveacademy.servlet;

import com.softserveacademy.dao.RoomDAO;
import com.softserveacademy.dao.SubjectDAO;
import com.softserveacademy.dao.TeacherDAO;
import com.softserveacademy.model.Room;
import com.softserveacademy.model.Subject;
import com.softserveacademy.model.Teacher;
import com.softserveacademy.service.exception.IncorrectAddingException;
import com.softserveacademy.service.exception.NoMatchesException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RoomController extends HttpServlet {

    RoomDAO roomDAO = new RoomDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        add(request);
        response.sendRedirect("/roomlist");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String submit = request.getParameter("submit");
        if ("remove".equalsIgnoreCase(submit)) {
            remove(request);
        }
        if ("update".equalsIgnoreCase(submit)) {
            update(request);
        }

        request.getRequestDispatcher("/roomlist").forward(request,response);
    }


    private void add(HttpServletRequest request){
        String buildingNumber = request.getParameter("buildingNumber");
        String name = request.getParameter("name");
        Room room = new Room(buildingNumber, name);
        try {
            roomDAO.add(room);
        } catch (IncorrectAddingException e) {
            e.printStackTrace();
        }
    }

    private void update(HttpServletRequest request){
        if(request.getParameter("id") != null){
            String buildingNumber = request.getParameter("buildingNumber");
            String name = request.getParameter("name");
            int id = Integer.parseInt(request.getParameter("id"));
            Room room = new Room(buildingNumber, name);
            room.setId(id);
            try {
                roomDAO.update(room);
            } catch (NoMatchesException e) {
                e.printStackTrace();
            }
        }
    }

    private void remove(HttpServletRequest request){
        if(request.getParameter("id") != null)
            roomDAO.removeById(Integer.parseInt(request.getParameter("id")));
    }
}
