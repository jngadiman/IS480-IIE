<%-- 
    Document   : viewMentorProfile
    Created on : Jul 27, 2017, 2:30:40 AM
    Author     : Xinyao
--%>


<%@page import="DAO.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MODELS.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor Profile</title>
        <%@include file="navbar.jsp" %>
        <link href="css/stages.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/npm.js" type="text/javascript"></script>
        <link href="css/bootstrap-datepicker.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
        %>
        
            <div>
                <div align="center">A Picture Should Be Inserted Here</div>
                <p align="center"><%= user.getProfile_pic()%></p>
                
                <h1 align="center"><%= user.getName()%></h1>
                <br>
                
                <h2 align="center">Email Address</h2>
                <p align="center"><%= user.getEmail()%></p>
                <br>
                
                <h2 align="center">NRIC</h2>
                <p align="center"><%= user.getNric()%></p>
                
                <%String type = user.getUser_type(); %>
                
                
                <br>
                <% if (type.equals("mentee")){
                    Mentee mentee = MenteeDAO.getMenteeByEmail(user.getEmail());
                %>
                    
                    <h2 align="center">User Type</h2>
                    <p align="center"><%= mentee.getMentee_type() + " " + type%></p>
                    <br>
                
                    <h2 align="center">Degree</h2>
                    <br>
                    <p align="center"><%= mentee.getDegree()%></p>
                    <br>
                    
                    <h2 align="center">Year of Graduation</h2>
                    <br>
                    <p align="center"><%= mentee.getYear_of_grad()%></p>
                    <br>
                
                <%} else if(type.equals("mentor")){
                        Mentor mentor = MentorDAO.getMentorByEmail(user.getEmail());
                %>
                    <h2 align="center">User Type</h2>
                    <p align="center"><%=type%></p>
                    <br>
                    <h2 align="center">Current Position in the Company</h2>
                    <br>
                    <p align="center"><%= mentor.getPosition()%></p>
                    <br>
                    <h2 align="center">Introduction</h2>
                    <br>
                    <p align="center"><%= mentor.getIntroduction()%></p>
                <% } %>
            </div>
        </body>
        
        <div class="text-center"><a href="editPersonalProfile.jsp" class="btn btn-success btn-outline-rounded green">Edit Profile</a></div>
        

</html>
