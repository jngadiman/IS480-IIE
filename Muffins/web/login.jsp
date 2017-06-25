<%-- 
    Document   : register
    Created on : Jun 24, 2017, 10:25:23 AM
    Author     : JEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-4">

                            <div class="card card-container">
                                <p id="profile-name" class="profile-name-card"></p>
                                <form class="form-signin">
                                    <span id="reauth-email" class="reauth-email"></span>
                                    <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                                    <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                                    <div id="remember" class="checkbox">
                                        <label>
                                            <input type="checkbox" value="remember-me"> Remember me
                                        </label>
                                    </div>
                                    <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>
                                </form><!-- /form -->
                                <a href="#" class="forgot-password">
                                    Forgot the password?
                                </a>
                            </div><!-- /card-container -->

                        </div>
                        <div class="col-md-4">
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
