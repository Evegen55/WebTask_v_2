<%-- 
    Document   : allcards
    Created on : 24.04.2016, 15:32:17
    Author     : Lartsev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles2.css" type="text/css">
        <title>All my cards</title>
        
        
    </head>
        <body>
        
        <a href="${pageContext.request.contextPath}/Start" class='remember'>Start page</a>
        <a href="${pageContext.request.contextPath}/LogOut" class='remember'>Logout</a>
        
        <br />
        <h3>List of cards</h3>
        <br />
        <table border="1">
            <th>Primary account number</th>
            <c:forEach items="${requestScope.allcards}" var="card">
            <tr>
                <td><a href="${pageContext.request.contextPath}/GetCard?cardID=${card.cardID}">${card.pan}</a></td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
