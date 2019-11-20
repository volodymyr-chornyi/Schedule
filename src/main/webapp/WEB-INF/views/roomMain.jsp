<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>roomMain</title>
    <link href="${pageContext.request.contextPath}/css/table.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/panel.css" rel="stylesheet" type="text/css">
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

    <form method="get" action="${pageContext.request.contextPath}/room">
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
                    <td><a href="${pageContext.request.contextPath}/room?submit=edit&id=${room.id}" title="edit ${room.name}">edit</a> /
                    <a href="${pageContext.request.contextPath}/room?submit=remove&id=${room.id}" title="delete ${room.name}">delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </form>

    <form method="post" action="${pageContext.request.contextPath}/room">
            <table>
                <h1 class="form-style-2-heading"></h1>
                <h1 class="form-style-2-heading">Room adding</h1>
                <tr>
                    <th></th>
                    <td><h3>New room:</h3></td>
                </tr>
                <tr>
                    <th>buildingNumber</th>
                    <td><input required type="text" pattern="^[a-zA-Z]{1,}\,?'?-?" id="buildingNumber" name="buildingNumber"></td>
                </tr>
                <tr>
                    <th>name</th>
                    <td><input required type="text" pattern="^[a-zA-Z]{1,}\'?-?" id="name" name="name"></td>
                </tr>
                <tr>
                    <th></th>
                    <td><input type="submit" style="cursor: pointer" value=" add "></td>
                </tr>
            </table>
    </form>
</body>
</html>
