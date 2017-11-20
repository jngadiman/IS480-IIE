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
            /* The image used */
            background-image: url("img/smu-sob-night-view-image-2.jpg");

            /* Full height */
            height: auto; 

            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover; 
        }

        .boxbg { 
            margin-top: 50px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 3%;
            align-content: center;
        }
        .form-control {
            font-size: 12;
        }
    </style>
    <body>
        <div class="container-fluid" align="center">
            <div class="row">
                <div class="col-md-4 col-md-offset-4 boxbg">
                    <img src="img/iielogopng.png" width="400" align="middle" alt=""/>
                    <!--<h1>IIE Portal</h1>-->
                    <p id="profile-name" class="profile-name-cazrd"></p>
                    <form class="form-signin" action = "loginServlet" method = "post">
                        <span id="reauth-email" class="reauth-email"></span>
                        <div class="col-md-10 col-md-offset-1">
                            <input type="email" name="email" class="form-control" placeholder="Email" required autofocus>

                            <input type="password" name="password" class="form-control" placeholder="Password" required>
                            
                            <p align="center"><font color="red"><%=loginResult%></p></font>

                            <div id="remember" class="checkbox">
                                <!--<label>
                                    <input type="checkbox" name = "rememberMe" value="yes"> Remember me
                                </label>
                            </div>-->
                                <button class="btn btn-m btn-primary btn-block btn-signin" type="submit">Sign in</button>
                            </div>
                        </div>

                    </form><!-- /form -->
                    <br/>
                    <div class="col-md-10 col-md-offset-1">
                        <a href="forgetPassword.jsp" class="forgot-password">
                            <h4><strong>Forgot the password?</strong></h4>
                        </a>
                        <h4><strong>No account? Sign your company up <a href="registerIncubationCompany.jsp">HERE</a></strong></h4>
                        <br>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
<%}%>