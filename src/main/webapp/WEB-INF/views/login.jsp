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


</head>
<body class="security-app">

<div class="container">
    <div>
        <%--    <fieldset>--%>
        <%--            <label><spring:message code="login.choose_lang"/></label>--%>
        <%--            <select id="locales">--%>
        <%--                <option value="en">English</option>--%>
        <%--                <option value="ua">Ukrainian</option>--%>
        <%--            </select>--%>
        <%--    </fieldset>--%>
        <fieldset>
            <label><spring:message code="login.choose_language"/></label>
            <select id="locales">
                <option value="en"><spring:message code='login.english'/></option>
                <option value="ua"><spring:message code='login.ukrainian'/></option>
            </select>
        </fieldset>
    </div>

    <form name='f' action="/login" method='POST'>
        <div class="login-form">
            <div>
                <input type="text" class="style-4" name="username"
                       placeholder="Name"/>
            </div>
            <div>
                <input type="password" class="style-4" name="password"
                       placeholder="Password"/>
            </div>
            <div class="form-btn">
                <div>
                    <input type="submit" value="Sign In" class="button red small"/>
                </div>
                <div>
                    <a href="/registration" class="link">Add new User</a>
                </div>
            </div>
            <c:if test="${param.error ne null}">
                <div class="alert-danger" style="padding-top:15px ">Invalid username and password.</div>
            </c:if>
            <c:if test="${param.logout ne null}">
                <div class="alert-normal" style="padding-top: 15px">You have been logged out.</div>
            </c:if>
        </div>
        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
<script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="js/language.js" type="text/javascript"></script>
</body>
</html>