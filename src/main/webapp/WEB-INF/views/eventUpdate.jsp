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
    <title>eventUpdate</title>
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link href="/css/styles.css" rel="stylesheet" type="text/css">
    <link href="/css/panel.css" rel="stylesheet" type="text/css">
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

    <h1 class="form-style-2-heading"></h1>
    <h1 class="form-style-2-heading">Сhange event data</h1>
    <form action="/event" method="post">
        <table>
            <tr><th></th><th>update</th></tr>
            <tr>
                <th>day of week:</th>
                <td>
                    <p>Current day: ${event.dayOfWeek}</p>
                    <p>
                        <input type="hidden" name="id" value="${event.id}">
                        <select name="day">
                            <option selected disabled>${event.dayOfWeek}</option>
                            <c:forEach var="day" items="${allDays}">
                                <option value="${day.value}">${day}</option>
                            </c:forEach>
                        </select>
                    </p>
                </td>
            </tr>

            <tr>
                <th>number event:</th>
                <td>
                    <p>Current number: ${event.numberEvent}</p>
                    <p>
                        <select name="number">
                            <option selected disabled>${event.numberEvent}</option>
                            <c:forEach var="number" items="${allNumberEvent}">
                                <option value="${number.value}">${number}</option>
                            </c:forEach>
                        </select>
                    </p>
                </td>
            </tr>

            <tr>
                <th>subject:</th>
                <td>
                    <p>Current subject: ${event.subject.name}</p>
                    <p>
                        <select name="subject">
                            <option selected disabled>${event.subject.name}</option>
                            <c:forEach var="subject" items="${allSubjects}">
                                <option value="${subject.id}">${subject.name}</option>
                            </c:forEach>
                        </select>
                    </p>
                </td>
            </tr>

            <tr>
                <th>teacher:</th>
                <td>
                    <p>Current teacher: ${event.teacher.name}</p>
                    <p>
                        <select name="teacher">
                            <option selected disabled>${event.teacher.name}</option>
                            <c:forEach var="teacher" items="${allTeachers}">
                                <option value="${teacher.id}">${teacher.name}</option>
                            </c:forEach>
                        </select>
                    </p>
                </td>
            </tr>

            <tr>
                <th>group:</th>
                <td>
                    <p>Current group: ${event.group.name}</p>
                    <p>
                        <select name="group">
                            <option selected disabled>${event.group.name}</option>
                            <c:forEach var="group" items="${allGroups}">
                                <option value="${group.id}">${group.name}</option>
                            </c:forEach>
                        </select>
                    </p>
                </td>
            </tr>

            <tr>
                <th>room:</th>
                <td>
                    <p>Current room: ${event.room.name}</p>
                    <p>
                        <select name="room">
                            <option selected disabled>${event.room.fullName}</option>
                            <c:forEach var="room" items="${allRooms}">
                                <option value="${room.id}">${room.fullName}</option>
                            </c:forEach>
                        </select>
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="/eventlist">Close</a>
                </td>
                <td>
                    <input type="submit" style="cursor: pointer" value="   ok   ">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
