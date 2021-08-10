<%@ page import="ua.ivashchuk.domain.Faculty" %>
<%@ page import="ua.ivashchuk.domain.Subject" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:set var="cotextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>

    <title>Create Applicants</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" type="text/css" href="
      <c:url value="/css/app.css"/>"/>

</head>
<body class="security-app">

<div class="lc-block">
    <!-- Sidebar -->
    <div class="w3-sidebar w3-light-grey w3-bar-block " style="width:15%">
        <h3 class="w3-bar-item">Menu</h3>
        <a href="/home" class="w3-bar-item w3-button">Home</a>
        <security:authorize access="hasAuthority('USER')">
            <a href="/create-applicant" class="w3-bar-item w3-button">Apply for admission</a>
        </security:authorize>

        <security:authorize access="hasAuthority('ADMIN')">
            <a href="/all-applicants" class="w3-bar-item w3-button">All applicants</a>
        </security:authorize>

        <security:authorize access="hasAnyAuthority('ADMIN', 'USER')">
            <a href="/students" class="w3-bar-item w3-button">Students</a>
        </security:authorize>

        <security:authorize access="hasAuthority('ADMIN')">
            <a href="/statements" class="w3-bar-item w3-button">Statement</a>
        </security:authorize>

        <security:authorize access="hasAuthority('ADMIN')">
            <a href="/user" class="w3-bar-item w3-button">User List</a>
        </security:authorize>
        <form style="margin-left: 5%;margin-top: 5%;" action="/logout" method="post">
            <input type="submit" class="button btn-sign_out" value="Sign Out"/> <input
                type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>

    <!-- Page Content -->
    <div style="margin-left:15%">

        <div class="w3-container w3-teal">
            <h1> Registration of applicant</h1>

        </div>


        <div class="w3-container">

            <form:form method="POST" action="${contextPath}/addApplicant" enctype="multipart/form-data">
                <table class="form-applicant">
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="firstName"></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lastName"></td>
                    </tr>
                    <tr>
                        <td>Age</td>
                        <td><input type="text" name="age"></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email"></td>
                    </tr>
                    <tr>
                        <td>Faculty</td>
                        <td>
                            <select type="text" class="form-control" id="faculty"
                                    name="faculty"
                                    value="${applicant.faculty}">

                                <c:forEach var="state" items="<%=Faculty.values()%>">
                                    <option value="${state}">${state}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>Photo (format 3 x 4)</td>
                        <td><input type="file" name="image"></td>
                    </tr>

                </table>

                <h4>Select the subjects and indicate the points received <br> as a result of the external evaluation
                </h4>
                <table class="form-applicant">
                    <tr>
                        <td>
                            <select type="text" class="form-control" id="subject1"
                                    name="subject1"
                                    value="${applicant.subject1}">

                                <c:forEach var="state" items="<%=Subject.values()%>">
                                    <option value="${state}">${state}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td><input type="number" name="point1"></td>
                    </tr>
                    <tr>
                        <td>
                            <select type="text" class="form-control" id="subject2"
                                    name="subject2"
                                    value="${applicant.subject2}">

                                <c:forEach var="state" items="<%=Subject.values()%>">
                                    <option value="${state}">${state}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td><input type="number" name="point2"></td>
                    </tr>
                    <tr>
                        <td>
                            <select type="text" class="form-control" id="subject3"
                                    name="subject3"
                                    value="${applicant.subject3}">

                                <c:forEach var="state" items="<%=Subject.values()%>">
                                    <option value="${state}">${state}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td><input type="number" name="point3"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>