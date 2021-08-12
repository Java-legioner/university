<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

    <%--    <link rel="stylesheet" type="text/css" href="--%>
    <%--      <c:url value="/css/login.css"/>"/>--%>
    <link type="text/css" href="css/login.css" rel="stylesheet">
    <title><spring:message code="registration.title" text="default" /></title>

</head>
<body class="security-app">
<div class="container">
    <div class="login-form ">
    <form:form name='f' action="/registration" method='POST'>

        <div class="lc-block">
            <div>
                <input type="text" class="style-4" name="username"
                       placeholder="<spring:message code="registration.firstName" text="default" />" />
            </div>
            <div>
                <input type="text" class="style-4" name="lastName"
                       placeholder="<spring:message code="registration.lastName" text="default" />" />
            </div>
            <div>
                <input type="email" class="style-4" name="email"
                       placeholder="<spring:message code="registration.email" text="default" />" />
            </div>
            <div>
                <input type="password" class="style-4" name="password"
                       placeholder="<spring:message code="registration.password" text="default" />" />
            </div>

            <div>
                <input type="submit"  style="margin-top: 30px;" class="button red small" value="<spring:message code="registration.title" text="default" />" />
            </div
            <c:if test="${param.error ne null}">
                <div class="alert-danger"><spring:message code="alertDanger" text="default" /></div>
            </c:if>
            <c:if test="${param.logout ne null}">
                <div class="alert-normal"><spring:message code="alertNormal" text="default" /></div>
            </c:if>
        </div>
        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
    </form:form>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value="/js/language.js"/>"></script>
</body>
</html>