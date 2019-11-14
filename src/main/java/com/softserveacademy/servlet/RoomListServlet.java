package com.softserveacademy.servlet;

import com.softserveacademy.dao.RoomDAO;
import com.softserveacademy.model.Room;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class RoomListServlet extends HttpServlet {

    RoomDAO roomDAO = new RoomDAO();
    List<Room> sortRooms;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Set<Room> rooms = roomDAO.findAll();
        List<Room> sortRooms = rooms.stream().sorted().collect(Collectors.toList());
        this.sortRooms = sortRooms;
        request.setAttribute("allRooms", this.sortRooms);
        request.getRequestDispatcher("/roommain").forward(request, response);
    }
}

