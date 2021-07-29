<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="cotextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome!</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <%--    <link href="${pageContext.request.contextPath}/css/main.css">--%>
    <link rel="stylesheet" type="text/css" href="
      <c:url value="/css/main.css"/>"/>
</head>
<body class="security-app">
<div class="lc-block">
    <!-- Sidebar -->
    <div class="w3-sidebar w3-light-grey w3-bar-block " style="width:15%">
        <h3 class="w3-bar-item">Menu</h3>
        <a href="/home" class="w3-bar-item w3-button">Home</a>
        <a href="/create-periodical" class="w3-bar-item w3-button">Create periodical</a>
        <a href="#" class="w3-bar-item w3-button">Bucket</a>
        <form style="margin-left: 10px;" action="/logout" method="post">
            <input type="submit" class="button red big" value="Sign Out"/> <input
                type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>
    <!-- Page Content -->
    <div style="margin-left:15%">
        <div class="w3-container w3-teal card-text">
            <h1> Periodical</h1>
        </div>
        <div class="w3-container">
            <h2>Welcome! ${pageContext.request.userPrincipal.name}</h2>
        </div>
        <div class="flex">
            <c:if test="${not empty periodicals}">
                <c:forEach items="${periodicals}" var="currentPeriodical">
                    <div class="w3-card-12 card">
                        <div><img src="http://kaverisias.com/wp-content/uploads/2018/01/catalog-default-img.gif" alt="Norway"
                                  style="width:100%"></div>
                        <div class="w3-container w3-center card-text">
                            <h3>${currentPeriodical.name}</h3>
                            <p>${currentPeriodical.description}</p>
                            <hr>
                            <p>${currentPeriodical.price}</p>
                        </div>
                        <div><button style="width: 100%" class="w3-btn-block w3-dark-grey">Add to bucket</button></div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>