package com.softserveacademy.dao;

import com.softserveacademy.model.Event;
import com.softserveacademy.model.Student;
import com.softserveacademy.service.exception.IncorrectAddingException;
import com.softserveacademy.service.exception.RemoveException;
import com.softserveacademy.service.util.JdbcService;
import com.softserveacademy.model.Group;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

public class GroupDAO {

    private final String CONTAINS = "SELECT * FROM groups";
    private final String ADD = "INSERT INTO groups (name) VALUES (?)";
    private final String UPDATE = "UPDATE groups SET name = ? WHERE Id = ?";
    private final String REMOVE_BY_ID = "DELETE FROM groups WHERE Id = ?";
    private final String FIND_BY_ID = "SELECT * FROM groups WHERE Id = ?";
    private final String FIND_BY_NAME = "SELECT * FROM groups WHERE name = ?";
    private final String SHOW_STUDENTS = "SELECT * FROM students WHERE group_id = ?";
    private Connection connection;
    private static Logger logger = Logger.getLogger(GroupDAO.class);

    public GroupDAO() {
        this.connection = JdbcService.getConnection();
    }

    public boolean contains(Group group){
        boolean result = false;
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(CONTAINS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Group currentGroup = new Group(resultSet.getString("name"));
                if (group.equals(currentGroup)){
                    result = true;
                    break;
                }
            }
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
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
                preparedStatement = connection.prepareStatement(ADD, PreparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, group.getName());
                preparedStatement.executeUpdate();
                logger.info("a new group was added");
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                if(resultSet.next()){
                    group.setId(resultSet.getInt(1));
                }
            } catch (SQLException e) {
                logger.error(e.getMessage(), e);
            }
            result = true;
        }
        return result;
    }

    public boolean update(Group group){
        boolean result = false;
            PreparedStatement preparedStatement;
            try {
                preparedStatement = connection.prepareStatement(UPDATE);
                preparedStatement.setString(1, group.getName());
                preparedStatement.setInt(2, group.getId());
                preparedStatement.executeUpdate();
                logger.info("group (id=" + group.getId() + ") data has been changed");
            } catch (SQLException e) {
                logger.error(e.getMessage(), e);
            }
            result = true;
        return result;
    }

    public boolean removeById(int id) throws RemoveException {
        boolean result = false;
        EventDAO eventDAO = new EventDAO();
        StudentDAO studentDAO = new StudentDAO();
        Set<Event> events = eventDAO.findByGroup(findById(id));
        Set<Student> students = studentDAO.findByGroup(findById(id));
        if(events.size() != 0) {
            throw new RemoveException("there are planned events for this group");
        } else if(students.size() != 0){
            throw new RemoveException("there are students in this group");
        } else {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(REMOVE_BY_ID);
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
                logger.info("removed group with id=" + id);
                result = true;
            } catch (SQLException e) {
                logger.error(e.getMessage(), e);
            }
        }
        return result;
    }

    public Set<Group> findAll() {
        Set<Group> groups = new HashSet<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CONTAINS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Group group = new Group(resultSet.getString("name"));
                group.setId(resultSet.getInt("id"));
                groups.add(group);
            }
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return groups;
    }

    public Group findById(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Group group = new Group(resultSet.getString("name"));
                group.setId(id);
                return group;
            }
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return null;
    }

    public Group findByName(String name){
        Group group = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_NAME);
            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                group = new Group(resultSet.getString("name"));
                group.setId(resultSet.getInt("id"));
            }
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return group;
    }

    public Set<Student> showStudents(Group group){
        PreparedStatement preparedStatement;
        Set<Student> students = new HashSet<>();
        try {
            preparedStatement = connection.prepareStatement(SHOW_STUDENTS);
            preparedStatement.setInt(1, group.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Student student = new Student(resultSet.getString("first_name"),
                                              resultSet.getString("last_name"));
                student.setId(resultSet.getInt("id"));
                student.setAge(resultSet.getInt("age"));
                students.add(student);
            }
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return students;
    }
}