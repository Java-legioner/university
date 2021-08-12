<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="ua.ivashchuk.controller.UserController" %>
<%@ page import="java.util.List" %>
<%@ page import="ua.ivashchuk.domain.Role" %>

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
            <input type="submit" class="button btn-sign_out" value="<spring:message code="signOut" text="default" />" /> <input
                type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>
    <!-- Page Content -->

    <div style="margin-left:15%">
        <div class="w3-container w3-teal card-text">
            <h1><spring:message code="userEdit.title" text="default" /></h1>
            <div class="lang">
                <span><spring:message code="login.change" /></span>:
                <select id="locales">
                    <%--            <option value=""></option>--%>
                    <option class="sel-lang" value="en"><spring:message code="login.en" text="default" /></option>
                    <option class="sel-lang" value="ua"><spring:message code="login.ua" text="default" /> </option>
                </select>
            </div>
        </div>
        <form action="/user" method='POST'>

            <div class="custom-form">
                <div><input type="text" name="username" value="${user.username}"></div>
                <div style="padding: 10px 0 ">
                    <c:forEach var="role" items="<%=Role.values()%>">
                        <label style="margin-right: 10px">
                            <input type="checkbox" style="margin-right: 5px" name="${role}"  value="role"  items="<%=Role.values()%>"  >${role}
                        </label>
                    </c:forEach>
                </div>
                <input type="hidden" value="${user.id}" name="userId">
                <button type="submit">Save</button>
            </div>

            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>

        </form>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value="/js/language.js"/>"></script>
</body>
</html>
