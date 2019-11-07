package com.softserveacademy.model.dao;

import com.softserveacademy.model.entities.*;
import com.softserveacademy.service.EventCreator;
import com.softserveacademy.service.dao.IncorrectAddingException;
import com.softserveacademy.service.dao.JdbcService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.DayOfWeek;
import java.util.HashSet;
import java.util.Set;

public class EventDAO {

    private Connection connection;
    private TeacherDAO teacherDAO = new TeacherDAO(JdbcService.getConnection());
    private SubjectDAO subjectDAO = new SubjectDAO(JdbcService.getConnection());
    private GroupDAO groupDAO = new GroupDAO(JdbcService.getConnection());
    private RoomDAO roomDAO = new RoomDAO(JdbcService.getConnection());
    private Event matchingEvent;

    public EventDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean contains(Event event){
        boolean result = false;
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM events");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Event currentEvent = new EventCreator()
                        .setDayOfWeek(DayOfWeek.of(resultSet.getInt("day_of_week")))
                        .setNumberEvent(NumberEvent.of(resultSet.getInt("number_event")))
                        .setTeacher(teacherDAO.findById(resultSet.getInt("teacher_id")))
                        .setSubject(subjectDAO.findById(resultSet.getInt("subject_id")))
                        .setGroup(groupDAO.findById(resultSet.getInt("group_id")))
                        .setRoom(roomDAO.findById(resultSet.getInt("room_id")))
                        .create();
                if (event.equals(currentEvent)){
                    this.matchingEvent = currentEvent;
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

    public boolean add(Event event) throws IncorrectAddingException {
        boolean result = false;
        PreparedStatement preparedStatement;
        if(contains(event)) {
            throw new IncorrectAddingException(event, matchingEvent);
        } else {
            try {
                preparedStatement = connection.prepareStatement("INSERT INTO events " +
                        "(day_of_week, number_event, teacher_id, subject_id, group_id, room_id) " +
                        "VALUES " +
                        "(?, ?, ?, ?, ?, ?)", PreparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setInt(1, event.getDayOfWeek().getValue());
                preparedStatement.setInt(2, event.getNumberEvent().getValue());
                preparedStatement.setInt(3, event.getTeacher().getId());
                preparedStatement.setInt(4, event.getSubject().getId());
                preparedStatement.setInt(5, event.getGroup().getId());
                preparedStatement.setInt(6, event.getRoom().getId());
                preparedStatement.executeUpdate();
                subjectDAO.addSubjectTeacher(event.getSubject(), event.getTeacher());
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                if(resultSet.next()){
                    event.setId(resultSet.getInt(1));
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

    public boolean removeById(int id){
        boolean result = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM events WHERE Id = ?");
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

    public boolean removeSeveral(Set<Event> events){
        boolean result = false;
        for (Event event: events) {
            removeById(event.getId());
            result = true;
        }
        return result;
    }

    public Event findById(int id){
        Event event = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM events WHERE Id = ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                event = new EventCreator()
                        .setDayOfWeek(DayOfWeek.of(resultSet.getInt("day_of_week")))
                        .setNumberEvent(NumberEvent.of(resultSet.getInt("number_event")))
                        .setTeacher(teacherDAO.findById(resultSet.getInt("teacher_id")))
                        .setSubject(subjectDAO.findById(resultSet.getInt("subject_id")))
                        .setGroup(groupDAO.findById(resultSet.getInt("group_id")))
                        .setRoom(roomDAO.findById(resultSet.getInt("room_id")))
                        .create();
                event.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return event;
    }

    public Set<Event> findByDayOfWeek(DayOfWeek dayOfWeek){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM events WHERE day_of_week = ?");
            preparedStatement.setInt(1, dayOfWeek.getValue());
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                Event currentEvent = new EventCreator()
                        .setDayOfWeek(DayOfWeek.of(resultSet.getInt("day_of_week")))
                        .setNumberEvent(NumberEvent.of(resultSet.getInt("number_event")))
                        .setTeacher(teacherDAO.findById(resultSet.getInt("teacher_id")))
                        .setSubject(subjectDAO.findById(resultSet.getInt("subject_id")))
                        .setGroup(groupDAO.findById(resultSet.getInt("group_id")))
                        .setRoom(roomDAO.findById(resultSet.getInt("room_id")))
                        .create();
                currentEvent.setId(resultSet.getInt("id"));
                events.add(currentEvent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return events;
    }

    public Set<Event> findByTeacher(Teacher teacher){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM events WHERE teacher_id = ?");
            preparedStatement.setInt(1, teacher.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                Event currentEvent = new EventCreator()
                        .setDayOfWeek(DayOfWeek.of(resultSet.getInt("day_of_week")))
                        .setNumberEvent(NumberEvent.of(resultSet.getInt("number_event")))
                        .setTeacher(teacher)
                        .setSubject(subjectDAO.findById(resultSet.getInt("subject_id")))
                        .setGroup(groupDAO.findById(resultSet.getInt("group_id")))
                        .setRoom(roomDAO.findById(resultSet.getInt("room_id")))
                        .create();
                currentEvent.setId(resultSet.getInt("id"));
                events.add(currentEvent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return events;
    }

    public Set<Event> findByDayAndTeacher(DayOfWeek dayOfWeek, Teacher teacher){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement("SELECT * FROM events WHERE (day_of_week = ? AND teacher_id = ?)");
            preparedStatement.setInt(1, dayOfWeek.getValue());
            preparedStatement.setInt(2, teacher.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                Event currentEvent = new EventCreator()
                        .setDayOfWeek(dayOfWeek)
                        .setNumberEvent(NumberEvent.of(resultSet.getInt("number_event")))
                        .setTeacher(teacher)
                        .setSubject(subjectDAO.findById(resultSet.getInt("subject_id")))
                        .setGroup(groupDAO.findById(resultSet.getInt("group_id")))
                        .setRoom(roomDAO.findById(resultSet.getInt("room_id")))
                        .create();
                currentEvent.setId(resultSet.getInt("id"));
                events.add(currentEvent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return events;
    }

    public Set<Event> findBySubject(Subject subject){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement("SELECT * FROM events WHERE subject_id = ?");
            preparedStatement.setInt(1, subject.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                Event currentEvent = new EventCreator()
                        .setDayOfWeek(DayOfWeek.of(resultSet.getInt("day_of_week")))
                        .setNumberEvent(NumberEvent.of(resultSet.getInt("number_event")))
                        .setTeacher(teacherDAO.findById(resultSet.getInt("teacher_id")))
                        .setSubject(subject)
                        .setGroup(groupDAO.findById(resultSet.getInt("group_id")))
                        .setRoom(roomDAO.findById(resultSet.getInt("room_id")))
                        .create();
                currentEvent.setId(resultSet.getInt("id"));
                events.add(currentEvent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return events;
    }

    public Set<Event> findByDayAndSubject(DayOfWeek dayOfWeek, Subject subject){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement("SELECT * FROM events WHERE (day_of_week = ? AND subject_id = ?)");
            preparedStatement.setInt(1, dayOfWeek.getValue());
            preparedStatement.setInt(2, subject.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                Event currentEvent = new EventCreator()
                        .setDayOfWeek(dayOfWeek)
                        .setNumberEvent(NumberEvent.of(resultSet.getInt("number_event")))
                        .setTeacher(teacherDAO.findById(resultSet.getInt("teacher_id")))
                        .setSubject(subject)
                        .setGroup(groupDAO.findById(resultSet.getInt("group_id")))
                        .setRoom(roomDAO.findById(resultSet.getInt("room_id")))
                        .create();
                currentEvent.setId(resultSet.getInt("id"));
                events.add(currentEvent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return events;
    }

    public Set<Event> findByGroup(Group group){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement("SELECT * FROM events WHERE group_id = ?");
            preparedStatement.setInt(1, group.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                Event currentEvent = new EventCreator()
                        .setDayOfWeek(DayOfWeek.of(resultSet.getInt("day_of_week")))
                        .setNumberEvent(NumberEvent.of(resultSet.getInt("number_event")))
                        .setTeacher(teacherDAO.findById(resultSet.getInt("teacher_id")))
                        .setSubject(subjectDAO.findById(resultSet.getInt("subject_id")))
                        .setGroup(group)
                        .setRoom(roomDAO.findById(resultSet.getInt("room_id")))
                        .create();
                currentEvent.setId(resultSet.getInt("id"));
                events.add(currentEvent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return events;
    }

    public Set<Event> findByDayAndGroup(DayOfWeek dayOfWeek, Group group){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement("SELECT * FROM events WHERE (day_of_week = ? AND group_id = ?)");
            preparedStatement.setInt(1, dayOfWeek.getValue());
            preparedStatement.setInt(2, group.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                Event currentEvent = new EventCreator()
                        .setDayOfWeek(dayOfWeek)
                        .setNumberEvent(NumberEvent.of(resultSet.getInt("number_event")))
                        .setTeacher(teacherDAO.findById(resultSet.getInt("teacher_id")))
                        .setSubject(subjectDAO.findById(resultSet.getInt("subject_id")))
                        .setGroup(group)
                        .setRoom(roomDAO.findById(resultSet.getInt("room_id")))
                        .create();
                currentEvent.setId(resultSet.getInt("id"));
                events.add(currentEvent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return events;
    }

    public Set<Event> findByRoom(Room room){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM events WHERE room_id = ?");
            preparedStatement.setInt(1, room.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                Event currentEvent = new EventCreator()
                        .setDayOfWeek(DayOfWeek.of(resultSet.getInt("day_of_week")))
                        .setNumberEvent(NumberEvent.of(resultSet.getInt("number_event")))
                        .setTeacher(teacherDAO.findById(resultSet.getInt("teacher_id")))
                        .setSubject(subjectDAO.findById(resultSet.getInt("subject_id")))
                        .setGroup(groupDAO.findById(resultSet.getInt("group_id")))
                        .setRoom(room)
                        .create();
                currentEvent.setId(resultSet.getInt("id"));
                events.add(currentEvent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return events;
    }

    public Set<Event> findByDayAndRoom(DayOfWeek dayOfWeek, Room room){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement("SELECT * FROM events WHERE (day_of_week = ? AND room_id = ?)");
            preparedStatement.setInt(1, dayOfWeek.getValue());
            preparedStatement.setInt(2, room.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                Event currentEvent = new EventCreator()
                        .setDayOfWeek(dayOfWeek)
                        .setNumberEvent(NumberEvent.of(resultSet.getInt("number_event")))
                        .setTeacher(teacherDAO.findById(resultSet.getInt("teacher_id")))
                        .setSubject(subjectDAO.findById(resultSet.getInt("subject_id")))
                        .setGroup(groupDAO.findById(resultSet.getInt("group_id")))
                        .setRoom(room)
                        .create();
                currentEvent.setId(resultSet.getInt("id"));
                events.add(currentEvent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcService.closeConnection();
        }
        return events;
    }
}
