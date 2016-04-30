<%-- 
    Document   : login
    Created on : 20.02.2016, 13:29:32
    Author     : Lartsev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
        <title>Login Page</title>
    </head>
    <body>
        <div class='login'>
            <%--
            the action of the login form must always be j_security_check
            see more: https://docs.oracle.com/cd/E19226-01/820-7627/bncbq/index.html
            --%>
            <form action="j_security_check" method="post">
                <fmt:message key='login.input.j_password.Email' var="eml"/>
                <input name='j_username' placeholder='${eml}' type='text'/>
                
                <fmt:message key='login.input.j_password.Password' var="pas"/>
                <input name='j_password' placeholder='${pas}' type='password'/>
                
                <div class='remember'>
                    <input checked='' id='remember' name='remember' type='checkbox'/>
                    <label for='remember'></label><fmt:message key='login.label.remember'/>
                </div>
                
                    <fmt:message key='login.input.submit' var="sub"/>
                    <input type='submit' value='${sub}'/>
            </form>
        </div>
    </body>
</html>