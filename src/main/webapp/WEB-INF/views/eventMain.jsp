<%--
  Created by IntelliJ IDEA.
  User: Chornyi
  Date: 11.11.2019
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link href="/css/styles.css" rel="stylesheet" type="text/css">
    <title>eventMain</title>
</head>
<body>

    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link" id="home-tab" data-toggle="tab" href="/" role="tab" aria-controls="home" aria-selected="true">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" id="event-tab" data-toggle="tab" href="/eventlist" role="tab" aria-controls="event" aria-selected="false">Event</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="subject-tab" data-toggle="tab" href="/subjectlist" role="tab" aria-controls="subject" aria-selected="false">Subject</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="teacher-tab" data-toggle="tab" href="/teacherlist" role="tab" aria-controls="teacher" aria-selected="false">Teacher</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="room-tab" data-toggle="tab" href="/roomlist" role="tab" aria-controls="room" aria-selected="false">Room</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="group-tab" data-toggle="tab" href="/grouplist" role="tab" aria-controls="group" aria-selected="false">Group</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="student-tab" data-toggle="tab" href="/studentlist" role="tab" aria-controls="student" aria-selected="false">Student</a>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">...</div>
        <div class="tab-pane fade show active" id="event" role="tabpanel" aria-labelledby="event-tab">...</div>
        <div class="tab-pane fade" id="subject" role="tabpanel" aria-labelledby="subject-tab">...</div>
        <div class="tab-pane fade" id="teacher" role="tabpanel" aria-labelledby="teacher-tab">...</div>
        <div class="tab-pane fade" id="room" role="tabpanel" aria-labelledby="room-tab">...</div>
        <div class="tab-pane fade" id="group" role="tabpanel" aria-labelledby="group-tab">...</div>
        <div class="tab-pane fade" id="student" role="tabpanel" aria-labelledby="student-tab">...</div>
    </div>
    <form method="get" action="/event">
        <table>
            <h1 class="form-style-2-heading">Event list</h1>
            <th>day of week</th>
            <th>event number</th>
            <th>subject</th>
            <th>teacher</th>
            <th>group</th>
            <th>room</th>
            <th>modification</th>
            <c:forEach var="event" items="${allEvents}">
                <tr>
                    <td>${event.dayOfWeek}</td>
                    <td>${event.numberEvent}</td>
                    <td>${event.subject.name}</td>
                    <td>${event.teacher.name}</td>
                    <td>${event.group.name}</td>
                    <td>${event.room.fullName}</td>
                    <td><a href="/event?submit=update&id=${event.id}&dayOfWeek=${event.dayOfWeek}
                        &numberEvent=${event.numberEvent}&subject=${event.subject.id}&teacher=${event.teacher.id}
                        &group=${event.group.id}&room=${event.room.id}" title="edit event">edit</a> /
                    <a href="/event?submit=remove&id=${event.id}" title="delete event">delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </form>

    <form method="post" action="/event">
            <table>
                <h2 class="form-style-2-heading">Event adding</h2>
                <th>day of week</th>
                <th>event number</th>
                <th>subject</th>
                <th>teacher</th>
                <th>group</th>
                <th>room</th>
                <th>add</th>
                <tr>
                    <td>
                        <select name="day">
                            <c:forEach var="day" items="${allDays}">
                                <option value="${day.value}">${day}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <select name="number">
                            <c:forEach var="number" items="${allNumberEvent}">
                                <option value="${number.value}">${number}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <select name="subject">
                            <c:forEach var="subject" items="${allSubjects}">
                                <option value="${subject.id}">${subject.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <select name="teacher">
                            <c:forEach var="teacher" items="${allTeachers}">
                                <option value="${teacher.id}">${teacher.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <select name="group">
                            <c:forEach var="group" items="${allGroups}">
                                <option value="${group.id}">${group.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <select name="room">
                            <c:forEach var="room" items="${allRooms}">
                                <option value="${room.id}">${room.fullName}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td><input type="submit" value="add"></td>
                </tr>
            </table>
    </form>
</body>
</html>
