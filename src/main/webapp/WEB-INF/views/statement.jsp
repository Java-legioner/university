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
            <h1 class="header-lang"> <spring:message code="statement.title" text="default" /></h1>
            <div class="lang">
                <span><spring:message code="login.change" /></span>:
                <select id="locales">
                    <%--            <option value=""></option>--%>
                    <option class="sel-lang" value="en"><spring:message code="login.en" text="default" /></option>
                    <option class="sel-lang" value="ua"><spring:message code="login.ua" text="default" /> </option>
                </select>
            </div>
        </div>
        <div class="container">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-8"><h2><spring:message code="statement.title" text="default" /></h2></div>
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
<%--                            <th>#</th>--%>
<%--                            <th>Photo</th>--%>
                            <th><spring:message code="registration.firstName" text="default" /></th>
                            <th><spring:message code="registration.lastName" text="default" /></th>
                            <th><spring:message code="table.faculty" text="default" /></th>
                            <th><spring:message code="table.subject" text="default" /></th>
                            <th><spring:message code="table.subject" text="default" /></th>
                            <th><spring:message code="table.subject" text="default" /></th>
                            <th><spring:message code="table.GPA" text="default" /></th>
                            <th><spring:message code="table.actions" text="default" /></th>
                        </tr>
                        </thead>
                        <c:if test="${not empty statementItems}">
                            <c:forEach items="${statementItems}" var="statement">
                                <tbody>
                                <tr>
<%--                                    <td>${statement.id}</td>--%>
<%--                                    <td class="center"><img src="data:image/jpa;base64, ${statement.applicant.encodedImage}"--%>
<%--                                                            style="width:25%"></td>--%>
                                    <td>${statement.applicant.firstName} </td>
                                    <td>${statement.applicant.lastName}</td>
                                    <td>${statement.applicant.faculty}</td>
                                    <td>${statement.applicant.subject1} <br> Point: ${statement.applicant.point1}</td>
                                    <td>${statement.applicant.subject2} <br> Point: ${statement.applicant.point2}</td>
                                    <td>${statement.applicant.subject3} <br> Point: ${statement.applicant.point3}</td>
                                    <td>${statement.applicant.GPA}</td>
                                    <td>

                                        <a href="statement?id=${statement.id}" class="delete" title="Delete" data-toggle="tooltip"><i
                                                class="material-icons">&#xE872;</i></a>
                                    </td>
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
<script src="<c:url value="/js/search.js"/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value="/js/language.js"/>"></script>
</body>
</html>