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
    <title>roomUpdate</title>
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
    <h1 class="form-style-2-heading">Сhange room data</h1>
    <form action="/room" method="post">
        <table>
            <tr><th></th><th>update</th></tr>
            <tr>
                <th>building number:</th>
                <td><input type="text" required pattern="^[a-zA-Z]{1,}\,?'?-?" name="buildingNumber" value="${room.buildingNumber}"></td>
            </tr>
            <tr>
                <th>name:</th>
                <td>
                    <input type="text" required pattern="^[a-zA-Z]{1,}\'?-?" name="name" value="${room.name}">
                    <input type="hidden" name="id" value="${room.id}">
                </td>
            </tr>
            <tr>
                <td>
                    <a href="/roomlist">Close</a>
                </td>
                <td>
                    <input type="submit" style="cursor: pointer" value="   ok   ">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
