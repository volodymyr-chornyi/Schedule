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
    <title>teacherUpdate</title>
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link href="/css/styles.css" rel="stylesheet" type="text/css">
    <link href="/css/panel.css" rel="stylesheet" type="text/css">
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
                    <li><a href="/">home</a></li>
                    <li><a href="/eventlist">Event</a></li>
                    <li><a href="/subjectlist">Subject</a></li>
                    <li><a href="/teacherlist">Teacher</a></li>
                    <li><a href="/roomlist">Room</a></li>
                    <li><a href="/grouplist">Group</a></li>
                    <li><a href="/studentlist">Student</a></li>
                    <li><a href="/search">Search</a></li>
                    <li><a href="/search?search=schedule">Schedule</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <h1 class="form-style-2-heading"></h1>
    <h1 class="form-style-2-heading">Сhange teacher data</h1>
    <form action="/teacher" method="post">
        <table>
            <tr><th></th><th>update</th></tr>
            <tr>
                <th>first name:</th>
                <td><input type="text" required pattern="^[a-zA-Z]{2,}\'?-?" name="firstName" value="${teacher.firstName}"></td>
            </tr>
            <tr>
                <th>last name:</th>
                <td><input type="text" required pattern="^[a-zA-Z]{2,}\'?-?" name="lastName" value="${teacher.lastName}"></td>
            </tr>
            <tr>
                <th>age:</th>
                <td>
                    <input type="text" required pattern="[1-9]{1}[0-9]{1}" name="age" value="${teacher.age}">
                    <input type="hidden" name="id" value="${teacher.id}">
                </td>
            </tr>
            <tr>
                <th>subjects:</th>
                <td>${teacher.subjectsToString}</td>
            </tr>
            <tr>
                <td>
                    <a href="/teacherlist">Close</a>
                </td>
                <td>
                    <input type="submit" style="cursor: pointer" value="   ok   ">
                </td>
            </tr>
        </table>
    </form>


<%--    <form method="post" id="teacher_update" action="/teacher">--%>

<%--            <table>--%>
<%--                <th>last name</th>--%>
<%--                <th>first name</th>--%>
<%--                <th>age</th>--%>
<%--                <th>subjects</th>--%>
<%--                <th>add</th>--%>
<%--                <tr>--%>
<%--                    <td><input required type="text" id="teacherLastName" name="lastName" value="<%= request.getParameter("lastName")%>"></td>--%>
<%--                    <td><input required type="text" id="teacherFirstName" name="firstName" value="<%= request.getParameter("firstName")%>"></td>--%>
<%--                    <td><input required type="text" id="age" name="age" value="<%= request.getParameter("age")%>">--%>
<%--                    <input hidden name="id" value="<%= request.getParameter("id")%>"></td>--%>
<%--                    <td>--%>
<%--                        <select name="subject">--%>
<%--                            <c:forEach var="subject" items="${teacher.subjects}">--%>
<%--                                <option>${subject.name}</option>--%>
<%--                            </c:forEach>--%>
<%--                        </select>--%>
<%--                    </td>--%>
<%--&lt;%&ndash;                    <td> <p><input type="submit" id="update" style="cursor: pointer" value="update"></p>   </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <p><input type="submit" id="remove" style="cursor: pointer" value="remove"></p>&ndash;%&gt;--%>
<%--                    <td>--%>
<%--                        <a href="/teacher?submit=update&id=<%= request.getParameter("id")%>&lastName=lastName--%>
<%--                        &firstName=firstName&age=age" title="edit">edit</a> /--%>
<%--                        <a href="/teacher?submit=remove&id=${teacher.id}" title="delete ${teacher.name}">delete</a>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--              <a href="/teacher" rel="modal:close">Close</a>--%>


<%--            </table>--%>
<%--    </form>--%>

</body>
</html>
