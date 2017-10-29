<%-- 
    Document   : changePassword
    Created on : Jul 25, 2017, 5:38:10 PM
    Author     : JJAY
--%>

<%@page import="MODELS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String loginResult = (String) request.getAttribute("loginResult");
    if(loginResult == null){
        loginResult = "";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link href="css/cosmos.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script>
            function validateForm() {
                var password = document.forms["changePassword"]["newPassword"].value;
                if (password.length < 8 || password.length > 24) {
                    alert('Password must be between 8-24 characters long!');
                    return false;
                }

                var confirmPwd = document.forms["changePassword"]["confirmPassword"].value;
                if (password !== confirmPwd) {
                    alert('Passwords do not match!');
                    return false;
                }
            }
            </script>
    </head>
    <body>
        <%
        User checkLogin = (User) session.getAttribute("user");
        if (checkLogin!=null){
            %>
        <%@include file="sidenav.jsp" %>
        <%
        }
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <h1 class="page-header">Change Password</h1>
                    <%                String status = (String) request.getAttribute("loginResult");
                        if (status != null && !status.isEmpty()) {
                    %>

                    <div class="alert alert-dismissible alert-success col-md-4">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <%=status%>
                    </div>
                <%
                    }
                %>
                    <form class="form-signin" method ="POST" action ="changePasswordServlet" name = "changePassword" onsubmit="return validateForm()" >
                        Email <input type ="text" name ="email" class="form-control" required> <br>
                        Current Password <input type ="password" name ="currentPassword" class="form-control" required> <br>
                        New Password <input type ="password" name ="newPassword" class="form-control" required> <br>
                        Confirm New Password <input type ="password" name ="confirmPassword" class="form-control" required> <br>
                        <font color = 'red'><%=loginResult%></font>
                        
                         <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Change</button>
                         
                    </form> 
                </div></div></div>
    </body>
</html>
