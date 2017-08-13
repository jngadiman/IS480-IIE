<%-- 
    Document   : applicationForm
    Created on : Aug 8, 2017, 5:18:52 PM
    Author     : Xinyao
--%>

<%@page import="MODELS.Mentor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<link href="css/stages.css" rel="stylesheet" type="text/css"/>
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/npm.js" type="text/javascript"></script>
<link href="css/bootstrap-datepicker.css" rel="stylesheet" type="text/css"/>
<script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request for A Mentor</title>
    </head>
    <body>
        <form action="requestMentorServlet" method="post">
        <%
            Mentor m = (Mentor) session.getAttribute("requestedMentor");
        %>
        <div style="align-items: center">
           <h4 style="text-align: center">Are you sure you want to request for this mentor?</h4>
           <p style="text-align: center"> m.getProfile_pic()</p>
           <br/>
           <p style="text-align: center">m.getName()</p>
           <br/>
           <p align="center"> <button type="reset" class="btn btn-default">Cancel</button>    <button style="align-items: center" type="submit" class="btn btn-primary">Yes</button></p>
           
        </div>
        </form>
    </body>
</html>
