package com.softserveacademy.dao;

import com.softserveacademy.model.Group;
import com.softserveacademy.service.exception.IncorrectAddingException;
import com.softserveacademy.service.util.JdbcService;
import com.softserveacademy.model.Student;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

public class StudentDAO {

    private final String CONTAINS = "SELECT * FROM students";
    private final String ADD = "INSERT INTO students (age, first_name, last_name, group_id) VALUES (?, ?, ?, ?)";
    private final String UPDATE = "UPDATE students SET age = ?, first_name = ?, last_name = ?, group_id = ? WHERE Id = ?";
    private final String REMOVE_BY_ID = "DELETE FROM students WHERE Id = ?";
    private final String FIND_BY_ID = "SELECT * FROM students WHERE Id = ?";
    private final String FIND_BY_GROUP = "SELECT * FROM students WHERE group_id = ?";

    private Connection connection;
    GroupDAO groupDAO = new GroupDAO();
    private static Logger logger = Logger.getLogger(StudentDAO.class);

    public StudentDAO() {
        this.connection = JdbcService.getConnection();
    }

    public boolean contains(Student student){
        boolean result = false;
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(CONTAINS);
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
            logger.error(e.getMessage(), e);
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
                preparedStatement = connection.prepareStatement(ADD, PreparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setInt(1, student.getAge());
                preparedStatement.setString(2, student.getFirstName());
                preparedStatement.setString(3, student.getLastName());
                preparedStatement.setInt(4, student.getGroup().getId());
                preparedStatement.executeUpdate();
                logger.info("a new student was added");
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                if(resultSet.next()){
                    student.setId(resultSet.getInt(1));
                }
            } catch (SQLException e) {
                logger.error(e.getMessage(), e);
            }
            result = true;
        }
        return result;
    }

    public boolean update(Student student) {
        boolean result = false;
            PreparedStatement preparedStatement;
            try {
                preparedStatement = connection.prepareStatement(UPDATE);
                preparedStatement.setInt(1, student.getAge());
                preparedStatement.setString(2, student.getFirstName());
                preparedStatement.setString(3, student.getLastName());
                preparedStatement.setInt(4, student.getGroup().getId());
                preparedStatement.setInt(5, student.getId());
                preparedStatement.executeUpdate();
                logger.info("student (id=" + student.getId() + ") data has been changed");
            } catch (SQLException e) {
                logger.error(e.getMessage(), e);
            }
            result = true;
        return result;
    }

    public boolean removeById(int id){
        boolean result = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(REMOVE_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            logger.info("removed student with id=" + id);
            result = true;
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return result;
    }

    public Set<Student> findAll(){
        Set<Student> students = new HashSet<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CONTAINS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Student student = new Student(resultSet.getString("first_name"),
                                              resultSet.getString("last_name"));
                student.setId(resultSet.getInt("id"));
                student.setAge(resultSet.getInt("age"));
                student.setGroup(groupDAO.findById(resultSet.getInt("group_id")));
                students.add(student);
            }
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return students;
    }

    public Set<Student> findByGroup(Group group){
        Set<Student> students = new HashSet<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_GROUP);
            preparedStatement.setInt(1, group.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Student student = new Student(resultSet.getString("first_name"),
                                              resultSet.getString("last_name"));
                student.setId(resultSet.getInt("id"));
                student.setAge(resultSet.getInt("age"));
                student.setGroup(groupDAO.findById(resultSet.getInt("group_id")));
                students.add(student);
            }
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return students;
    }

    public Student findById(int id){
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                Student student = new Student(resultSet.getString("first_name"),
                                              resultSet.getString("last_name"));
                student.setId(id);
                student.setAge(resultSet.getInt("age"));
                student.setGroup(groupDAO.findById(resultSet.getInt("group_id")));
                return student;
            }
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return null;
    }
}
