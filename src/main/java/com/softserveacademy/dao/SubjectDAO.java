package com.softserveacademy.dao;

import com.softserveacademy.service.exception.IncorrectAddingException;
import com.softserveacademy.service.exception.NoMatchesException;
import com.softserveacademy.service.util.JdbcService;
import com.softserveacademy.model.Subject;
import com.softserveacademy.model.Teacher;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;

public class SubjectDAO {

    private final String CONTAINS = "SELECT * FROM subjects";
    private final String ADD = "INSERT INTO subjects (name) VALUES (?)";
    private final String UPDATE = "UPDATE subjects SET name = ? WHERE Id = ?";
    private final String REMOVE_BY_ID = "DELETE FROM subjects WHERE Id = ?";
    private final String FIND_BY_ID = "SELECT * FROM subjects WHERE Id = ?";
    private final String SHOW_TEACHERS = "SELECT teacher_id FROM teachers_subjects WHERE subject_id = ?";
    private final String ADD_SUBJECT_TEACHER = "INSERT INTO teachers_subjects (subject_id, teacher_id) VALUES (?, ?)";
    private Connection connection;

    public SubjectDAO() {
        this.connection = JdbcService.getConnection();
    }

    public boolean contains(Subject subject){
        boolean result = false;
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(CONTAINS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Subject currentSubject = new Subject(resultSet.getString("name"));
                if (subject.equals(currentSubject)){
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

    public boolean add(Subject subject) throws IncorrectAddingException {
        boolean result = false;
        PreparedStatement preparedStatement;
        if(contains(subject)) {
            throw new IncorrectAddingException(subject);
        } else {
            try {
                preparedStatement = connection.prepareStatement(ADD, PreparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, subject.getName());
                preparedStatement.executeUpdate();
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                if(resultSet.next()){
                    subject.setId(resultSet.getInt(1));
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

    public boolean update(Subject subject) throws NoMatchesException {
        boolean result = false;
        PreparedStatement preparedStatement;
        if(!(contains(subject))) {
            throw new NoMatchesException();
        } else {
            try {
                preparedStatement = connection.prepareStatement(UPDATE);
                preparedStatement.setString(1, subject.getName());
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
            PreparedStatement preparedStatement = connection.prepareStatement(REMOVE_BY_ID);
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

    public Set<Subject> findAll(){
        Set<Subject> subjects = new HashSet<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CONTAINS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Subject subject = new Subject(resultSet.getString("name"));
                subject.setId(resultSet.getInt("id"));
                subjects.add(subject);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return subjects;
    }

    public Subject findById(int id){
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                Subject subject = new Subject(resultSet.getString("name"));
                subject.setId(id);
                return subject;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return null;
    }

    public Set<Teacher> showTeachers(Subject subject){
        PreparedStatement preparedStatement;
        try {
            Set<Teacher> teachers = new HashSet<>();
            preparedStatement = connection.prepareStatement(SHOW_TEACHERS);
            preparedStatement.setInt(1, subject.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Teacher teacher = new Teacher(resultSet.getString("first_name"),
                                              resultSet.getString("last_name"));
                teacher.setId(resultSet.getInt("id"));
                teacher.setAge(resultSet.getInt("age"));
                teachers.add(teacher);
            }
            return teachers;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return null;
    }

    public boolean addSubjectTeacher(Subject subject, Teacher teacher){
        boolean result = false;
        if(!(showTeachers(subject).contains(teacher))){
            PreparedStatement preparedStatement;
            try {
                preparedStatement = connection.prepareStatement(ADD_SUBJECT_TEACHER);
                preparedStatement.setInt(1, subject.getId());
                preparedStatement.setInt(2, teacher.getId());
                preparedStatement.executeUpdate();
                result = true;
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                JdbcService.closeConnection();
            }
        }
        return result;
    }
}