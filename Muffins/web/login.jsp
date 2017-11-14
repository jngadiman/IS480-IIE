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

        body, html {
            height: 100%;
        }

        .bg { 
            /* The image used */
            background-image: url("img/smuhome.jpg");

            /* Full height */
            height: 100%; 

            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;

            opacity: 0.75;
            filter: alpha(opacity=75); 
        }

        .top-buffer { margin-top: 120px;}



    </style>
    <body>
        <div class="container-fluid bg">
            <div class="row">
                <div class="col-md-4 col-md-offset-4 top-buffer">
                    <img src="img/iielogoop50.png" width="385" alt=""/>
                    <!--<h1>IIE Portal</h1>-->
                    <p id="profile-name" class="profile-name-cazrd"></p>
                    <form class="form-signin" action = "loginServlet" method = "post">
                        <span id="reauth-email" class="reauth-email"></span>
                        <input type="email" name="email" class="form-control" placeholder="Email" required autofocus>
                        <input type="password" name="password" class="form-control" placeholder="Password" required>
                        <div style="background-color:rgba(255, 255, 255, 0.85)"><font color = 'red'><%=loginResult%></font></div>

                        <div id="remember" class="checkbox">
                            <!--<label>
                                <input type="checkbox" name = "rememberMe" value="yes"> Remember me
                            </label>
                        </div>-->
                            <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>
                    </form><!-- /form -->
                    <br/>
                    <div style="background-color:rgba(255, 255, 255, 0.85)">
                        <div>
                            <a href="forgetPassword.jsp" class="forgot-password">
                                "Forgot the password?</span>
                            </a><br/>
                            No account? Sign your company up <a href="registerIncubationCompany.jsp">here</a>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
<%}%>