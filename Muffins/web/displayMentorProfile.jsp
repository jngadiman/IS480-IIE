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
        <title>Display Mentor Profile</title>
        <%@include file="sidenav.jsp" %>

    </head>
    <body>
        <%            String mentorEmail = (String) session.getAttribute("mentor_email");
            User userMentor = profileController.displayUserDetails(mentorEmail);
            if(userMentor!=null){
                

        %>

        <div class="container">
            <div class="row">
                <div class="col-md-offset-4 col-md-8 col-lg-offset-4 col-lg-6">

                    <div class="col-sm-10 well">
                        <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                            <div class="col-sm-offset-3">
                                <%                                // display the image
                                    byte[] imgDataMentor = userMentor.getProfile_pic();
                                    if (imgDataMentor != null) {
                                        String imgDataBase64 = new String(Base64.getEncoder().encode(imgDataMentor));

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
                            <h2><%= userMentor.getName()%></h2>


                            <p><strong>Email Address</strong> : <%= userMentor.getEmail()%></p>


                           
                            <p><strong>Contact Number</strong> : <%= userMentor.getContactNumber()%></p>

                            <p><strong>Type : </strong><%=userMentor.getUser_type()%></p>
                            
                            
                            
                            <%String type = userMentor.getUser_type();
                            
                             if (type.equals("regular_mentee") || type.equals("light_mentee")) {
                                    Mentee mentee = MenteeDAO.getMenteeByEmail(mentorEmail);
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

                            <%} else if (!type.equals("admin")) {
                                Mentor mentor = MentorDAO.getMentorByEmail(mentorEmail);
                                String company_name = "";
                                if (mentor.getCompanyid() != 0) {
                                    Company c = companyController.getCompany(mentor.getCompanyid());
                                    company_name = c.getName();
                                }
                            %>

                            <p><strong>Company</strong> : <%= company_name%></p>
                            <p><strong>Company Position</strong> : <%= mentor.getPosition()%></p>
                            <p><strong>Skill(s)</strong> : <%= mentor.getSkills()%></p>
                            <br>
                            <a href="viewAllMentors.jsp" class="btn-sm btn-success">Back to Mentors</a>

                            <% }
                            
}%>
                        </div>             

                    </div>


                </div>
            </div>                 
        </div>

    </body>
</html>
