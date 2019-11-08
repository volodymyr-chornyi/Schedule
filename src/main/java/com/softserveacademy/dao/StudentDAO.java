package com.softserveacademy.dao;

import com.softserveacademy.service.exception.IncorrectAddingException;
import com.softserveacademy.service.exception.NoMatchesException;
import com.softserveacademy.service.util.JdbcService;
import com.softserveacademy.model.Group;
import com.softserveacademy.model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentDAO {

    private Connection connection;

    public StudentDAO() {
        this.connection = JdbcService.getConnection();
    }

    public boolean contains(Student student){
        boolean result = false;
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM students");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Student currentStudent = new Student(resultSet.getString("first_name"),
                                                     resultSet.getString("last_name"));
                if (student.equals(currentStudent)){
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

    public boolean add(Student student) throws IncorrectAddingException {
        boolean result = false;
        PreparedStatement preparedStatement;
        if(contains(student)) {
            throw new IncorrectAddingException(student);
        } else {
            try {
                preparedStatement = connection.prepareStatement("INSERT INTO students " +
                        "(age, first_name, last_name, group_id) " +
                        "VALUES " +
                        "(?, ?, ?, ?)", PreparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setInt(1, student.getAge());
                preparedStatement.setString(2, student.getFirstName());
                preparedStatement.setString(3, student.getFirstName());
                preparedStatement.setInt(4, student.getGroup().getId());
                preparedStatement.executeUpdate();
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                if(resultSet.next()){
                    student.setId(resultSet.getInt(1));
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

    public boolean update(Student student) throws NoMatchesException {
        boolean result = false;
        PreparedStatement preparedStatement;
        if(!(contains(student))) {
            throw new NoMatchesException();
        } else {
            try {
                preparedStatement = connection.prepareStatement("UPDATE students " +
                        "SET age = ?, first_name = ?, last_name = ?, group_id = ? " +
                        "WHERE Id = ?");
                preparedStatement.setInt(1, student.getAge());
                preparedStatement.setString(2, student.getFirstName());
                preparedStatement.setString(3, student.getLastName());
                preparedStatement.setInt(4, student.getGroup().getId());
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
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM students WHERE Id = ?");
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

    public Student findById(int id){
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM students WHERE Id = ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                Student student = new Student(resultSet.getString("first_name"),
                                              resultSet.getString("last_name"));
                student.setId(id);
                student.setAge(resultSet.getInt("age"));
                student.setGroup((Group)resultSet.getObject("group_id"));
                return student;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return null;
    }
}
