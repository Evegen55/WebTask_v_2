<%-- 
    Document   : cardinfo
    Created on : 01.05.2016, 12:10:30
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
        <title><fmt:message key='user.single_card'/></title>
        
    </head>
        <body>
        
        <a href="${pageContext.request.contextPath}/Start" class='remember'><fmt:message key='nav.main'/></a>
        <a href="${pageContext.request.contextPath}/LogOut" class='remember'><fmt:message key='nav.logout'/></a>
        
        <br />
        <h3><fmt:message key='user.single_card'/></h3>
        <br />
        <table border="1">
            <th><fmt:message key='user.card.pan'/></th>
            <th><fmt:message key='user.card.seccode'/></th>
            <th><fmt:message key='user.card.valid'/></th>
            <th><fmt:message key='user.bank_account.number'/></th>
            <%--
            see how iterate ower list of cretit cards 
                on CreditCard.processRequest(...) commented lines
            
            <c:forEach items="${requestScope.list}" var="card">
            <tr>
                <td>${card.pan}</a></td>
                <td>${card.secureCode}</td>
                <td>${card.validDate}</td>
                <td>${card.accountID}</td>
            </tr>
            </c:forEach>
                Author     : Evegen
            --%>
            <tr>
                <td align="center">${requestScope.creditCard.pan}</a></td>
                <td align="center">${requestScope.creditCard.secureCode}</td>
                <td align="center">${requestScope.creditCard.validDate}</td>
                <td align="center"><a href="${pageContext.request.contextPath}/GetAccount?accountID=${creditCard.accountID.accountID}">
                    ${requestScope.creditCard.accountID.accountID}
                </td> 
                <%--
                It seems like ${requestScope.creditCard.accountID.accountID} NOT 
                              ${requestScope.creditCard.accountID}
                because we've got a 
                                   @JoinColumn(name = "accountID", referencedColumnName = "accountID")
                                   @ManyToOne(optional = false)
                annotations in CreditCards class.
                --%>
            </tr>
        </table>
    </body>
</html>