<%-- 
    Document   : newjsp
    Created on : 20.04.2016, 2:47:43
    Author     : Evegen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Start Page</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${not empty pageContext.request.getAttribute(flag)}">
                <c:redirect url="login.jsp" />
            </c:when>
            <c:when test="${not empty pageContext.request.userPrincipal}">
                <c:redirect url="DispatherAccounts" />
            </c:when>
            <c:otherwise>
                <c:redirect url="other_errors.jsp" />
            </c:otherwise>
        </c:choose>
    </body>
</html>
