package com.softserveacademy.dao;

import com.softserveacademy.model.*;
import com.softserveacademy.service.EventCreator;
import com.softserveacademy.service.exception.IncorrectAddingException;
import com.softserveacademy.service.util.JdbcService;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.DayOfWeek;
import java.util.HashSet;
import java.util.Set;

public class EventDAO {

    private Connection connection;
    private TeacherDAO teacherDAO = new TeacherDAO();
    private SubjectDAO subjectDAO = new SubjectDAO();
    private GroupDAO groupDAO = new GroupDAO();
    private RoomDAO roomDAO = new RoomDAO();
    private Event matchingEvent;
    private static Logger logger = Logger.getLogger(EventDAO.class);

    private final String CONTAINS = "SELECT * FROM events";
    private final String ADD = "INSERT INTO events (day_of_week, number_event, teacher_id, subject_id, group_id, room_id) " +
                                                                                                "VALUES (?, ?, ?, ?, ?, ?)";
    private final String UPDATE = "UPDATE events SET day_of_week = ?, number_event = ?, teacher_id = ?, " +
                                                                    "subject_id = ?, group_id = ? , room_id = ? WHERE Id = ?";
    private final String REMOVE_BY_ID = "DELETE FROM events WHERE Id = ?";
    private final String FIND_BY_ID = "SELECT * FROM events WHERE Id = ?";
    private final String FIND_BY_DAY_OF_WEEK = "SELECT * FROM events WHERE day_of_week = ?";
    private final String FIND_BY_NUMBER_EVENT = "SELECT * FROM events WHERE number_event = ?";
    private final String FIND_BY_TEACHER = "SELECT * FROM events WHERE teacher_id = ?";
    private final String FIND_BY_DAY_AND_TEACHER = "SELECT * FROM events WHERE (day_of_week = ? AND teacher_id = ?)";
    private final String FIND_BY_SUBJECT = "SELECT * FROM events WHERE subject_id = ?";
    private final String FIND_BY_DAY_AND_SUBJECT = "SELECT * FROM events WHERE (day_of_week = ? AND subject_id = ?)";
    private final String FIND_BY_GROUP = "SELECT * FROM events WHERE group_id = ?";
    private final String FIND_BY_DAY_AND_GROUP = "SELECT * FROM events WHERE (day_of_week = ? AND group_id = ?)";
    private final String FIND_BY_ROOM = "SELECT * FROM events WHERE room_id = ?";
    private final String FIND_BY_DAY_AND_ROOM = "SELECT * FROM events WHERE (day_of_week = ? AND room_id = ?)";

    public EventDAO() {
        this.connection = JdbcService.getConnection();
    }

    public boolean contains(Event event){
        boolean result = false;
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(CONTAINS);
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
            logger.error(e.getMessage(), e);
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
                preparedStatement = connection.prepareStatement(ADD, PreparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setInt(1, event.getDayOfWeek().getValue());
                preparedStatement.setInt(2, event.getNumberEvent().getValue());
                preparedStatement.setInt(3, event.getTeacher().getId());
                preparedStatement.setInt(4, event.getSubject().getId());
                preparedStatement.setInt(5, event.getGroup().getId());
                preparedStatement.setInt(6, event.getRoom().getId());
                preparedStatement.executeUpdate();
                logger.info("a new event was added");
                subjectDAO.addSubjectTeacher(event.getSubject(), event.getTeacher());
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                if(resultSet.next()){
                    event.setId(resultSet.getInt(1));
                }
            } catch (SQLException e) {
                logger.error(e.getMessage(), e);
            }
            result = true;
        }
        return result;
    }

    public boolean update(Event event) throws IncorrectAddingException {
        boolean result = false;
        PreparedStatement preparedStatement;
            try {
                preparedStatement = connection.prepareStatement(UPDATE);
                preparedStatement.setInt(1, event.getDayOfWeek().getValue());
                preparedStatement.setInt(2, event.getNumberEvent().getValue());
                preparedStatement.setInt(3, event.getTeacher().getId());
                preparedStatement.setInt(4, event.getSubject().getId());
                preparedStatement.setInt(5, event.getGroup().getId());
                preparedStatement.setInt(6, event.getRoom().getId());
                preparedStatement.setInt(7, event.getId());
                preparedStatement.executeUpdate();
                logger.info("event (id=" + event.getId() + ") data has been changed");
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
            result = true;
            logger.info("removed event with id=" + id);
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return result;
    }

    public Set<Event> findAll(){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CONTAINS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Event event = new EventCreator()
                        .setDayOfWeek(DayOfWeek.of(resultSet.getInt("day_of_week")))
                        .setNumberEvent(NumberEvent.of(resultSet.getInt("number_event")))
                        .setTeacher(teacherDAO.findById(resultSet.getInt("teacher_id")))
                        .setSubject(subjectDAO.findById(resultSet.getInt("subject_id")))
                        .setGroup(groupDAO.findById(resultSet.getInt("group_id")))
                        .setRoom(roomDAO.findById(resultSet.getInt("room_id")))
                        .create();
                event.setId(resultSet.getInt("id"));
                events.add(event);
            }
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return events;
    }

    public Event findById(int id){
        Event event = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
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
            logger.error(e.getMessage(), e);
        }
        return event;
    }

    public Set<Event> findByDayOfWeek(DayOfWeek dayOfWeek){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_DAY_OF_WEEK);
            preparedStatement.setInt(1, dayOfWeek.getValue());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
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
            logger.error(e.getMessage(), e);
        }
        return events;
    }

    public Set<Event> findByNumberEvent(NumberEvent numberEvent){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_NUMBER_EVENT);
            preparedStatement.setInt(1, numberEvent.getValue());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
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
            logger.error(e.getMessage(), e);
        }
        return events;
    }

    public Set<Event> findByTeacher(Teacher teacher){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_TEACHER);
            preparedStatement.setInt(1, teacher.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
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
            logger.error(e.getMessage(), e);
        }
        return events;
    }

    public Set<Event> findByDayAndTeacher(DayOfWeek dayOfWeek, Teacher teacher){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement(FIND_BY_DAY_AND_TEACHER);
            preparedStatement.setInt(1, dayOfWeek.getValue());
            preparedStatement.setInt(2, teacher.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
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
            logger.error(e.getMessage(), e);
        }
        return events;
    }

    public Set<Event> findBySubject(Subject subject){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement(FIND_BY_SUBJECT);
            preparedStatement.setInt(1, subject.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
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
            logger.error(e.getMessage(), e);
        }
        return events;
    }

    public Set<Event> findByDayAndSubject(DayOfWeek dayOfWeek, Subject subject){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement(FIND_BY_DAY_AND_SUBJECT);
            preparedStatement.setInt(1, dayOfWeek.getValue());
            preparedStatement.setInt(2, subject.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
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
            logger.error(e.getMessage(), e);
        }
        return events;
    }

    public Set<Event> findByGroup(Group group){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement(FIND_BY_GROUP);
            preparedStatement.setInt(1, group.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
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
            logger.error(e.getMessage(), e);
        }
        return events;
    }

    public Set<Event> findByDayAndGroup(DayOfWeek dayOfWeek, Group group){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement(FIND_BY_DAY_AND_GROUP);
            preparedStatement.setInt(1, dayOfWeek.getValue());
            preparedStatement.setInt(2, group.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
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
            logger.error(e.getMessage(), e);
        }
        return events;
    }

    public Set<Event> findByRoom(Room room){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ROOM);
            preparedStatement.setInt(1, room.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
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
            logger.error(e.getMessage(), e);
        }
        return events;
    }

    public Set<Event> findByDayAndRoom(DayOfWeek dayOfWeek, Room room){
        Set<Event> events = new HashSet<>();
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement(FIND_BY_DAY_AND_ROOM);
            preparedStatement.setInt(1, dayOfWeek.getValue());
            preparedStatement.setInt(2, room.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
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
            logger.error(e.getMessage(), e);
        }
        return events;
    }
}
