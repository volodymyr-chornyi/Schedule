<jsp:useBean id="allEvents" scope="request" type="java.util.List"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/css/table_schedule.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/panel.css" rel="stylesheet" type="text/css">
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
                    <li><a href="${pageContext.request.contextPath}/">home</a></li>
                    <li><a href="${pageContext.request.contextPath}/eventlist">Event</a></li>
                    <li><a href="${pageContext.request.contextPath}/subjectlist">Subject</a></li>
                    <li><a href="${pageContext.request.contextPath}/teacherlist">Teacher</a></li>
                    <li><a href="${pageContext.request.contextPath}/roomlist">Room</a></li>
                    <li><a href="${pageContext.request.contextPath}/grouplist">Group</a></li>
                    <li><a href="${pageContext.request.contextPath}/studentlist">Student</a></li>
                    <li><a href="${pageContext.request.contextPath}/search">Search</a></li>
                    <li><a href="${pageContext.request.contextPath}/search?search=schedule">Schedule</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <form method="get" action="${pageContext.request.contextPath}/event">
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
                    <td><a href="${pageContext.request.contextPath}/event?submit=edit&id=${event.id}" title="edit event">edit</a> /
                    <a href="${pageContext.request.contextPath}/event?submit=remove&id=${event.id}" title="delete event">delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </form>

    <form method="post" action="${pageContext.request.contextPath}/event">
            <table>
                <h1 class="form-style-2-heading"></h1>
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
                            <option></option>
                            <jsp:useBean id="allDays" scope="request" type="java.util.List"/>
                            <c:forEach var="day" items="${allDays}">
                                <option value="${day.value}">${day}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <select name="number">
                            <option></option>
                            <jsp:useBean id="allNumberEvent" scope="request" type="java.util.List"/>
                            <c:forEach var="number" items="${allNumberEvent}">
                                <option value="${number.value}">${number}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <select name="subject">
                            <option></option>
                            <jsp:useBean id="allSubjects" scope="request" type="java.util.List"/>
                            <c:forEach var="subject" items="${allSubjects}">
                                <option value="${subject.id}">${subject.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <select name="teacher">
                            <option></option>
                            <jsp:useBean id="allTeachers" scope="request" type="java.util.List"/>
                            <c:forEach var="teacher" items="${allTeachers}">
                                <option value="${teacher.id}">${teacher.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <select name="group">
                            <option></option>
                            <jsp:useBean id="allGroups" scope="request" type="java.util.List"/>
                            <c:forEach var="group" items="${allGroups}">
                                <option value="${group.id}">${group.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <select name="room">
                            <option></option>
                            <jsp:useBean id="allRooms" scope="request" type="java.util.List"/>
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
