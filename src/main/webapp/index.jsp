<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}css/table.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}css/styles.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}css/panel.css" rel="stylesheet" type="text/css">
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


  <table>
      <h1 class="form-style-2-heading">Schedule</h1>
      <th></th>
      <th>S</th>
      <th>C</th>
      <th>H</th>
      <th>E</th>
      <th>D</th>
      <th>U</th>
      <th>L</th>
      <th>E</th>


      <%--                                                --%>
      <%--                MONDAY                         --%>
      <%--                                                --%>
      <tr>
          <th>MONDAY</th>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
      </tr>
      <%--                                                --%>
      <%--                TUESDAY                         --%>
      <%--                                                --%>
      <tr>
          <th>TUESDAY</th>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
      </tr>
      <%--                                                  --%>
      <%--                WEDNESDAY                         --%>
      <%--                                                  --%>
      <tr>
          <th>WEDNESDAY</th>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
      </tr>
      <%--                                                --%>
      <%--                THURSDAY                        --%>
      <%--                                                --%>
      <tr>
          <th>THURSDAY</th>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
      </tr>
      <%--                                               --%>
      <%--                FRIDAY                         --%>
      <%--                                               --%>
      <tr>
          <th>FRIDAY</th>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
      </tr>
      <%--                                                --%>
      <%--                SATURDAY                        --%>
      <%--                                                --%>
      <tr>
          <th>SATURDAY</th>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
      </tr>
      <%--                                               --%>
      <%--                SUNDAY                         --%>
      <%--                                               --%>
      <tr>
          <th>SUNDAY</th>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
      </tr>

  </table>

  </body>
</html>
