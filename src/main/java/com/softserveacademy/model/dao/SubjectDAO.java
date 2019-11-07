package com.softserveacademy.model.dao;

import com.softserveacademy.service.dao.IncorrectAddingException;
import com.softserveacademy.service.dao.JdbcService;
import com.softserveacademy.model.entities.Subject;
import com.softserveacademy.model.entities.Teacher;
import com.softserveacademy.service.dao.NoMatchesException;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;

public class SubjectDAO {

    private Connection connection;

    public SubjectDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean contains(Subject subject){
        boolean result = false;
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM subjects");
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
                preparedStatement = connection.prepareStatement("INSERT INTO subjects " +
                        "(name) " +
                        "VALUES " +
                        "(?)", PreparedStatement.RETURN_GENERATED_KEYS);
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
                preparedStatement = connection.prepareStatement("UPDATE subjects " +
                        "SET name = ? " +
                        "WHERE Id = ?");
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
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM subjects WHERE Id = ?");
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

    public Subject findById(int id){
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM subjects WHERE Id = ?");
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
            preparedStatement = connection.prepareStatement("SELECT teacher_id FROM teachers_subjects WHERE subject_id = ?");
            preparedStatement.setInt(1, subject.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Teacher teacher = new Teacher(resultSet.getString("first_name"),
                                              resultSet.getString("last_name"));
                teacher.setId(resultSet.getInt("id"));
                teacher.setAge(resultSet.getInt("age"));
                teachers.add(teacher);
            }
//            if(resultSet.next()){
//                Array teacherId = resultSet.getArray("teacher_id");
//                int [] ids = (int[])teacherId.getArray();
//                for (int teacher: ids) {
//                    teachers.add(teacherDAO.findById(teacher));
//                }
//            }
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
                preparedStatement = connection.prepareStatement("INSERT INTO teachers_subjects " +
                                                                    "(subject_id, teacher_id) " +
                                                                    "VALUES " +
                                                                    "(?, ?)");
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