<%-- 
    Document   : main_page
    Created on : 24.04.2016, 01:35:57
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
        <title><fmt:message key='nav.user.main'/></title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles1.css" type="text/css">
        <title><fmt:message key='nav.user.main'/></title>
    </head>
    <body>
        <a href="${pageContext.request.contextPath}/Start" class='remember'><fmt:message key='nav.main'/></a>
        <a href="${pageContext.request.contextPath}/LogOut" class='remember'><fmt:message key='nav.logout'/></a>
        <div class='login' >
            <form action="${pageContext.request.contextPath}/DispatcherServlet" method="POST">
                <input type="submit" name="operation" value="my_cards"/>
                <input type="submit" name="operation" value="my bank accounts"/>
                <input type="submit" name="operation" value="payments"/>
            </form>
        </div>
    </body>
</html>
