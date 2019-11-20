<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>subjectMain</title>
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

    <form method="get" action="${pageContext.request.contextPath}/subject">
        <table>
            <h1 class="form-style-2-heading">Subject list</h1>
            <th>name</th>
            <th>teachers</th>
            <th>modification</th>
            <jsp:useBean id="allSubjects" scope="request" type="java.util.List"/>
            <c:forEach var="subject" items="${allSubjects}">
                <tr>
                    <td>${subject.name}</td>
                    <td>${subject.teachersToString}
<%--                        <c:forEach var="teacher" items="${subject.teachers}">--%>
<%--                            ${teacher.name},--%>
<%--                        </c:forEach>--%>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/subject?submit=edit&id=${subject.id}" title="edit ${subject.name}">edit</a> /
                        <a href="${pageContext.request.contextPath}/subject?submit=remove&id=${subject.id}" title="delete ${subject.name}">delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>

    <form method="post" action="${pageContext.request.contextPath}/subject">
        <table>
            <h1 class="form-style-2-heading">Subject adding</h1>
            <th>name</th>
            <th>add</th>
            <tr>
                <td><input required pattern="^[a-zA-Z]{2,}\'?-?" type="text" id="name" name="name"></td>
                <td>
                    <input type="submit" value="add">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
