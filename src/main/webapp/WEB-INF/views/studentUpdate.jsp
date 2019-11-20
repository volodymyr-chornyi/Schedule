<jsp:useBean id="student" scope="request" type="com.softserveacademy.model.Student"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>studentUpdate</title>
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

    <h1 class="form-style-2-heading"></h1>
    <h1 class="form-style-2-heading">Сhange student data</h1>
    <form action="${pageContext.request.contextPath}/student" method="post">
        <table>
            <tr><th></th><th>update</th></tr>
            <tr>
                <th>first name:</th>
                <td><input type="text" required pattern="^[a-zA-Z]{2,}\'?-?" name="firstName" value="${student.firstName}"></td>
            </tr>
            <tr>
                <th>last name:</th>
                <td><input type="text" required pattern="^[a-zA-Z]{2,}\'?-?" name="lastName" value="${student.lastName}"></td>
            </tr>
            <tr>
                <th>age:</th>
                <td>
                    <input type="text" required pattern="[1-9]{1}[0-9]{1}" name="age" value="${student.age}">
                    <input type="hidden" name="id" value="${student.id}">
                </td>
            </tr>
            <tr>
                <th>group:</th>
                <td>
                    <p>Current group: ${student.group.name}</p>
                    <p>
                        <select name="group">
                            <jsp:useBean id="allGroups" scope="request" type="java.util.List"/>
                            <c:forEach var="group" items="${allGroups}">
                                <option>${group.name}</option>
                            </c:forEach>
                        </select>
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="${pageContext.request.contextPath}/studentlist">Close</a>
                </td>
                <td>
                    <input type="submit" style="cursor: pointer" value="   ok   ">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
