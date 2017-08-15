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
        <link href="css/cosmos.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <h1>Change Password</h1>
                    <form class="form-signin" method ="POST" action ="changePasswordServlet">
                        Email <input type ="text" name ="email" class="form-control" required> </BR>
                        Password <input type ="password" name ="newPassword" class="form-control" required> </BR>
                        Confirm Password <input type ="password" name ="confirmPassword" class="form-control" required> </BR>
                         <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Change</button>

                    </form> 
                </div></div></div>
    </body>
</html>
