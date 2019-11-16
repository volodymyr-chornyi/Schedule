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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link href="/css/table.css" rel="stylesheet" type="text/css">
    <link href="/css/styles.css" rel="stylesheet" type="text/css">
    <title>$Title$</title>
  </head>
  <body>

  <ul class="nav nav-tabs" id="myTab" role="tablist">
          <li class="nav-item">
              <a class="nav-link active" id="home-tab" data-toggle="tab" href="/" role="tab" aria-controls="home" aria-selected="true">Home</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" id="event-tab" data-toggle="tab" href="/eventlist" role="tab" aria-controls="event" aria-selected="false">Event</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" id="subject-tab" data-toggle="tab" href="/subjectlist" role="tab" aria-controls="subject" aria-selected="false">Subject</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" id="teacher-tab" data-toggle="tab" href="/teacherlist" role="tab" aria-controls="teacher" aria-selected="false">Teacher</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" id="room-tab" data-toggle="tab" href="/roomlist" role="tab" aria-controls="room" aria-selected="false">Room</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" id="group-tab" data-toggle="tab" href="/grouplist" role="tab" aria-controls="group" aria-selected="false">Group</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" id="student-tab" data-toggle="tab" href="/studentlist" role="tab" aria-controls="student" aria-selected="false">Student</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" id="search-tab" data-toggle="tab" href="/search" role="tab" aria-controls="search" aria-selected="false">Search</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" id="schedule-tab" data-toggle="tab" href="/search?search=schedule" role="tab" aria-controls="schedule" aria-selected="false">Schedule</a>
          </li>
      </ul>
      <div class="tab-content" id="myTabContent">
          <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">...</div>
          <div class="tab-pane fade" id="event" role="tabpanel" aria-labelledby="event-tab">...</div>
          <div class="tab-pane fade" id="subject" role="tabpanel" aria-labelledby="subject-tab">...</div>
          <div class="tab-pane fade" id="teacher" role="tabpanel" aria-labelledby="teacher-tab">...</div>
          <div class="tab-pane fade" id="room" role="tabpanel" aria-labelledby="room-tab">...</div>
          <div class="tab-pane fade" id="group" role="tabpanel" aria-labelledby="group-tab">...</div>
          <div class="tab-pane fade" id="student" role="tabpanel" aria-labelledby="student-tab">...</div>
          <div class="tab-pane fade" id="search" role="tabpanel" aria-labelledby="search-tab">...</div>
          <div class="tab-pane fade" id="schedule" role="tabpanel" aria-labelledby="schedule-tab">...</div>
      </div>
  </body>
</html>
