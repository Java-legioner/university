<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ua.ivashchuk.controller.UserController" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>

    <title>Home</title>
</head>
<body class="security-app">


<div class="lc-block">
    <h4>List to User</h4>
    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th></th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.username}</td>
                <td>${user.roles}</td>
                <td><a href="/user/${user.id}">edit</a></td>
            </tr>
        </c:forEach>


        </tbody>
    </table>

</div>
</body>
</html>