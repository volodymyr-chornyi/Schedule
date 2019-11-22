package com.softserveacademy.dao;

import com.softserveacademy.model.Event;
import com.softserveacademy.service.exception.IncorrectAddingException;
import com.softserveacademy.service.exception.RemoveException;
import com.softserveacademy.service.util.JdbcService;
import com.softserveacademy.model.Room;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

public class RoomDAO {

    private final String CONTAINS = "SELECT * FROM rooms";
    private final String ADD = "INSERT INTO rooms (building_number, name) VALUES (?, ?)";
    private final String UPDATE = "UPDATE rooms SET building_number = ?, name = ? WHERE Id = ?";
    private final String REMOVE_BY_ID = "DELETE FROM rooms WHERE Id = ?";
    private final String FIND_BY_ID = "SELECT * FROM rooms WHERE Id = ?";
    private Connection connection;
    private static Logger logger = Logger.getLogger(RoomDAO.class);

    public RoomDAO() {
        this.connection = JdbcService.getConnection();
    }

    public boolean contains(Room room){
        boolean result = false;
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(CONTAINS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Room currentRoom = new Room(resultSet.getString("building_number"),
                                             resultSet.getString("name"));
                if (room.equals(currentRoom)){
                    result = true;
                    break;
                }
            }
        } catch (SQLException e) {
            logger.error(e);
        }
        return result;
    }

    public boolean add(Room room) throws IncorrectAddingException {
        boolean result = false;
        PreparedStatement preparedStatement;
        if(contains(room)) {
            throw new IncorrectAddingException(room);
        } else {
            try {
                preparedStatement = connection.prepareStatement(ADD, PreparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, room.getBuildingNumber());
                preparedStatement.setString(2, room.getName());
                preparedStatement.executeUpdate();
                logger.info("a new room was added");
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                if(resultSet.next()){
                    room.setId(resultSet.getInt(1));
                }
            } catch (SQLException e) {
                logger.error(e);
            }
            result = true;
        }
        return result;
    }

    public boolean update(Room room){
        boolean result = false;
            PreparedStatement preparedStatement;
            try {
                preparedStatement = connection.prepareStatement(UPDATE);
                preparedStatement.setString(1, room.getBuildingNumber());
                preparedStatement.setString(2, room.getName());
                preparedStatement.setInt(3, room.getId());
                preparedStatement.executeUpdate();
                logger.info("room (id=" + room.getId() + ") data has been changed");
            } catch (SQLException e) {
                logger.error(e);
            }
            result = true;
        return result;
    }

    public boolean removeById(int id) throws RemoveException {
        boolean result = false;
        EventDAO eventDAO = new EventDAO();
        Set<Event> events = eventDAO.findByRoom(findById(id));
        if(events.size() != 0){
            throw new RemoveException("there are planned events for this room");
        } else {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(REMOVE_BY_ID);
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
                result = true;
                logger.info("removed room with id=" + id);
            } catch (SQLException e) {
                logger.error(e);
            }
        }
        return result;
    }

    public Set<Room> findAll(){
        Set<Room> rooms = new HashSet<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CONTAINS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Room room = new Room(resultSet.getString("building_number"),
                                     resultSet.getString("name"));
                room.setId(resultSet.getInt("id"));
                rooms.add(room);
            }
        } catch (SQLException e) {
            logger.error(e);
        }
        return rooms;
    }

    public Room findById(int id){
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                Room room = new Room(resultSet.getString("building_number"),
                                     resultSet.getString("name"));
                room.setId(id);
                return room;
            }
        } catch (SQLException e) {
            logger.error(e);
        }
        return null;
    }
}
