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
    <title>roomMain</title>
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link href="/css/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
    <form method="get" action="/room">
        <table>
            <h1 class="form-style-2-heading">Room list</h1>
            <th>buildingNumber</th>
            <th>name</th>
            <th>modification</th>
            <jsp:useBean id="allRooms" scope="request" type="java.util.List"/>
            <c:forEach var="room" items="${allRooms}">
                <tr>
                    <td>${room.buildingNumber}</td>
                    <td>${room.name}</td>
                    <td><a href="/room?submit=update&id=${room.id}&buildingNumber=${room.buildingNumber}
                        &name=${room.name}" title="edit ${room.name}">edit</a> /
                    <a href="/room?submit=remove&id=${room.id}" title="delete ${room.name}">delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </form>

    <form method="post" action="/room">
            <table>
                <h2 class="form-style-2-heading">Room adding</h2>
                <th>buildingNumber</th>
                <th>name</th>
                <th>add</th>
                <tr>
                    <td><input required type="text" id="buildingNumber" name="buildingNumber"></td>
                    <td><input required type="text" id="name" name="name"></td>
                    <td><input type="submit" value="add"></td>
                </tr>
            </table>
    </form>
</body>
</html>
