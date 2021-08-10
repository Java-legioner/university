<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:set var="cotextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome!</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="
      <c:url value="/css/app.css"/>"/>
    <link rel="stylesheet" type="text/css" href="
      <c:url value="/css/table.css"/>"/>
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
        <div class="w3-container w3-teal card-text">
            <h1>Home</h1>
        </div>
        <div class="w3-container">
            <h2 class="text-center">Welcome! ${pageContext.request.userPrincipal.name}</h2>
        </div>
        <div>
            <h3 class="text-center">On this site you can apply for admission to our University</h3>
        </div>
        <div class="button-center">
            <a class="btn btn-primary" href="/create-applicant" role="button">Apply for admission</a>
        </div>



    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>