<%-- 
    Document   : viewAllMentors
    Created on : Aug 12, 2017, 8:34:03 PM
    Author     : Xinyao
--%>


<%@page import="CONTROLLER.mentorController"%>
<%@page import="DAO.MentorDAO"%>
<%@page import="MODELS.Mentor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<%@include file="protect.jsp" %>
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
        <title>All Mentors</title>
    </head>
    <body>
        <%
            ArrayList<Mentor> allMentors = mentorController.getMentors();
            for (int i = 0; i < allMentors.size(); i++){
                Mentor mentor = allMentors.get(i);
                out.println("<p align='center'>mentor's profile photo should be displayed here</p>");
                out.print("<p align='center'>" + mentor.getName() +"</p>    ");
                out.print("<p class='text-center'><a href='viewPersonalProfile.jsp' class='btn btn-success btn-outline-rounded green'>View Detailed Mentor Profile</a></p>");
                
            }
        %>
        
        
    </body>
</html>