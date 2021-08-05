<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>


</head>
<body class="security-app">


<form:form name='f' action="/registration" method='POST'>

    <div class="lc-block">
        <div>
            <input type="text" class="style-4" name="username"
                   placeholder="First Name" />
        </div>
        <div>
            <input type="text" class="style-4" name="lastName"
                   placeholder="Last Name"/>
        </div>
        <div>
            <input type="email" class="style-4" name="email"
                   placeholder="Email"/>
        </div>
        <div>
            <input type="password" class="style-4" name="password"
                   placeholder="Password" />
        </div>

        <div>
            <input type="submit" value="Registration" class="button red small" />
        </div
        <c:if test="${param.error ne null}">
            <div class="alert-danger">Invalid username and password.</div>
        </c:if>
        <c:if test="${param.logout ne null}">
            <div class="alert-normal">You have been logged out.</div>
        </c:if>
    </div>
<%--    <input type="hidden" name="${_csrf.parameterName}"--%>
<%--           value="${_csrf.token}" />--%>
</form:form>


</body>
</html>