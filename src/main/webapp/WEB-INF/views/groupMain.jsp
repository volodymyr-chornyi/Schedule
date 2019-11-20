<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>groupMain</title>
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

    <form method="get" action="${pageContext.request.contextPath}/teacher">
        <table>
            <h1 class="form-style-2-heading">Group list</h1>
            <th>name</th>
            <th>students</th>
            <th>modification</th>
            <jsp:useBean id="allGroups" scope="request" type="java.util.List"/>
            <c:forEach var="group" items="${allGroups}">
                <tr>
                    <td>${group.name}</td>
                    <td>${group.studentsToString}</td>
                    <td><a href="${pageContext.request.contextPath}/group?submit=edit&id=${group.id}" title="edit ${group.name}">edit</a> /
                    <a href="${pageContext.request.contextPath}/group?submit=remove&id=${group.id}" title="delete ${group.name}">delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </form>

    <form method="post" action="${pageContext.request.contextPath}/group">
            <table>
                <h1 class="form-style-2-heading"></h1>
                <h1 class="form-style-2-heading">Group adding</h1>
                <tr>
                    <th></th>
                    <td><h3>New group:</h3></td>
                </tr>
                <tr>
                    <th>name</th>
                    <td><input required pattern="^[a-zA-Z0-9]{2,}\'?-?" type="text" id="name" name="name"></td>
                </tr>
                <tr>
                    <th></th>
                    <td><input type="submit" style="cursor: pointer" value=" add "></td>
                </tr>
            </table>
    </form>
</body>
</html>
