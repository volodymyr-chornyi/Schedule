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
    <title>studentUpdate</title>
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
    <h1 class="form-style-2-heading">Сhange student data</h1>
    <form action="/student" method="post">
        <table>
            <tr><th></th><th>update</th></tr>
            <tr>
                <th>first name:</th>
                <td><input type="text" required pattern="^[a-zA-Z]{2,}\'?-?" name="firstName" value="${student.firstName}"></td>
            </tr>
            <tr>
                <th>last name:</th>
                <td><input type="text" required pattern="^[a-zA-Z]{2,}\'?-?" name="lastName" value="${student.lastName}"></td>
            </tr>
            <tr>
                <th>age:</th>
                <td>
                    <input type="text" required pattern="[1-9]{1}[0-9]{1}" name="age" value="${student.age}">
                    <input type="hidden" name="id" value="${student.id}">
                </td>
            </tr>
            <tr>
                <th>group:</th>
                <td>
                    <p>Current group: ${student.group.name}</p>
                    <p>
                        <select name="group">
                            <c:forEach var="group" items="${allGroups}">
                                <option>${group.name}</option>
                            </c:forEach>
                        </select>
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="/studentlist">Close</a>
                </td>
                <td>
                    <input type="submit" style="cursor: pointer" value="   ok   ">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
