<%-- 
    Document   : requestForMentorCompanyProfile
    Created on : Aug 8, 2017, 4:39:21 PM
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
            User mentor = UserDAO.getUserByEmail(username);
            int companyID = mentor.getCompanyid();
            Company company = CompanyDAO.getCompany(companyID);

        %>
        <body>
            <div>
                <div align="center"><%= company.getCompanyLogo()%></div>
                <h1 align="center"><%= company.getName()%></h1>
                <br>
                <h2 align="center">Description</h2>
                <p align="center"><%= company.getDescription()%></p>
                <br>
                <h2 align="center">Vision</h2>
                <p align="center"><%= company.getVision()%></p>
                <br>
                <h2 align="center">Mission</h2>
                <br>
                <p align="center"><%= company.getMission()%></p>
                <br>
                <h2 align="center">Company Industry</h2>
                <br>
                <p align="center"><%= company.getIndustry()%></p>
                <br>
                <h2 align="center">Start Date</h2>
                <br>
                <p align="center"><%= company.getStartDate()%></p>
                <h2 align="center">Company Current Stage</h2>
                <br>
                <p align="center"><%= company.getCurrentStage()%></p>                
            </div>
        </body>
        
        <div class="text-center"><a href="requestForMentor.jsp" class="btn btn-success btn-outline-rounded green">Return to Mentor List</a></div>
        <div class="text-center"><a href="applicationForm.jsp" class="btn btn-success btn-outline-rounded green">Apply for this Mentor</a></div>
        
        

</html>