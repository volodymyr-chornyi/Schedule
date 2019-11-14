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
    <title>groupMain</title>
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link href="/css/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
    <form method="get" action="/teacher">
        <table>
            <h1 class="form-style-2-heading">Group list</h1>
            <th>name</th>
            <th>students</th>
            <th>modification</th>
            <c:forEach var="group" items="${allGroups}">
                <tr>
                    <td>${group.name}</td>
                    <td>${group.students}</td>
                    <td><a href="/group?submit=update&id=${group.id}&name=${group.name}" title="edit ${group.name}">edit</a> /
                    <a href="/group?submit=remove&id=${group.id}" title="delete ${group.name}">delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </form>

    <form method="post" action="/group">
            <table>
                <h2 class="form-style-2-heading">Group adding</h2>
                <th>name</th>
                <th>add</th>
                <tr>
                    <td><input required size="3" type="text" id="name" name="name"></td>
                    <td><input type="submit" value="add"></td>
                </tr>
            </table>
    </form>
</body>
</html>
