package com.softserveacademy.dao;

import com.softserveacademy.model.Subject;
import com.softserveacademy.service.exception.IncorrectAddingException;
import com.softserveacademy.service.exception.NoMatchesException;
import com.softserveacademy.service.util.JdbcService;
import com.softserveacademy.model.Teacher;
import org.apache.log4j.Logger;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;

public class TeacherDAO {

    private final String CONTAINS = "SELECT * FROM teachers";
    private final String ADD = "INSERT INTO teachers (age, first_name, last_name) VALUES (?, ?, ?)";
    private final String UPDATE = "UPDATE teachers SET age = ?, first_name = ?, last_name = ? WHERE Id = ?";
    private final String REMOVE_BY_ID = "DELETE FROM teachers WHERE Id = ?";
    private final String FIND_BY_ID = "SELECT * FROM teachers WHERE Id = ?";
    private final String SHOW_SUBJECTS = "SELECT * FROM subjects LEFT JOIN teachers_subjects ON subjects.id = teachers_subjects.subject_id WHERE teacher_id = ?";
    private Connection connection;
    private static Logger logger = Logger.getLogger(TeacherDAO.class);

    public TeacherDAO() {
        this.connection = JdbcService.getConnection();
    }

    public boolean contains(Teacher teacher){
        boolean result = false;
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(CONTAINS);
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
        }
        return result;
    }

    public boolean add(Teacher teacher) throws IncorrectAddingException {
        boolean result = false;
        PreparedStatement preparedStatement;
        if(contains(teacher)) {
            logger.info("attempt to add an existing teacher");
            throw new IncorrectAddingException(teacher);
        } else {
            try {
                preparedStatement = connection.prepareStatement(ADD, PreparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setInt(1, teacher.getAge());
                preparedStatement.setString(2, teacher.getFirstName());
                preparedStatement.setString(3, teacher.getLastName());
                preparedStatement.executeUpdate();
                logger.info("a new teacher was added");
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                if(resultSet.next()){
                    teacher.setId(resultSet.getInt(1));
                }
            } catch (SQLException e) {
                logger.error("database error while trying to add a new teacher");
                e.printStackTrace();
            }
            result = true;
        }
        return result;
    }

    public boolean update(Teacher teacher) throws IncorrectAddingException {
        boolean result = false;
            PreparedStatement preparedStatement;
            try {
                preparedStatement = connection.prepareStatement(UPDATE);
                preparedStatement.setInt(1, teacher.getAge());
                preparedStatement.setString(2, teacher.getFirstName());
                preparedStatement.setString(3, teacher.getLastName());
                preparedStatement.setInt(4, teacher.getId());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            result = true;
        return result;
    }

    public boolean removeById(int id){
        boolean result = false;
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM teachers_subjects WHERE teacher_id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
            PreparedStatement preparedStatement = connection.prepareStatement(REMOVE_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            logger.info("removed teacher with id=" + id);
            result = true;
        } catch (SQLException e) {
            logger.error("database error while trying to remove teacher");
            e.printStackTrace();
        }
        return result;
    }

    public Set<Teacher> findAll(){
        Set<Teacher> teachers = new HashSet<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CONTAINS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Teacher teacher = new Teacher(resultSet.getString("first_name"),
                                              resultSet.getString("last_name"));
                teacher.setId(resultSet.getInt("id"));
                teacher.setAge(resultSet.getInt("age"));
                teachers.add(teacher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teachers;
    }

    public Teacher findById(int id){
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
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
        }
        return null;
    }

    public Set<Subject> showSubjects(Teacher teacher){
        Set<Subject> subjects = new HashSet<>();
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(SHOW_SUBJECTS);
            preparedStatement.setInt(1, teacher.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Subject subject = new Subject(resultSet.getString("name"));
                subject.setId(resultSet.getInt("id"));
                subjects.add(subject);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subjects;
    }
}
