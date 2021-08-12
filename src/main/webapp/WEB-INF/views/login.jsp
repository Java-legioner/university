<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="
      <c:url value="/css/login.css"/>"/>
    <title><spring:message code="login.title" text="default" /></title>


</head>
<body class="security-app">

<div class="container">


    <form name='f' action="/login" method='POST'>
        <div class="login-form">
            <div>
                <input type="text" class="style-4" name="username"
                       placeholder="<spring:message code="login.name" text="default"/>" />
            </div>
            <div>
                <input type="password" class="style-4" name="password"
                       placeholder="<spring:message code="login.password" text="default"/>" />
            </div>
            <div class="form-btn">
                <div>
                    <input type="submit"  class="button red small"  value="<spring:message code="login.signIn" text="default"/>" />
                </div>
                <div>
                    <a href="/registration" class="link"><spring:message code="login.registration" /></a>
                </div>
            </div>
            <c:if test="${param.error ne null}">
                <div class="alert-danger" style="padding-top:15px "><spring:message code="alertDanger" text="default" /></div>
            </c:if>
            <c:if test="${param.logout ne null}">
                <div class="alert-normal" style="padding-top: 15px"><spring:message code="alertNormal" text="default" /></div>
            </c:if>
        </div>
        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
    </form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value="/js/language.js"/>"></script>
</body>
</html>