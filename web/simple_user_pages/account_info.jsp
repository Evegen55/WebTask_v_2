<%-- 
    Document   : account_info
    Created on : 01.05.2016, 13:33:48
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles1.css" type="text/css">
        <title><fmt:message key='user.single_account'/></title>
    </head>
    <body>
        <a href="${pageContext.request.contextPath}/Start" class='remember'><fmt:message key='nav.main'/></a>
        <a href="${pageContext.request.contextPath}/LogOut" class='remember'><fmt:message key='nav.logout'/></a>
        <a href="${pageContext.request.contextPath}/AllAccounts" class='remember'><fmt:message key='nav.allaccounts'/></a>
        <a href="${pageContext.request.contextPath}/PaymentsHist" class='remember'><fmt:message key='nav.allpayments'/></a>
        
        <br />
        <h3><fmt:message key='user.single_account'/></h3>
        <br />
        
        <%-- Just as example using JSTL--%>
        <c:set var="accountID" value="${requestScope.bankAccount.accountID}" scope="request" />
        <c:set var="currentBalance" value="${requestScope.bankAccount.currentBalance}" />
        <c:set var="status" value="${requestScope.bankAccount.status}" />
        
        <c:if test="${status == 'false'}">
            <c:set var="statusBL" value="unblocked"></c:set>
        </c:if>
        
        <c:if test="${status == 'true'}">
            <c:set var="statusBL" value="blocked"></c:set>
        </c:if>
                   
        <table border="1">
            <th><fmt:message key='user.bank_account.number'/></th>
            <th><fmt:message key='user.bank_account.balance'/></th>
            <th><fmt:message key='user.bank_account.status'/></th>
            <tr>
                <td align="center">${accountID}</a</td>
                <td align="center">${currentBalance}</td>
                <td align="center">${statusBL}</td>
            </tr>
        </table>
            <br />
            <form action="./DispatcherServlet?accountID=${accountID}" method="POST">
                <%-- if bank account hasn't been blocked we can doing smth with --%>
                <c:choose>
                    
                    <c:when test="${status == 'false'}">
                    <input type="submit" name="operation" value="add funds" />
                    <input type="submit" name="operation" value="make payment"/>
                    <input type="submit" name="operation" value="block account"/>
                    </c:when>
                    <c:otherwise>
                        <a class='remember'>
                            <fmt:message key='user.bank_account.string1'/> 
                            <fmt:message key='user.bank_account.string2'/>
                        </a>
                    </c:otherwise>
                </c:choose>
            </form>
        
    </body>
</html>
