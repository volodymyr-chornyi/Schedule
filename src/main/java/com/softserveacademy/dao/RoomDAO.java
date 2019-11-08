package com.softserveacademy.dao;

import com.softserveacademy.service.exception.IncorrectAddingException;
import com.softserveacademy.service.exception.NoMatchesException;
import com.softserveacademy.service.util.JdbcService;
import com.softserveacademy.model.Room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RoomDAO {

    private Connection connection;

    public RoomDAO() {
        this.connection = JdbcService.getConnection();
    }

    public boolean contains(Room room){
        boolean result = false;
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM rooms");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Room currentRoom = new Room(resultSet.getInt("building_number"),
                                             resultSet.getString("name"));
                if (room.equals(currentRoom)){
                    result = true;
                    break;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
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
                preparedStatement = connection.prepareStatement("INSERT INTO rooms " +
                        "(building_number, name) " +
                        "VALUES " +
                        "(?, ?)", PreparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setInt(1, room.getBuildingNumber());
                preparedStatement.setString(2, room.getName());
                preparedStatement.executeUpdate();
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                if(resultSet.next()){
                    room.setId(resultSet.getInt(1));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                JdbcService.closeConnection();
            }
            result = true;
        }
        return result;
    }

    public boolean update(Room room) throws NoMatchesException {
        boolean result = false;
        PreparedStatement preparedStatement;
        if(!(contains(room))) {
            throw new NoMatchesException();
        } else {
            try {
                preparedStatement = connection.prepareStatement("UPDATE rooms " +
                        "SET building_number = ?, name = ? " +
                        "WHERE Id = ?");
                preparedStatement.setInt(1, room.getBuildingNumber());
                preparedStatement.setString(2, room.getName());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                JdbcService.closeConnection();
            }
            result = true;
        }
        return result;
    }

    public boolean removeById(int id){
        boolean result = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM rooms WHERE Id = ?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            result = true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return result;
    }

    public Room findById(int id){
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM rooms WHERE Id = ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                Room room = new Room(resultSet.getInt("building_number"),
                                     resultSet.getString("name"));
                room.setId(id);
                return room;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return null;
    }
}