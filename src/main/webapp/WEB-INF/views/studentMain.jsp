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
                <h1 class="form-style-2-heading"></h1>
                <h1 class="form-style-2-heading">Student adding</h1>
                <tr>
                    <th></th>
                    <td><h3>New student:</h3></td>
                </tr>
                <tr>
                    <th>last name</th>
                    <td><input required type="text" pattern="^[a-zA-Z]{2,}\'?-?" id="studentLastName" name="lastName"></td>
                </tr>
                <tr>
                    <th>first name</th>
                    <td><input required type="text" pattern="^[a-zA-Z]{2,}\'?-?" id="studentFirstName" name="firstName"></td>
                </tr>
                <tr>
                    <th>age</th>
                    <td><input required pattern="[1-9]{1}[0-9]{1}" type="text" id="age" name="age"></td>
                </tr>
                <tr>
                    <th>group</th>
                    <td>
                        <select name="group">
                            <jsp:useBean id="allGroups" scope="request" type="java.util.List"/>
                            <c:forEach var="group" items="${allGroups}">
                                <option>${group.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td>
                        <input type="submit" name="add" style="cursor: pointer" value=" add " title="add">
                    </td>
                </tr>
            </table>
    </form>
</body>
</html>
