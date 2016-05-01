<%-- 
    Document   : error
    Created on : 20.02.2016, 13:28:49
    Author     : Lartsev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
        <title><fmt:message key='error.string1'/></title>
    </head>
    <body>
        <H1>
            <B>
                <fmt:message key='error.string1'/>
            </B>
        </H1>
        
        <P><fmt:message key='error.string2'/>
            <OL>
                <LI><fmt:message key='error.string3'/>
                    <LI><fmt:message key='error.string4'/>
            </OL>
        </P>
    </body>
</html>
