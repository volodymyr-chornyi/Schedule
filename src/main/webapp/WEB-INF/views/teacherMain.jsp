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
</head>
<body>
    <form method="get" action="/teacher">
        <table>
            <h1 class="form-style-2-heading">Teacher list</h1>
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
<%--                    <td>--%>
<%--                        <input type="submit" name="submit" id="${teacher.id}" value="remove" title="remove ${teacher.name}">--%>
<%--                    </td>--%>
                    <td><a href="/teacher?submit=update&id=${teacher.id}&lastName=${teacher.lastName}
                        &firstName=${teacher.firstName}&age=${teacher.age}" title="edit ${teacher.name}">edit</a> /
                    <a href="/teacher?submit=remove&id=${teacher.id}" title="delete ${teacher.name}">delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </form>

    <form method="post" action="/teacher">
            <table>
                <h2 class="form-style-2-heading">Teacher adding</h2>
                <th>last name</th>
                <th>first name</th>
                <th>age</th>
                <th>subjects</th>
                <th>add</th>
                <tr>
                    <td><input required size="3" type="text" id="lastName" name="lastName"></td>
                    <td><input required size="3" type="text" id="firstName" name="firstName"></td>
                    <td><input required size="1" type="text" id="age" name="age"></td>
                    <td>
                        <select name="subject">
                            <c:forEach var="subject" items="${allSubjects}">
                                <option>${subject.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <input type="submit" value="add">
                    </td>
                </tr>
            </table>
    </form>
</body>
</html>
