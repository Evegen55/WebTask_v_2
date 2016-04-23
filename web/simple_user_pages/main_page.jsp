<%-- 
    Document   : main_page
    Created on : 24.04.2016, 01:35:57
    Author     : Evegen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main users Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles1.css" type="text/css">
        <title>main page</title>
    </head>
    <body>
        <a href="${pageContext.request.contextPath}/Start" class='remember'>Start page</a>
        <a href="${pageContext.request.contextPath}/LogOut" class='remember'>Logout</a>
        <div class='login' >
            <form action="${pageContext.request.contextPath}/DispatcherServlet" method="POST">
                <input type="submit" name="operation" value="my_cards"/>
                <input type="submit" name="operation" value='my bank accounts'/>
                <input type="submit" name="operation" value='payments'/>
            </form>
        </div>
    </body>
</html>
