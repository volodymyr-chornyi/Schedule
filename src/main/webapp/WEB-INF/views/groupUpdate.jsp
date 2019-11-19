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
    <title>groupUpdate</title>
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
    <h1 class="form-style-2-heading">Сhange group data</h1>
    <form action="/group" method="post">
        <table>
            <tr><th></th><th>update</th></tr>
            <tr>
                <th>name:</th>
                <td>
                    <input type="text" required pattern="^[a-zA-Z0-9]{2,}\'?-?" name="name" value="${group.name}">
                </td>
            </tr>
            <tr>
                <th>students:</th>
                <td>
                    <input type="hidden" name="id" value="${group.id}">
                    ${group.studentsToString}
                </td>
            </tr>
            <tr>
                <td>
                    <a href="/grouplist">Close</a>
                </td>
                <td>
                    <input type="submit" style="cursor: pointer" value="   ok   ">
                </td>
            </tr>
        </table>
    </form>

</body>
</html>
