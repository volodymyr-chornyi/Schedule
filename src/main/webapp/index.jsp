<%--
  Created by IntelliJ IDEA.
  User: Chornyi
  Date: 08.11.2019
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link href="/css/styles.css" rel="stylesheet" type="text/css">
    <link href="/css/panel.css" rel="stylesheet" type="text/css">
    <title>$Title$</title>
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

  </body>
</html>
