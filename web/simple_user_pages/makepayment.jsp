<%-- 
    Document   : makepayment
    Created on : 12.05.2016, 1:54:48
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
        <title><fmt:message key='user.make_payments'/></title>
    </head>
    <body>
        <a href="${pageContext.request.contextPath}/Start" class='remember'><fmt:message key='nav.main'/></a>
        <a href="${pageContext.request.contextPath}/LogOut" class='remember'><fmt:message key='nav.logout'/></a>
        <a href="${pageContext.request.contextPath}/AllAccounts" class='remember'><fmt:message key='nav.allaccounts'/></a>
        <a href="${pageContext.request.contextPath}/PaymentsHist" class='remember'><fmt:message key='nav.allpayments'/></a>
        
        <c:choose>
            <c:when test="${not empty pageContext.request.getAttribute(block_acc)}">
                <br />
                <h3><fmt:message key='user.payments.try_to_block_account'/></h3>
                <br />
            </c:when>
            <c:when test="${not empty pageContext.request.getAttribute(flag)}">
                <br />
                <h3><fmt:message key='user.payments.try_to_pay_text'/></h3>
                <br />
            </c:when>
            <c:otherwise>
                <br />
                    <h3><fmt:message key='user.make_payments'/></h3>
                <br />
            </c:otherwise>
        </c:choose>
        <form action="${pageContext.request.contextPath}/MakePayment?accountID=${requestScope.accountID}" 
                      method="POST">
                <table>
                    <tr>
                        <td><fmt:message key='user.payments.amount'/>:</td>
                        <td><input type="text" name="payment"/></td>
                    </tr>
                    <tr>
                        <td><fmt:message key='user.payments.to'/>:</td>
                        <td><input type="text" name="beneficiarAccountID"/></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        <input type="Submit" name="operation" value="Make a pay" />
                        </td>
                    </tr>                
                </table>
                </form>
    </body>
</html>
