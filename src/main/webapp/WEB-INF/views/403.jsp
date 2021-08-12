<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

    <title>Not permitted</title>
</head>
<body class="security-app">

<div class="lc-block">
    <div class="alert-danger">
        <h3>You do not have permission to access this page!</h3>
    </div>
    <form action="/logout" method="post">
        <input type="submit" class="button red big" value="Sign in as different user" /> <input
            type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value="/js/language.js"/>"></script>
</body>
</html>