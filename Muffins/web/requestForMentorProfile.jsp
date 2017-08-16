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
        
            
        <div class="container">
            <div class="row">
                <div class="col-md-offset-4 col-md-8 col-lg-offset-4 col-lg-6">
                    <h2>Mentor Profile</h2>
                    <div class="col-sm-10 well">
                        <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                <p align="center"><%= mentor.getProfile_pic()%></p>
                
                <h2><%= mentor.getName()%></h2>
                <br>
                
                <p><strong>Email Address</strong> : <%= mentor.getEmail()%></p>
                
                
                <p><strong>NIRC</strong> : <%= mentor.getNric()%></p>
                
                <p><strong>User Type</strong> : <%= mentor.getUser_type()%></p>
                
                <p><strong>Current Position in the Company</strong> : <%= mentor.getPosition()%></p>
                
                <p><strong>Introduction</strong><br><%= mentor.getIntroduction()%></p>
                
                <input type="hidden" value="<%= mentor.getEmail()%>" name="mentor">
            
                <a href="requestForMentor.jsp?type=<%=type%>" class="btn btn-primary btn-xs">Back to Mentor List</a>
           
            <%
                //isCurrentMentor -> check if there is a rls whereby this company and this mentor hass an approved status
                //second part -> if regular user wants to requests for another incubator mentor
                //then they cannot request for this mentor
                if(isCurrentMentor || (type.equals("incubator")&& (mentee.getMentor_email()!= null && !mentee.getMentor_email().isEmpty()))){
            %>
                <input class="btn btn-xs" type="submit" value="Apply for this Mentor" name="submitBtn" disabled>
            <%
                }else{
            %>
                <input class="btn btn-xs" type="submit" value="Apply for this Mentor" name="submitBtn">
            <%
                }
            %>
            
        </form>
            </div>
            </div>
            </div>
            </div>
        </div>
            
    </body>

</html>