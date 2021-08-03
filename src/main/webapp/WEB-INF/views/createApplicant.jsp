<%@ page import="ua.ivashchuk.domain.Faculty" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="cotextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>


    <title>Create Applicants</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body class="security-app">

<div class="lc-block">
    <!-- Sidebar -->
    <div class="w3-sidebar w3-light-grey w3-bar-block " style="width:15%">
        <h3 class="w3-bar-item">Menu</h3>
        <a href="/home" class="w3-bar-item w3-button">Home</a>
        <a href="/create-applicant" class="w3-bar-item w3-button">Apply for admission</a>
        <a href="/all-applicants" class="w3-bar-item w3-button">All applicants</a>
        <a href="#" class="w3-bar-item w3-button">Bucket</a>
        <form style="margin-left: 5%;margin-top: 5%;" action="/logout" method="post">
            <input type="submit" class="button red big" value="Sign Out"/> <input
                type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>

    <!-- Page Content -->
    <div style="margin-left:15%">

        <div class="w3-container w3-teal">
            <h1> Registration of applicant</h1>

        </div>


        <div class="w3-container">
            <%--@elvariable id="applicant" type=""--%>
            <form:form method="POST" action="${contextPath}/addApplicant" enctype="multipart/form-data" >
                <table>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text"name="firstName"></td>
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

<%--                    <tr>--%>
<%--                        <td>Points</td>--%>
<%--                        <td><input type="number" name="points"></td>--%>
<%--                    </tr>--%>
                    <tr>
                        <td>Photo (format 3 x 4)</td>
                        <td><input type="file" name="image"></td>
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