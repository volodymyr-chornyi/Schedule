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
    <title>subjectMain</title>
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link href="/css/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
    <form method="get" action="/subject">
        <table>
            <h1 class="form-style-2-heading">Subject list</h1>
            <th>name</th>
            <th>teachers</th>
            <th>modification</th>
            <c:forEach var="subject" items="${allSubjects}">
                <tr>
                    <td>${subject.name}</td>
                    <td>
                        <c:forEach var="teacher" items="${subject.teachers}">
                            ${teacher.name},
                        </c:forEach>
                    </td>
                    <td><a href="/subject?submit=update&id=${subject.id}&name=${subject.name}" title="edit ${subject.name}">edit</a> /
                        <a href="/subject?submit=remove&id=${subject.id}" title="delete ${subject.name}">delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </form>

    <form method="post" action="/subject">
        <table>
            <h2 class="form-style-2-heading">Subject adding</h2>
            <th>name</th>
            <th>add</th>
            <tr>
                <td><input required type="text" id="name" name="name"></td>
                <td>
                    <input type="submit" value="add">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
