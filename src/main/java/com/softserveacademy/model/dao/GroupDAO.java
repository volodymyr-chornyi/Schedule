package com.softserveacademy.model.dao;

import com.softserveacademy.model.entities.Student;
import com.softserveacademy.service.dao.IncorrectAddingException;
import com.softserveacademy.service.dao.JdbcService;
import com.softserveacademy.model.entities.Group;
import com.softserveacademy.service.dao.NoMatchesException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

public class GroupDAO {

    private Connection connection;

    public GroupDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean contains(Group group){
        boolean result = false;
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM groups");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Group currentGroup = new Group(resultSet.getString("name"));
                if (group.equals(currentGroup)){
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

    public boolean add(Group group) throws IncorrectAddingException {
        boolean result = false;
        PreparedStatement preparedStatement;
        if(contains(group)) {
            throw new IncorrectAddingException(group);
        } else {
            try {
                preparedStatement = connection.prepareStatement("INSERT INTO groups " +
                        "(name) " +
                        "VALUES " +
                        "(?)", PreparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, group.getName());
                preparedStatement.executeUpdate();
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                if(resultSet.next()){
                    group.setId(resultSet.getInt(1));
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

    public boolean update(Group group) throws NoMatchesException {
        boolean result = false;
        PreparedStatement preparedStatement;
        if(!(contains(group))) {
            throw new NoMatchesException();
        } else {
            try {
                preparedStatement = connection.prepareStatement("UPDATE groups " +
                        "SET name = ? " +
                        "WHERE Id = ?");
                preparedStatement.setString(1, group.getName());
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

    public boolean removeById(int id) {
        boolean result = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM groups WHERE Id = ?");
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

    public Group findById(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM groups WHERE Id = ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Group group = new Group(resultSet.getString("name"));
                group.setId(id);
                return group;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return null;
    }

    public Set<Student> showStudent(Group group){
        PreparedStatement preparedStatement;
        try {
            Set<Student> students = new HashSet<>();
            preparedStatement = connection.prepareStatement("SELECT * FROM students WHERE group_id = ?");
            preparedStatement.setInt(1, group.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Student student = new Student(resultSet.getString("first_name"),
                                              resultSet.getString("last_name"));
                student.setId(resultSet.getInt("id"));
                student.setAge(resultSet.getInt("age"));
                students.add(student);
            }
            return students;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return null;
    }
}