<%-- 
    Document   : requestForMentorProfile
    Created on : Aug 8, 2017, 4:39:21 PM
    Author     : Xinyao
--%>


<%@page import="java.util.Base64"%>
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
        <form action="confirmRequest.jsp" method="post">
            <%  String status = (String) session.getAttribute("status");

                Mentee mentee = (Mentee) session.getAttribute("mentee");

                if (status != null && !status.isEmpty()) {
            %>      

            <p style="text-align": center><%= status%> </p>  

            <%
                    session.setAttribute("status", null);
                }
                Mentor mentor = (Mentor) session.getAttribute("requestedMentor");
                boolean isCurrentMentor = (boolean) session.getAttribute("isCurrentMentor");
            %>

            <div class="container">
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1">
                        <h2 class="col-lg-10 well col-sm-offset-1">Mentor Profile</h2>
                        <div class="col-sm-10 well col-sm-offset-1">
                            <div class ="row">
                                <div class="col-sm-6 form-group">
                                    <%
                                        // display the image
                                        byte[] imgData = mentor.getProfile_pic();
                                        if (imgData != null) {
                                            String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                                    %>
                                    <img src="data:image/gif;base64,<%= imgDataBase64%>" width="200" height="200" alt="Profile Picture" />
                                    <%
                                    } else {
                                    %>
                                    <img src="img/user.png" width="200" height="200" alt=""/>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <div class ="row">
                                <div class="col-sm-6 form-group">
                                    <p><font size="+3"><%= mentor.getName()%></font></p>
                                </div>
                            </div>

                            <div class ="row">
                                <div class="col-sm-6 form-group">
                                    <p><strong>Email Address</strong> : <%= mentor.getEmail()%></p>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <p><strong>User Type</strong> : <%= mentor.getUser_type()%></p>
                                </div>
                            </div>

                            <div class ="row">
                                <div class="col-sm-6 form-group">
                                    <p><strong>Current Position in the Company</strong> : <%= mentor.getPosition()%></p>
                                </div>
                            </div>

                            <div class ="row">
                                <div class="col-sm-6 form-group">
                                    <p><strong>Introduction:</strong><br><%= mentor.getIntroduction()%></p>
                                </div>
                            </div>

                            <div class ="row">
                                <div class="col-sm-6 form-group">
                                    <p><strong>Areas of Expertise</strong></p>
                                    <% //get the list of the skills%>
                                    <p>Data Engineering, Data Management, Data Mining</p>
                                </div>
                            </div>

                            <input type="hidden" value="<%= mentor.getEmail()%>" name="mentor">
                        </div>
                    </div>
                </div>

            </div>
            <div class="containter">
                <div class ="row">
                    <div class="col-sm-10 text-center">
                        <div class="row">
                            <a href="requestForMentor.jsp" class="btn btn-primary btn-xs">Back to Mentor List</a>
                            <%
                                //isCurrentMentor -> check if there is a rls whereby this company and this mentor hass an approved status
                                //second part -> if regular user wants to requests for another incubator mentor
                                //then they cannot request for this mentor
                                if (isCurrentMentor || ((mentee.getMentor_email() != null && !mentee.getMentor_email().isEmpty()))) {
                            %>

                            <input class=" btn btn-xs" type="submit" value="Apply for this Mentor" name="submitBtn" disabled>
                            <%
                            } else {
                            %>
                            <input class=" btn btn-xs" type="submit" value="Apply for this Mentor" name="submitBtn">
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>


    </body>

</html>
