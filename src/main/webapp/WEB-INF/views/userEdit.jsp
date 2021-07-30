<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="ua.ivashchuk.controller.UserController" %>
<%@ page import="java.util.List" %>
<%@ page import="ua.ivashchuk.domain.Role" %>

<!DOCTYPE html>
<html>
<head>


</head>
<body class="security-app">

<div>
    <h3>User editor</h3>
</div>
<form action="/user" method='POST'>

    <div class="lc-block">
        <div><input type="text" name="username" value="${user.username}"></div>
        <div>
            <c:forEach var="role" items="<%=Role.values()%>">
                <label>
                    <input type="checkbox" name="${role}"  value="role"  items="<%=Role.values()%>"  >${role}
                </label>
            </c:forEach>
        </div>
        <input type="hidden" value="${user.id}" name="userId">
        <button type="submit">Save</button>
    </div>

    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}"/>

</form>


</body>
</html>


<%--${user.roles == 'role' ? "checked" : ""}--%>