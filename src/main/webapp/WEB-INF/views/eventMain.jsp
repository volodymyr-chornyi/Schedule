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
    <link href="/css/table_schedule.css" rel="stylesheet" type="text/css">
    <link href="/css/styles.css" rel="stylesheet" type="text/css">
    <link href="/css/panel.css" rel="stylesheet" type="text/css">
    <title>eventMain</title>
</head>
<body>

    <header>
        <div class="container">
            <%--        <div class="logo-box">--%>
            <%--            <a href="/">--%>
            <%--                <img src="/img/SoftServe.png">--%>
            <%--            </a>--%>
            <%--        </div>--%>
            <nav>
                <ul>
                    <li><a href="/">home</a></li>
                    <li><a href="/eventlist">Event</a></li>
                    <li><a href="/subjectlist">Subject</a></li>
                    <li><a href="/teacherlist">Teacher</a></li>
                    <li><a href="/roomlist">Room</a></li>
                    <li><a href="/grouplist">Group</a></li>
                    <li><a href="/studentlist">Student</a></li>
                    <li><a href="/search">Search</a></li>
                    <li><a href="/search?search=schedule">Schedule</a></li>
                </ul>
            </nav>
        </div>
    </header>

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
                <h1 class="form-style-2-heading">Event adding</h1>
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
