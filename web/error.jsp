<%-- 
    Document   : error
    Created on : 20.02.2016, 13:28:49
    Author     : Lartsev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
        <title>A Form login authentication failure occurred</title>
    </head>
    <body>
        <H1>
            <B>
                A Form login authentication failure occurred
            </B>
        </H1>
        
        <P>Authentication may fail for one of many reasons. Some possibilities include:
            <OL>
                <LI>The user-id or password may be entered incorrectly; either misspelled or the wrong case was used.
                    <LI>The user-id or password does not exist, has expired, or has been disabled.
            </OL>
        </P>
    </body>
</html>
