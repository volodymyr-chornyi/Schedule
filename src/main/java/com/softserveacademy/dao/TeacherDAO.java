package com.softserveacademy.dao;

import com.softserveacademy.service.exception.IncorrectAddingException;
import com.softserveacademy.service.exception.NoMatchesException;
import com.softserveacademy.service.util.JdbcService;
import com.softserveacademy.model.Teacher;

import java.sql.*;

public class TeacherDAO {

    private Connection connection;

    public TeacherDAO() {
        this.connection = JdbcService.getConnection();
    }

    public boolean contains(Teacher teacher){
        boolean result = false;
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM teachers");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Teacher currentTeacher = new Teacher(resultSet.getString("first_name"),
                                                     resultSet.getString("last_name"));
                if (teacher.equals(currentTeacher)){
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

    public boolean add(Teacher teacher) throws IncorrectAddingException {
        boolean result = false;
        PreparedStatement preparedStatement;
        if(contains(teacher)) {
            throw new IncorrectAddingException(teacher);
        } else {
            try {
                preparedStatement = connection.prepareStatement("INSERT INTO teachers " +
                                                                    "(age, first_name, last_name) " +
                                                                    "VALUES " +
                                                                    "(?, ?, ?)", PreparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setInt(1, teacher.getAge());
                preparedStatement.setString(2, teacher.getFirstName());
                preparedStatement.setString(3, teacher.getLastName());
                preparedStatement.executeUpdate();
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                if(resultSet.next()){
                    teacher.setId(resultSet.getInt(1));
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

    public boolean update(Teacher teacher) throws NoMatchesException {
        boolean result = false;
        PreparedStatement preparedStatement;
        if(!(contains(teacher))) {
            throw new NoMatchesException();
        } else {
            try {
                preparedStatement = connection.prepareStatement("UPDATE teachers " +
                                                                    "SET age = ?, first_name = ?, last_name = ? " +
                                                                    "WHERE Id = ?");
                preparedStatement.setInt(1, teacher.getAge());
                preparedStatement.setString(2, teacher.getFirstName());
                preparedStatement.setString(3, teacher.getLastName());
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
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM teachers WHERE Id = ?");
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

    public Teacher findById(int id){
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM teachers WHERE Id = ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                Teacher teacher = new Teacher(resultSet.getString("first_name"),
                                              resultSet.getString("last_name"));
                teacher.setId(id);
                teacher.setAge(resultSet.getInt("age"));
                return teacher;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return null;
    }
}
