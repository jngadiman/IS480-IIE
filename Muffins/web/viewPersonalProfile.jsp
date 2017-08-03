<%-- 
    Document   : viewMentorProfile
    Created on : Jul 27, 2017, 2:30:40 AM
    Author     : Xinyao
--%>

<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UserDAO"%>
<%@page import="MODELS.User"%>
<%@page import="MODELS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            String username = "admin@smu.edu.sg";
            User user= UserDAO.getUserByEmail(username);
        %>
        <body>
            <div>
                <div align="center">A Picture Should Be Inserted Here</div>
                <h1 align="center"><%= user.getName()%></h1>
                <br>
                <h2 align="center">Email Address</h2>
                <p align="center"><%= user.getEmail()%></p>
                <br>
                <h2 align="center">Experience</h2>
                <br>
                <p align="center">System.out.println(user.getExperience());</p>
                
                <h2 align="center">NRIC</h2>
                <p align="center"><%= user.getNric()%></p>
                
                <h2 align="center">User Type</h2>
                <p align="center"><%= user.getUser_type()%></p>
                
                <p align="center">}</p>
                <br>
                <p align="center">if (user.getClass().isInstance(Mentee.class)){</p>
                
                    <h2 align="center">Year of Graduation</h2>
                    <br>
                    <p align="center">System.out.println(user.getYearOfGraduation());</p>
                    <br>
                    
                    <p align="center">Interested Industry</p>
                    <br>
                    <p align="center">System.out.println(mentorCompany.getInterestedIndustry());</p>

                <p align="center">} else{</p> 
                    <h2 align="center">Industries Worked Before</h2>
                    <br>
                    <p align="center">System.out.println(user.getPastIndustries());</p>
                    <br>
                    <p align="center">Interested Industry</p>
                    <br>
                    <p align="center">System.out.println(mentorCompany.getInterestedIndustry());</p>
                
            </div>
        </body>
        
        <a href="editMentorProfile.jsp" class="btn btn-success btn-outline-rounded green" ><p style="text-align:center">Edit Company Profile</a>
        

</html>
