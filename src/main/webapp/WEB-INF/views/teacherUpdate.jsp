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
</head>
<body>
    <div id="ex1" class="modal">

    <form method="get" id="teacher_add" action="/teacher">

        <%= request.getParameter("lastName")%>
        <%= request.getParameter("firstName")%>
        <%= request.getParameter("age")%>
            <table>
                <h2 class="form-style-2-heading">Teacher update</h2>
                <th>last name</th>
                <th>first name</th>
                <th>age</th>
                <th>subjects</th>
                <th>add</th>
                <tr>
                    <td><input required type="text" id="teacherLastName" name="lastName"></td>
                    <td><input required type="text" id="teacherFirstName" name="firstName"></td>
                    <td><input required type="text" id="age" name="age"></td>
                    <td>
                        <select name="subject">
                            <c:forEach var="subject" items="${allSubjects}">
                                <option>${subject.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
<%--                        <p><input type="submit" id="update" style="cursor: pointer" value="update"></p>--%>
                        <p><input type="submit" id="remove" style="cursor: pointer" value="remove"></p>
                    <td><a href="/teacher?submit=update&id=<%= request.getParameter("id")%>&lastName=lastName
                        &firstName=firstName&age=age" title="edit ${teacher.name}">edit</a> /
<%--                        <a href="/teacher?submit=remove&id=${teacher.id}" title="delete ${teacher.name}">delete</a></td>--%>
                    </td>
                </tr>
            </table>
    </form>
        <a href="/teacher" rel="modal:close">Close</a>
    </div>


</body>
</html>
