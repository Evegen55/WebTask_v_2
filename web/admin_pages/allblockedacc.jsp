<%-- 
    Document   : allblockedacc
    Created on : 13.05.2016, 2:47:57
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles3.css" type="text/css">
        <title><fmt:message key='admin.list_allblockedacc'/></title>
    </head>
    <body>
        <a href="${pageContext.request.contextPath}/Start" class='remember'><fmt:message key='nav.main'/></a>
        <a href="${pageContext.request.contextPath}/LogOut" class='remember'><fmt:message key='nav.logout'/></a>
        
        <table border="1">
            <th><fmt:message key='user.bank_account.number'/></th>
            <th><fmt:message key='user.bank_account.status'/></th>
            <c:forEach items="${requestScope.list}" var="account">
                <c:set var="accountID" value="${account.accountID}" />
                <c:set var="status" value="${account.status}" />
                <c:if test="${status == 'true'}">
                    <c:set var="statusBL" value="blocked"></c:set>
                </c:if>
            <tr>
                <td align="center">${accountID}</a>
                </td>
                <td align="center"><a href="${pageContext.request.contextPath}/UnblockAcc?accountID=${accountID}">
                        ${statusBL}</a>
                </td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
