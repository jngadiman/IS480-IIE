<%-- 
    Document   : register
    Created on : Jun 24, 2017, 10:25:23 AM
    Author     : JEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String loginErrorMessage = (String) request.getAttribute("loginErrorMessage");

    if (loginErrorMessage == null) {
        loginErrorMessage = "";
    }
%>
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
                    <%
                        String registerStatus = (String) request.getAttribute("registerStatus");
                        if(registerStatus != null && !registerStatus.isEmpty()){
                            out.println(registerStatus);
                        }
                        
                        if(request.getAttribute("result") != null){
                            int result = (Integer) request.getAttribute("result");
                            out.println(result);
                        }
                    %>
                    <h1>IIE Portal</h1>

                    <p id="profile-name" class="profile-name-card"></p>
                    <form class="form-signin" action = "loginServlet" method = "post">
                        <span id="reauth-email" class="reauth-email"></span>
                        <input type="email" name="email" class="form-control" placeholder="Email" required autofocus>
                        <input type="password" name="password" class="form-control" placeholder="Password" required>
                        <font color = 'red'><%=loginErrorMessage%></font>
                        <div id="remember" class="checkbox">
                            <label>
                                <input type="checkbox" name = "rememberMe" value="yes"> Remember me
                            </label>
                        </div>
                        <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>
                    </form><!-- /form -->
                    <br/>
                    <a href="changePassword.jsp" class="forgot-password">
                        Forgot the password?
                    </a><br/>
                    No account? Sign up <a href="registerUser.jsp">here</a>
                </div>
            </div>
        </div>

    </body>
</html>
