<%-- 
    Document   : register
    Created on : Jun 24, 2017, 10:25:23 AM
    Author     : JEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("user") != null) {
        //out.println("You are already Logged in!");
        if (session.getAttribute("admin") != null) {
            response.sendRedirect("adminHomepage.jsp");
        } else if (session.getAttribute("mentor") != null) {
            response.sendRedirect("mentorHomepage.jsp");
        } else {
            response.sendRedirect("home.jsp");
        }
    } else {

        String loginResult = (String) request.getAttribute("loginResult");
        if (loginResult == null) {
            loginResult = "";
        }%>
<p style="text-align: center">
    <%--
    String status = (String) request.getAttribute("registerStatus");
    if(status != null && !status.isEmpty()){
        out.println(status);
    }
    
    --%>
</p>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/cosmos.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <style>
        body {
            background-image: url(img/smu-sob-night-view-image-2.jpg);
            background-size: cover;
            height: 100%;
            background-repeat: no-repeat;
            background-position: center center;
            opacity: 95%;
        }
        container-fluid {
            width: 500px;
            margin-right: auto;
            margin-left: auto;
        }
    </style>
    <body>
        <div class="container-fluid">
            <center>
                <div class="row">
                    <div class="col-md-4 col-md-offset-4" style="background: rgba(255, 255, 255, 0.9); border-radius: 3%">
                        <img src="img/iielogo.png" width="450" align="middle" alt=""/>
                        <!--<h1>IIE Portal</h1>-->
                        <p id="profile-name" class="profile-name-cazrd"></p>
                        <form class="form-signin" action = "loginServlet" method = "post">
                            <span id="reauth-email" class="reauth-email"></span>
                            <input type="email" name="email" class="form-control" placeholder="Email" required autofocus width="90%">
                            <input type="password" name="password" class="form-control" placeholder="Password" required>
                            <font color = 'red'><%=loginResult%></font>

                            <div id="remember" class="checkbox">
                                <!--<label>
                                    <input type="checkbox" name = "rememberMe" value="yes"> Remember me
                                </label>
                            </div>-->
                                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>
                        </form><!-- /form -->
                        <br/>
                        <a href="forgetPassword.jsp" class="forgot-password">
                            Forgot the password?
                        </a><br/>
                        No account? Sign your company up <a href="registerIncubationCompany.jsp">here</a>
                    </div>
                </div>
            </center>
        </div>

    </body>
</html>
<%}%>