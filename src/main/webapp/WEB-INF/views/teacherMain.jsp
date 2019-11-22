<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>teacherMain</title>
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
            <h1 class="form-style-2-heading">Teacher list</h1>
            <table>
                <th>last name</th>
                <th>first name</th>
                <th>age</th>
                <th>subjects</th>
                <th>modification</th>
                <jsp:useBean id="allTeachers" scope="request" type="java.util.List"/>
                <c:forEach var="teacher" items="${allTeachers}">
                    <tr>
                        <td>${teacher.lastName}</td>
                        <td>${teacher.firstName}</td>
                        <td>${teacher.age}</td>
                        <td>${teacher.subjects}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/teacher?submit=edit&id=${teacher.id}" title="edit ${teacher.name}">edit</a> /
                            <a href="${pageContext.request.contextPath}/teacher?submit=remove&id=${teacher.id}" title="delete ${teacher.name}">delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form>

        <form method="post" id="teacher_add" action="${pageContext.request.contextPath}/teacher">
                <table>
                    <h1 class="form-style-2-heading"></h1>
                    <h1 class="form-style-2-heading">Teacher adding</h1>
                    <tr>
                        <th></th>
                        <td><h3>New teacher:</h3></td>
                    </tr>
                    <tr>
                        <th>last name</th>
                        <td><input required pattern="^[a-zA-Z]{2,}\'?-?" type="text" id="teacherLastName" name="lastName"></td>
                    </tr>
                    <tr>
                        <th>first name</th>
                        <td><input required pattern="^[a-zA-Z]{2,}\'?-?" type="text" id="teacherFirstName" name="firstName"></td>
                    </tr>
                    <tr>
                        <th>age</th>
                        <td><input required pattern="[1-9]{1}[0-9]{1}" type="text" id="age" name="age"></td>
                    </tr>
                    <tr>
                        <th>subjects</th>
                        <td>
                            <select name="subject">
                                <jsp:useBean id="allSubjects" scope="request" type="java.util.List"/>
                                <c:forEach var="subject" items="${allSubjects}">
                                    <option>${subject.name}</option>
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

<%--        <form method="post" action="${pageContext.request.contextPath}/teacher">--%>
<%--            <table>--%>
<%--                <h1 class="form-style-2-heading"></h1>--%>
<%--                <h1 class="form-style-2-heading">Add subject to teacher</h1>--%>
<%--                <tr>--%>
<%--                    <th></th>--%>
<%--                    <td><h3>Add subject to teacher:</h3></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <th>teacher</th>--%>
<%--                    <td>--%>
<%--                        <select name="teacher">--%>
<%--                            <c:forEach var="teacher" items="${allTeachers}">--%>
<%--                                <option>${teacher.lastName} ${teacher.firstName}</option>--%>
<%--                            </c:forEach>--%>
<%--                        </select>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <th>subject</th>--%>
<%--                    <td>--%>
<%--                        <select name="subject">--%>
<%--                            <c:forEach var="subject" items="${allSubjects}">--%>
<%--                                <option>${subject.name}</option>--%>
<%--                            </c:forEach>--%>
<%--                        </select>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <th></th>--%>
<%--                    <td>--%>
<%--                        <input type="submit" name="teach" style="cursor: pointer" value=" teach " title="add">--%>
<%--                    &lt;%&ndash;                        <a href="${pageContext.request.contextPath}/teacher?submit=addsubject&id=${teacher.id}">teach</a>&ndash;%&gt;--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--            </table>--%>
<%--        </form>--%>

    </body>
</html>
