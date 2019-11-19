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
    <title>teacherMain</title>
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

    <form method="get" action="/teacher">
        <h1 class="form-style-2-heading">Teacher list</h1>
        <table>
            <th>last name</th>
            <th>first name</th>
            <th>age</th>
            <th>subjects</th>
            <th>modification</th>
            <c:forEach var="teacher" items="${allTeachers}">
                <tr>
                    <td>${teacher.lastName}</td>
                    <td>${teacher.firstName}</td>
                    <td>${teacher.age}</td>
                    <td>${teacher.subjects}</td>
                    <td>
                        <a href="/teacher?submit=edit&id=${teacher.id}" title="edit ${teacher.name}">edit</a> /
                        <a href="/teacher?submit=remove&id=${teacher.id}" title="delete ${teacher.name}">delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>

    <form method="post" id="teacher_add" action="/teacher">
            <table>
                <h1 class="form-style-2-heading">Teacher adding</h1>
                <th>last name</th>
                <th>first name</th>
                <th>age</th>
                <th>subjects</th>
                <th>add</th>
                <tr>
                    <td><input required pattern="^[a-zA-Z]{2,}\'?-?" type="text" id="teacherLastName" name="lastName"></td>
                    <td><input required pattern="^[a-zA-Z]{2,}\'?-?" type="text" id="teacherFirstName" name="firstName"></td>
                    <td><input required pattern="[1-9]{1}[0-9]{1}" type="text" id="age" name="age"></td>
                    <td>
                        <select name="subject">
                            <c:forEach var="subject" items="${allSubjects}">
                                <option>${subject.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <input type="submit" name="add" style="cursor: pointer" value="add" title="add">
                    </td>
                </tr>
            </table>
    </form>

</body>
</html>
