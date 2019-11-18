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
    <title>studentMain</title>
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

<%--    <form method="get" action="/teacher">--%>
        <h1 class="form-style-2-heading">Student list</h1>
        <table>
            <th>last name</th>
            <th>first name</th>
            <th>age</th>
            <th>group</th>
            <th>modification</th>
            <c:forEach var="student" items="${allStudents}">
                <tr>
                    <td>${student.lastName}</td>
                    <td>${student.firstName}</td>
                    <td>${student.age}</td>
                    <td>${student.group.name}</td>


                    <td>
<%--                        <input type="hidden" name="lastName" value="${teacher.lastName}">--%>
<%--                        <input type="hidden" name="firstName" value="${teacher.firstName}">--%>
<%--                        <input type="hidden" name="age" value="${teacher.age}">--%>
<%--                        <input type="text" name="id" value="${teacher.id}">--%>
<%--                        <input type="hidden" name="subjects" value="${teacher.subjects}">--%>

<%--                        <input type="submit" name="submit" value="edit" title="${teacher.id}">--%>
<%--                        <input type="submit" name="submit" value="remove" title="remove ${teacher.name}">--%>
<%--                    <td><a href="/teacherupdate">edit</a> /--%>
<%--                    <td><a href="/teacherupdate?submit=${teacher}">edit</a> /--%>

                    <a href="/student?submit=edit&id=${student.id}" title="edit ${student.name}">edit</a> /
                    <a href="/student?submit=remove&id=${student.id}" title="delete ${student.name}">delete</a></td>
                </tr>
            </c:forEach>

        </table>
<%--    </form>--%>

    <form method="post" id="student_add" action="/student">
            <table>
                <h1 class="form-style-2-heading">Student adding</h1>
                <th>last name</th>
                <th>first name</th>
                <th>age</th>
                <th>group</th>
                <th>add</th>
                <tr>
                    <td><input required type="text" id="studentLastName" name="lastName"></td>
                    <td><input required type="text" id="studentFirstName" name="firstName"></td>
                    <td><input required type="text" id="age" name="age"></td>
                    <td>
                        <select name="group">
                            <c:forEach var="group" items="${allGroups}">
                                <option>${group.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <input type="submit" name="add" style="cursor: pointer" value="add" title="add">
                    </td>
                </tr>
            </table>
    </form>

<%--<script>--%>
<%--    document.ready (function () {--%>
<%--        $("#add").bind("click", function () {--%>
<%--            $.ajax ({--%>
<%--                url: "/teacher",--%>
<%--                type: "POST",--%>
<%--                data: ({})--%>
<%--            })--%>
<%--        })--%>
<%--    })--%>


<%--</script>--%>
<%--    <script src="/libs/jquery/jQuery v3.4.1.js"></script>--%>
<%--    <script src="/js/main.js"></script>--%>


</body>
</html>
