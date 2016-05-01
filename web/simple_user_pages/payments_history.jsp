<%-- 
    Document   : payments_history
    Created on : 01.05.2016, 14:20:57
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
        <title><fmt:message key='user.allpayments'/></title>
    </head>
    <body>
        
        <a href="${pageContext.request.contextPath}/Start" class='remember'><fmt:message key='nav.main'/></a>
        <a href="${pageContext.request.contextPath}/LogOut" class='remember'><fmt:message key='nav.logout'/></a>
        
        <br />
        <h3><fmt:message key='user.allpayments.outcoming'/></h3>
        <br />
        <table border="1">
            <th><fmt:message key='user.payments.paymentID'/></th>
            <th><fmt:message key='user.payments.amount'/></th>
            <th><fmt:message key='user.payments.from'/></th>
            <th><fmt:message key='user.payments.to'/></th>
            <th><fmt:message key='user.payments.Beneficiar'/></th>
            <c:forEach items="${requestScope.list}" var="pay_hist">
            <tr>
                <td align="center">${pay_hist.paymentID}</a></td>
                <td align="center">${pay_hist.amount}</td>
                <td align="center">${pay_hist.clientAccountID.accountID}</td>
                <td align="center">${pay_hist.beneficiarAccountID.accountID}</td>
                <td align="center">${pay_hist.beneficiarClienstID.clientID}</td>
            </tr>
            </c:forEach>
        </table>
        <br />
        <h3><fmt:message key='user.allpayments.incoming'/></h3>
        <br />
        <table border="1">
            <th><fmt:message key='user.payments.paymentID'/></th>
            <th><fmt:message key='user.payments.amount'/></th>
            <th><fmt:message key='user.payments.from'/></th>
            <th><fmt:message key='user.payments.to'/></th>
            <th><fmt:message key='user.payments.Beneficiar'/></th>
            <c:forEach items="${requestScope.listIncoming}" var="pay_histInc">
            <tr>
                <td align="center">${pay_histInc.paymentID}</a></td>
                <td align="center">${pay_histInc.amount}</td>
                <td align="center">${pay_histInc.clientAccountID.accountID}</td>
                <td align="center">${pay_histInc.beneficiarAccountID.accountID}</td>
                <td align="center">${pay_histInc.beneficiarClienstID.clientID}</td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
