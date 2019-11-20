package com.softserveacademy.servlet;

import com.softserveacademy.dao.RoomDAO;
import com.softserveacademy.model.Room;
import com.softserveacademy.service.exception.IncorrectAddingException;
import com.softserveacademy.service.exception.RemoveException;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RoomController extends HttpServlet {

    RoomDAO roomDAO = new RoomDAO();
    private static Logger logger = Logger.getLogger(RoomController.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("id") == null || request.getParameter("id").isEmpty()) {
            add(request);
            response.sendRedirect("/roomlist");
        } else {
            update(request);
            response.sendRedirect("/roomlist");
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
            request.getRequestDispatcher("/roomlist").forward(request, response);
        }
        if ("edit".equalsIgnoreCase(submit)) {
            int roomId = Integer.parseInt(request.getParameter("id"));
            Room room = roomDAO.findById(roomId);
            request.setAttribute("room", room);
            request.getRequestDispatcher("/roomupdate").forward(request, response);
        }
    }

    private void add(HttpServletRequest request) {
        String buildingNumber = request.getParameter("buildingNumber");
        String name = request.getParameter("name");
        Room room = new Room(buildingNumber, name);
        try {
            roomDAO.add(room);
        } catch (IncorrectAddingException e) {
            logger.error(e.getMessage(), e);
        }
    }

    private void update(HttpServletRequest request) {
        if (request.getParameter("id") != null) {
            String buildingNumber = request.getParameter("buildingNumber");
            String name = request.getParameter("name");
            int id = Integer.parseInt(request.getParameter("id"));
            Room room = new Room(buildingNumber, name);
            room.setId(id);
            roomDAO.update(room);
        }
    }

    private void remove(HttpServletRequest request) throws RemoveException {
        if (request.getParameter("id") != null)
            roomDAO.removeById(Integer.parseInt(request.getParameter("id")));
    }
}
