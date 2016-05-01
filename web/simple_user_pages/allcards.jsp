<%-- 
    Document   : allcards
    Created on : 24.04.2016, 15:32:17
    Author     : Lartsev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" 
       value="${not empty param.language ? param.language 
                                         : not empty language ? language 
                                                              : pageContext.request.locale}" 
       scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="localization.locales" />

<!DOCTYPE html>
<html lang="${language}">
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles2.css" type="text/css">
        <title><fmt:message key='user.allcards'/></title>
        
        
    </head>
        <body>
        
        <a href="${pageContext.request.contextPath}/Start" class='remember'><fmt:message key='nav.main'/></a>
        <a href="${pageContext.request.contextPath}/LogOut" class='remember'><fmt:message key='nav.logout'/></a>
        
        <br />
        <h3><fmt:message key='user.allcards'/></h3>
        <br />
        <table border="1">
            <th><fmt:message key='user.card.pan'/></th>
            <c:forEach items="${requestScope.allcards}" var="card">
            <tr>
                <td><a href="${pageContext.request.contextPath}/GetCard?cardID=${card.cardID}">${card.pan}</a></td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
