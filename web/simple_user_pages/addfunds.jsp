<%-- 
    Document   : addfunds
    Created on : 01.05.2016, 14:57:21
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
        <title>JSP Page</title>
    </head>
    <body>
        <a href="${pageContext.request.contextPath}/Start" class='remember'><fmt:message key='nav.main'/></a>
        <a href="${pageContext.request.contextPath}/LogOut" class='remember'><fmt:message key='nav.logout'/></a>
        <a href="${pageContext.request.contextPath}/AllAccounts" class='remember'><fmt:message key='nav.allaccounts'/></a>
        
        <br />
        <h3>Add money only to your account</h3>
        <br />
        <%-- getting ACCOUNT ID direct from account_info.jsp via DispatcherServlet --%>
        <form action="${pageContext.request.contextPath}/AddFunds?accountID=${requestScope.accountID}" method="POST">
            <table>
                <tr>
                    <td align="center">Amount:</td>
                    <td align="center"><input type="text" name="newBalance"/></td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                    <input type="Submit" name="operation" value="AddMoney" />
                    </td>
                </tr>                
            </table>
        </form>
    </body>
</html>
