<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>studentMain</title>
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

<%--    <form method="get" action="/teacher">--%>
        <h1 class="form-style-2-heading">Student list</h1>
        <table>
            <th>last name</th>
            <th>first name</th>
            <th>age</th>
            <th>group</th>
            <th>modification</th>
            <jsp:useBean id="allStudents" scope="request" type="java.util.List"/>
            <c:forEach var="student" items="${allStudents}">
                <tr>
                    <td>${student.lastName}</td>
                    <td>${student.firstName}</td>
                    <td>${student.age}</td>
                    <td>${student.group.name}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/student?submit=edit&id=${student.id}" title="edit ${student.name}">edit</a> /
                        <a href="${pageContext.request.contextPath}/student?submit=remove&id=${student.id}" title="delete ${student.name}">delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

    <form method="post" id="student_add" action="${pageContext.request.contextPath}/student">
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
                            <jsp:useBean id="allGroups" scope="request" type="java.util.List"/>
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
</body>
</html>
