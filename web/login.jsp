<%-- 
    Document   : login
    Created on : 20.02.2016, 13:29:32
    Author     : Lartsev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                <input name='j_username' placeholder='Email' type='text'/>
                <input name='j_password' placeholder='Password' type='password'/>
                <div class='remember'>
                    <input checked='' id='remember' name='remember' type='checkbox'/>
                    <label for='remember'></label>Remember me
                </div>
                <input type='submit' value='Log in'/>
            </form>
        </div>
    </body>
</html>