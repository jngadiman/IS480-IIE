<%-- 
    Document   : requestForMentorProfile
    Created on : Aug 8, 2017, 4:39:21 PM
    Author     : Xinyao
--%>


<%@page import="DAO.RequestDAO"%>
<%@page import="CONTROLLER.mentorController"%>
<%@page import="DAO.MentorDAO"%>
<%@page import="MODELS.Mentor"%>
<%@page import="DAO.MenteeDAO"%>
<%@page import="MODELS.Mentee"%>
<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UserDAO"%>
<%@page import="MODELS.User"%>
<%@page import="MODELS.User"%>
<%@include file="protect.jsp" %>
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
        <form action="applicationForm.jsp" method="post">
        <%
            String status = (String) session.getAttribute("status");
            String type = (String) session.getAttribute("requestType");
            Mentee mentee = (Mentee) session.getAttribute("mentee");
            
            if(status!= null && !status.isEmpty()){
        %>      
        
                <font color="red"><%= status%></font>      
                
        <%  
            session.setAttribute("status", null);
            }
            Mentor mentor = (Mentor) session.getAttribute("requestedMentor");
            boolean isCurrentMentor = (boolean) session.getAttribute("isCurrentMentor");
        %>
        
            <div>
                <div align="center">A Picture Should Be Inserted Here</div>
                <p align="center"><%= mentor.getProfile_pic()%></p>
                
                <h1 align="center"><%= mentor.getName()%></h1>
                <br>
                
                <h2 align="center">Email Address</h2>
                <p align="center"><%= mentor.getEmail()%></p>
                <br>
                
                <h2 align="center">NRIC</h2>
                <p align="center"><%= mentor.getNric()%></p>
                
                <h2 align="center">User Type</h2>
                <p align="center"><%= mentor.getUser_type()%></p>
                
                <br>
                <h2 align="center">Current Position in the Company</h2>
                <br>
                <p align="center"><%= mentor.getPosition()%></p>
                <br>
                <h2 align="center">Introduction</h2>
                <br>
                <p align="center"><%= mentor.getIntroduction()%></p>
                
                <input type="hidden" value="<%= mentor.getEmail()%>" name="mentor">
            </div>
            
            <div class="text-center"><a href="requestForMentor.jsp" class="btn btn-success btn-outline-rounded green">Return to Mentor List</a></div>
            <%
                //isCurrentMentor -> check if there is a rls whereby this company and this mentor hass an approved status
                //second part -> if regular user wants to requests for another incubator mentor
                //then they cannot request for this mentor
                if(isCurrentMentor || (type.equals("incubator")&& (mentee.getMentor_email()!= null && !mentee.getMentor_email().isEmpty()))){
            %>
                <input type="submit" value="Apply for this Mentor" name="submitBtn" disabled>
            <%
                }else{
            %>
                <input type="submit" value="Apply for this Mentor" name="submitBtn">
            <%
                }
            %>
            <div class="text-center"><a href="applicationForm.jsp" class="btn btn-success btn-outline-rounded green">Apply for this Mentor</a></div>
        </form>
    </body>

</html>