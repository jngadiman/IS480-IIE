<%-- 
    Document   : viewMentorProfile
    Created on : Jul 27, 2017, 2:30:40 AM
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
<%@include file="protect.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Profile</title>
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <%          user = (User) session.getAttribute("user");
            user = profileController.getUser(user.getEmail());
            session.setAttribute("user", user);
        %>

        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-sm-offset-2">
                    <h2 class="page-header col-lg-9  col-sm-offset-2">Personal Profile</h2>
                    <div class="col-lg-9 well col-sm-offset-2">
                        <div class ="row">

                            <div class="col-sm-9 form-group">
                                <%  // display the image
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
                                }else{
                                    mentor_name = "N.A";
                                }
                                String company_name = "";
                                if (mentee.getCompanyid() != 0) {
                                    Company c = companyController.getCompany(mentee.getCompanyid());
                                    company_name = c.getName();
                                }
                                        

                        %>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <p><strong>Contact Number </strong> : <%=mentee.getContactNumber()%></p>
                            </div>
                            <div class="col-sm-6 form-group">
                                <p><strong>Nationality</strong> : <%=mentee.getNationality()%></p>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <p><strong>Company </strong> : <%= company_name%></p>
                            </div>
                            <div class="col-sm-6 form-group">
                                <p><strong>Position in the Company</strong> : <%= mentee.getRole()%></p>
                            </div>

                        </div>
                        <div class='row'>
                            <div class="col-sm-6 form-group">
                                <p><strong>Mentor </strong> : <%= mentor_name%></p>
                            </div>
                            
                        </div>
                            
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <p><strong>Degree</strong> : <%= mentee.getDegree()%></p>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <p><strong>Year of Graduation</strong> : <%= mentee.getYear_of_grad()%></p>
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
                                <p><strong>Company Position</strong> : <%= mentor.getPosition()%></p>
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
    </div>
    <div class="text-center"><a href="editPersonalProfile.jsp" class="btn-sm btn-success">Edit Profile</a></div>
</body>

</html>
