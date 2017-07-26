<%-- 
    Document   : changePassword
    Created on : Jul 25, 2017, 5:38:10 PM
    Author     : JJAY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>CHANGE PASSWORD TEST</h1>
        <form method ="POST" action ="changePasswordServlet">
            EMAIL <input type ="text" name ="email"> </BR>
            PASSWORD <input type ="text" name ="newPassword"> </BR>
            CONFIRM PASSWORD <input type ="text" name ="confirmPassword"> </BR>
            <input type ="submit" value ="submit"> 
            
        </form>   
    </body>
</html>
