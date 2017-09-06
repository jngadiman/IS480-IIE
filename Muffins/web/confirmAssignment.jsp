<%-- 
    Document   : confirmAssignment
    Created on : Sep 6, 2017, 12:06:47 PM
    Author     : Xinyao
--%>

<%@page import="CONTROLLER.profileController"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="CONTROLLER.mentorController"%>
<%@page import="java.util.Base64"%>
<%@page import="DAO.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MODELS.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp" %>W
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Profile</title>
        <%@include file="navbar.jsp" %>

    </head>
    <body>
        <%            String userEmail = request.getParameter("email");
            User displayedUser = profileController.displayUserDetails(userEmail);

        %>

        <div class="container">
            <div class="row">
                <div class="col-sm-10 col-sm-offset-1">
                    <h2 class="col-lg-10 well col-sm-offset-1">Personal Profile</h2>
                    <div class="col-lg-10 well col-sm-offset-1">
                        <div class ="row">

                            <div class="col-sm-12 form-group">
                                <%  // display the image
                                    byte[] imgData = user.getProfile_pic();
                                    if (imgData == null) {
                                %>
                                <img src="img/user.png" width="200px" alt=""/>
                                <%
                                } else {
                                    String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                                %>
                                <img src="data:image/gif;base64,<%= imgDataBase64%>" alt="Profile Picture" />
                                <%}%>
                            </div>
                        </div>
                        <div class ="row">
                            <div class="col-sm-6 form-group">
                                <p><font size="+3"><%= user.getName()%></font></p>
                                <p><strong>Email Address</strong> : <%= user.getEmail()%></p>
                                <p><strong>NRIC</strong> : <%= user.getNric()%></p>
                            </div>
                        </div>

                        <%String type = user.getUser_type(); %>

                        <% if (type.equals("regular_mentee") || type.equals("light_mentee")) {
                                Mentee mentee = MenteeDAO.getMenteeByEmail(user.getEmail());
                                String mentor_name = "";
                                if (mentee.getMentor_email() != null && !mentee.getMentor_email().isEmpty()) {
                                    Mentor myMentor = mentorController.getMentor(mentee.getMentor_email());
                                    mentor_name = myMentor.getName();
                                }
                                String company_name = "";
                                if (mentee.getCompanyid() != 0) {
                                    Company c = companyController.getCompany(mentee.getCompanyid());
                                    company_name = c.getName();
                                }
                        %>

                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <p><strong>Degree</strong> : <%= mentee.getDegree()%></p>
                            </div>
                            <div class="col-sm-6 form-group">
                                <p><strong>Year of Graduation</strong> : <%= mentee.getYear_of_grad()%></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <p><strong>Company </strong> : <%= company_name%></p>
                            </div>
                            <div class="col-sm-6 form-group">
                                <p><strong>Mentor </strong> : <%= mentor_name%></p>
                            </div>
                        </div>

                        <%} else if (type.equals("mentor")) {
                            Mentor mentor = MentorDAO.getMentorByEmail(user.getEmail());
                            String company_name = "";
                            if (mentor.getCompanyid() != 0) {
                                Company c = companyController.getCompany(mentor.getCompanyid());
                                company_name = c.getName();
                            }
                        %>

                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <p><strong>User Type</strong> : <%=type%></p>
                            </div>
                            <div class="col-sm-6 form-group">
                                <p><strong>Company</strong> : <%= company_name%></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <p><strong>Current Position in the Company</strong> : <%= mentor.getPosition()%></p>
                            </div>
                            <div class="col-sm-6 form-group">
                                <p><strong>Introduction</strong><br>
                                    <%= mentor.getIntroduction()%></p>
                                    <% }%>
                            </div>                
                        </div>
                    </div>             

                </div>
            </div>
        </div>   

    </body>
</html>
