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
        <h3 class="w3-bar-item"><spring:message code="menu" text="default" /></h3>

        <a href="/home" class="w3-bar-item w3-button"><spring:message code="menu.home" text="default" /></a>
        <security:authorize access="hasAuthority('USER')">
            <a href="/create-applicant" class="w3-bar-item w3-button"><spring:message code="menu.createApplicant" text="default" /></a>
        </security:authorize>

        <security:authorize access="hasAuthority('ADMIN')">
            <a href="/all-applicants" class="w3-bar-item w3-button"><spring:message code="menu.allApplicant" text="default" /></a>
        </security:authorize>

        <security:authorize access="hasAnyAuthority('ADMIN', 'USER')">
            <a href="/students" class="w3-bar-item w3-button"><spring:message code="menu.student" text="default" /></a>
        </security:authorize>

        <security:authorize access="hasAuthority('ADMIN')">
            <a href="/statements" class="w3-bar-item w3-button"><spring:message code="menu.statement" text="default" /></a>
        </security:authorize>

        <security:authorize access="hasAuthority('ADMIN')">
            <a href="/user" class="w3-bar-item w3-button"><spring:message code="menu.userList" text="default" /></a>
        </security:authorize>

        <form style="margin-left: 5%;margin-top: 5%;" action="/logout" method="post">
            <input type="submit" class="button btn-sign_out" value="<spring:message code="signOut" text="default" />"/> <input
                type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>
    <!-- Page Content -->

    <div style="margin-left:15%">
        <div class="w3-container w3-teal card-text">
            <h1><spring:message code="student.title" text="default" /></h1>
        </div>
        <div class="container">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-8"><h2><spring:message code="student.tableTitle" text="default" /></h2></div>
                            <div class="col-sm-4">
                                <div class="search-box">
                                    <i class="material-icons">&#xE8B6;</i>
                                    <input type="text" id="search" class="form-control" placeholder="Search&hellip;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th><spring:message code="table.Photo" text="default" /></th>
                            <th><spring:message code="table.name" text="default" /></th>
                            <th><spring:message code="table.age" text="default" /></th>
                            <th><spring:message code="table.email" text="default" /></th>
                            <th><spring:message code="table.faculty" text="default" /></th>
                            <th><spring:message code="table.subject" text="default" /></th>
                            <th><spring:message code="table.subject" text="default" /></th>
                            <th><spring:message code="table.subject" text="default" /></th>
                            <th><spring:message code="table.GPA" text="default" /></th>
                            <th><spring:message code="table.actions" text="default" /></th>
                        </tr>
                        </thead>
                        <c:if test="${not empty studentItems}">
                            <c:forEach items="${studentItems}" var="student">
                                <tbody>
                                <tr>
                                    <td>${student.id}</td>
                                    <td class="center"><img src="data:image/jpa;base64, ${student.applicant.encodedImage}"
                                                            style="width:25%"></td>
                                    <td>${student.applicant.firstName} ${student.applicant.lastName}</td>
                                    <td>${student.applicant.age}</td>
                                    <td>${student.applicant.email}</td>
                                    <td>${student.applicant.faculty}</td>
                                    <td>${student.applicant.subject1} <br> Point: ${student.applicant.point1}</td>
                                    <td>${student.applicant.subject2} <br> Point: ${student.applicant.point2}</td>
                                    <td>${student.applicant.subject3} <br> Point: ${student.applicant.point3}</td>
                                    <td>${student.applicant.GPA}</td>
                                    <security:authorize access="hasAuthority('ADMIN')">
                                    <td>

                                        <a href="student?id=${student.id}" class="delete" title="Delete" data-toggle="tooltip"><i
                                                class="material-icons">&#xE872;</i></a>
                                    </td>
                                    </security:authorize>
                                </tr>
                                </tbody>
                            </c:forEach>
                        </c:if>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value="/js/language.js"/>"></script>
<script src="<c:url value="/js/search.js"/>"></script>

</body>
</html>