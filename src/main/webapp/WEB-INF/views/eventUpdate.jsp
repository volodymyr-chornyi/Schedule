<jsp:useBean id="event" scope="request" type="com.softserveacademy.model.Event"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>eventUpdate</title>
    <link href="${pageContext.request.contextPath}/css/table.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}css/panel.css" rel="stylesheet" type="text/css">
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

    <h1 class="form-style-2-heading"></h1>
    <h1 class="form-style-2-heading">Сhange event data</h1>
    <form action="${pageContext.request.contextPath}/event" method="post">
        <table>
            <tr><th></th><th>update</th></tr>
            <tr>
                <th>day of week:</th>
                <td>
                    <p>Current day: ${event.dayOfWeek}</p>
                    <p>
                        <input type="hidden" name="id" value="${event.id}">
                        <select name="day">
                            <option selected value="${event.dayOfWeek.value}">${event.dayOfWeek}</option>
                            <jsp:useBean id="allDays" scope="request" type="java.util.List"/>
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
                            <option selected value="${event.numberEvent.value}">${event.numberEvent}</option>
                            <jsp:useBean id="allNumberEvent" scope="request" type="java.util.List"/>
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
                            <option selected value="${event.subject.id}">${event.subject.name}</option>
                            <jsp:useBean id="allSubjects" scope="request" type="java.util.List"/>
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
                            <option selected value="${event.teacher.id}">${event.teacher.name}</option>
                            <jsp:useBean id="allTeachers" scope="request" type="java.util.List"/>
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
                            <option selected value="${event.group.id}">${event.group.name}</option>
                            <jsp:useBean id="allGroups" scope="request" type="java.util.List"/>
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
                            <option selected value="${event.room.id}">${event.room.fullName}</option>
                            <jsp:useBean id="allRooms" scope="request" type="java.util.List"/>
                            <c:forEach var="room" items="${allRooms}">
                                <option value="${room.id}">${room.fullName}</option>
                            </c:forEach>
                        </select>
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="${pageContext.request.contextPath}/eventlist">Close</a>
                </td>
                <td>
                    <input type="submit" style="cursor: pointer" value="   ok   ">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
