<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>schedule</title>
    <link href="${pageContext.request.contextPath}/css/table_schedule.css" rel="stylesheet" type="text/css">
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

    <form>
        <table>
            <h1 class="form-style-2-heading">Schedule</h1>
            <th></th>
            <th>FIRST</th>
            <th>SECOND</th>
            <th>THIRD</th>
            <th>FOURTH</th>
            <th>FIFTH</th>
            <th>SIXTH</th>
            <th>SEVENTH</th>
            <th>EIGHTH</th>


<%--                                                --%>
<%--                MONDAY                         --%>
<%--                                                --%>
            <tr>
                <th>MONDAY</th>
                    <td>
                        <jsp:useBean id="mondayEvent" scope="request" type="java.util.List"/>
                        <c:forEach var="event" items="${mondayEvent}">
                            <c:if test="${event.numberEvent.value==1}">
                                <p>----------</p><p>${event.schedule}</p><p>----------</p>
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach var="event" items="${mondayEvent}">
                            <c:if test="${event.numberEvent.value==2}">
                                <p>----------</p><p>${event.schedule}</p><p>----------</p>
                            </c:if>
                        </c:forEach>
                    </td>

                <td>
                    <c:forEach var="event" items="${mondayEvent}">
                        <c:if test="${event.numberEvent.value==3}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>

                <td>
                    <c:forEach var="event" items="${mondayEvent}">
                        <c:if test="${event.numberEvent.value==4}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>

                <td>
                    <c:forEach var="event" items="${mondayEvent}">
                        <c:if test="${event.numberEvent.value==5}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>

                <td>
                    <c:forEach var="event" items="${mondayEvent}">
                        <c:if test="${event.numberEvent.value==6}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>

                <td>
                    <c:forEach var="event" items="${mondayEvent}">
                        <c:if test="${event.numberEvent.value==7}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>

                <td>
                    <c:forEach var="event" items="${mondayEvent}">
                        <c:if test="${event.numberEvent.value==8}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
            </tr>
<%--                                                --%>
<%--                TUESDAY                         --%>
<%--                                                --%>
            <tr>
                <th>TUESDAY</th>
                <td>
                    <jsp:useBean id="tuesdayEvent" scope="request" type="java.util.List"/>
                    <c:forEach var="event" items="${tuesdayEvent}">
                        <c:if test="${event.numberEvent.value==1}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${tuesdayEvent}">
                        <c:if test="${event.numberEvent.value==2}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${tuesdayEvent}">
                        <c:if test="${event.numberEvent.value==3}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${tuesdayEvent}">
                        <c:if test="${event.numberEvent.value==4}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${tuesdayEvent}">
                        <c:if test="${event.numberEvent.value==5}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${tuesdayEvent}">
                        <c:if test="${event.numberEvent.value==6}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${tuesdayEvent}">
                        <c:if test="${event.numberEvent.value==7}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${tuesdayEvent}">
                        <c:if test="${event.numberEvent.value==8}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
            </tr>
<%--                                                  --%>
<%--                WEDNESDAY                         --%>
<%--                                                  --%>
            <tr>
                <th>WEDNESDAY</th>
                <td>
                    <jsp:useBean id="wednesdayEvent" scope="request" type="java.util.List"/>
                    <c:forEach var="event" items="${wednesdayEvent}">
                        <c:if test="${event.numberEvent.value==1}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${wednesdayEvent}">
                        <c:if test="${event.numberEvent.value==2}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${wednesdayEvent}">
                        <c:if test="${event.numberEvent.value==3}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${wednesdayEvent}">
                        <c:if test="${event.numberEvent.value==4}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${wednesdayEvent}">
                        <c:if test="${event.numberEvent.value==5}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${wednesdayEvent}">
                        <c:if test="${event.numberEvent.value==6}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${wednesdayEvent}">
                        <c:if test="${event.numberEvent.value==7}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${wednesdayEvent}">
                        <c:if test="${event.numberEvent.value==8}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
            </tr>
<%--                                                --%>
<%--                THURSDAY                        --%>
<%--                                                --%>
            <tr>
                <th>THURSDAY</th>
                <td>
                    <jsp:useBean id="thursdayEvent" scope="request" type="java.util.List"/>
                    <c:forEach var="event" items="${thursdayEvent}">
                        <c:if test="${event.numberEvent.value==1}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${thursdayEvent}">
                        <c:if test="${event.numberEvent.value==2}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${thursdayEvent}">
                        <c:if test="${event.numberEvent.value==3}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${thursdayEvent}">
                        <c:if test="${event.numberEvent.value==4}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${thursdayEvent}">
                        <c:if test="${event.numberEvent.value==5}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${thursdayEvent}">
                        <c:if test="${event.numberEvent.value==6}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${thursdayEvent}">
                        <c:if test="${event.numberEvent.value==7}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${thursdayEvent}">
                        <c:if test="${event.numberEvent.value==8}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
            </tr>
<%--                                               --%>
<%--                FRIDAY                         --%>
<%--                                               --%>
            <tr>
                <th>FRIDAY</th>
                <td>
                    <jsp:useBean id="fridayEvent" scope="request" type="java.util.List"/>
                    <c:forEach var="event" items="${fridayEvent}">
                        <c:if test="${event.numberEvent.value==1}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${fridayEvent}">
                        <c:if test="${event.numberEvent.value==2}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${fridayEvent}">
                        <c:if test="${event.numberEvent.value==3}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${fridayEvent}">
                        <c:if test="${event.numberEvent.value==4}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${fridayEvent}">
                        <c:if test="${event.numberEvent.value==5}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${fridayEvent}">
                        <c:if test="${event.numberEvent.value==6}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${fridayEvent}">
                        <c:if test="${event.numberEvent.value==7}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${fridayEvent}">
                        <c:if test="${event.numberEvent.value==8}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
            </tr>
<%--                                                --%>
<%--                SATURDAY                        --%>
<%--                                                --%>
            <tr>
                <th>SATURDAY</th>
                <td>
                    <jsp:useBean id="saturdayEvent" scope="request" type="java.util.List"/>
                    <c:forEach var="event" items="${saturdayEvent}">
                        <c:if test="${event.numberEvent.value==1}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${saturdayEvent}">
                        <c:if test="${event.numberEvent.value==2}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${saturdayEvent}">
                        <c:if test="${event.numberEvent.value==3}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${saturdayEvent}">
                        <c:if test="${event.numberEvent.value==4}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${saturdayEvent}">
                        <c:if test="${event.numberEvent.value==5}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${saturdayEvent}">
                        <c:if test="${event.numberEvent.value==6}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${saturdayEvent}">
                        <c:if test="${event.numberEvent.value==7}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${saturdayEvent}">
                        <c:if test="${event.numberEvent.value==8}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
            </tr>
<%--                                               --%>
<%--                SUNDAY                         --%>
<%--                                               --%>
            <tr>
                <th>SUNDAY</th>
                <td>
                    <jsp:useBean id="sundayEvent" scope="request" type="java.util.List"/>
                    <c:forEach var="event" items="${sundayEvent}">
                        <c:if test="${event.numberEvent.value==1}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${sundayEvent}">
                        <c:if test="${event.numberEvent.value==2}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${sundayEvent}">
                        <c:if test="${event.numberEvent.value==3}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${sundayEvent}">
                        <c:if test="${event.numberEvent.value==4}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${sundayEvent}">
                        <c:if test="${event.numberEvent.value==5}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${sundayEvent}">
                        <c:if test="${event.numberEvent.value==6}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${sundayEvent}">
                        <c:if test="${event.numberEvent.value==7}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="event" items="${sundayEvent}">
                        <c:if test="${event.numberEvent.value==8}">
                            <p>----------</p><p>${event.schedule}</p><p>----------</p>
                        </c:if>
                    </c:forEach>
                </td>
            </tr>

        </table>
    </form>

</body>
</html>
