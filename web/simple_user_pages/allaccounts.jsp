<%-- 
    Document   : allaccounts
    Created on : 01.05.2016, 12:48:07
    Author     : Evegen
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
        <title>All accounts</title>
         
    </head>
    <body>
        
        <a href="${pageContext.request.contextPath}/Start" class='remember'><fmt:message key='nav.main'/></a>
        <a href="${pageContext.request.contextPath}/LogOut" class='remember'><fmt:message key='nav.logout'/></a>
        
        
        <br />
        <h3>My bank accounts</h3>
        <br />
        
        <table border="1">
            <th>Account number (id)</th>
            <th>Balance</th>
            <th>Status</th>
            <c:forEach items="${requestScope.allaccounts}" var="account">
                <c:set var="accountID" value="${account.accountID}" />
                <c:set var="currentBalance" value="${account.currentBalance}" />
                <c:set var="status" value="${account.status}" />
                
                <c:if test="${status == 'false'}">
                    <c:set var="statusBL" value="unblocked"></c:set>
                </c:if>
                <c:if test="${status == 'true'}">
                    <c:set var="statusBL" value="blocked"></c:set>
                </c:if>                
            
            <tr>
                <td align="center"><a href="${pageContext.request.contextPath}/GetAccount?accountID=${accountID}">
                    ${accountID}</a>
                </td>
                <td align="center">${currentBalance}</td>
                <td align="center">${statusBL}</td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
