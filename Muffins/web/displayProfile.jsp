<%-- 
    Document   : displayProfile
    Created on : Aug 16, 2017, 9:49:40 AM
    Author     : Jennefer Ngadiman
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
                <div class="col-md-offset-4 col-md-8 col-lg-offset-4 col-lg-6">

                    <div class="col-sm-10 well">
                        <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                            <div class="col-sm-offset-3">
                                <%                                // display the image
                                    byte[] imgData = displayedUser.getProfile_pic();
                                    if (imgData != null) {
                                        String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));

                                %>
                                <img width="200" height="200" src="data:image/gif;base64,<%= imgDataBase64%>" alt="Profile Picture" />
                                <%
                                } else {
                                %>
                                <img src="img/user.png" width="200" height="200" alt=""/>
                                <%
                                    }
                                %>
                            </div>
                            <h2><%= displayedUser.getName()%></h2>


                            <p><strong>Email Address</strong> : <%= displayedUser.getEmail()%></p>


                            <p><strong>NRIC</strong> : <%= displayedUser.getNric()%></p>

                            <p><strong>Type : </strong><%=displayedUser.getUser_type()%></p>
                            
                            
                            
                            <%String type = displayedUser.getUser_type();
                            
                             if (type.equals("regular_mentee") || type.equals("light_mentee")) {
                                    Mentee mentee = MenteeDAO.getMenteeByEmail(userEmail);
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

<!--                            <p><strong>User Type</strong> :  //mentee.getMentee_type() + " " + type%></p>
                            -->

                            <p><strong>Degree</strong> : <%= mentee.getDegree()%></p>

                            <p><strong>Year of Graduation</strong> : <%= mentee.getYear_of_grad()%></p>

                            <p><strong>Company </strong> : <%= company_name%></p>

                            <p><strong>Mentor </strong> : <%= mentor_name%></p>

                            <br><a href="viewAllMentees.jsp" class="btn-sm btn-success">Back to Mentees</a>

                            <%} else if (type.equals("mentor")) {
                                Mentor mentor = MentorDAO.getMentorByEmail(userEmail);
                                String company_name = "";
                                if (mentor.getCompanyid() != 0) {
                                    Company c = companyController.getCompany(mentor.getCompanyid());
                                    company_name = c.getName();
                                }
                            %>

                            <p><strong>User Type</strong> : <%=type%></p>
                            <p><strong>Company</strong> : <%= company_name%></p>
                            <p><strong>Current Position in the Company</strong> : <%= mentor.getPosition()%></p>
                            <p><strong>Introduction</strong><br>
                                <%= mentor.getIntroduction()%></p>
                            <br>
                            <a href="viewAllMentors.jsp" class="btn-sm btn-success">Back to Mentors</a>

                            <% }%>
                        </div>             

                    </div>


                </div>
            </div>                 
        </div>

    </body>
</html>
