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
<%@include file="protect.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor Assignment</title>
        <%@include file="sidenav.jsp" %>

    </head>
    <body>
        <%            String userEmail = request.getParameter("mentorEmail");
            User displayedUser = profileController.displayUserDetails(userEmail);
            Company c = companyController.getCompany(user.getCompanyid());
        %>

        <div class="container">

            <div class="col-lg-8 col-lg-offset-3">
                <h2 class="page-header col-lg-8  col-sm-offset-3">Confirmation for Assignment</h2>
            </div>
            <div class="col-lg-8 well col-sm-offset-3">

                <div class ="row">
                    <div class="col-sm-12 form-group required">
                        <h4>Confirm request for <b><%=displayedUser.getName()%></b> as Mentor for <b><%=c.getName()%></b>? <br/></h4>
                    </div>

                    <form action="confirmMentorPreferenceServlet" method="post">
                        <div class="col-sm-6 form-group required">
                            <label class="control-label">State your reason for request </label>
                            <input class="form-control" id="reason" name="reason" type="text" placeholder="Enter Reason Here (Mandatory)" class="form-control" required>
                            <input type="hidden" value="<%= displayedUser.getEmail()%>" name="mentorEmail">
                            <br><input type="submit" class="btn btn-xs btn-info " value="Submit">       
                        </div>


                        <!--  
                        
                                                    <div class="col-sm-12 form-group">
                        <%  // display the image
                            byte[] imgDataUser = displayedUser.getProfilePic();
                            if (imgDataUser == null) {
                        %>
                        <img src="img/user.png" width="200px" alt=""/>
                        <%
                        } else {
                            String imgDataBase64 = new String(Base64.getEncoder().encode(imgDataUser));
                        %>
                        <img src="data:image/gif;base64,<%= imgDataBase64%>" alt="Profile Picture" />
                        <%}%>
                    </div>
                </div>
                <div class ="row">
                    <div class="col-sm-6 form-group">
                        <p><font size="+3"><%= displayedUser.getName()%></font></p>
                        <p><strong>Email Address</strong> : <%= displayedUser.getEmail()%></p>

                    </div>
                </div>

                        <%String type = displayedUser.getUserType(); %>

                        <%  if (type.equals("Incubation Mentor")) {
                                Mentor mentor = MentorDAO.getMentorByEmail(user.getEmail());
                                String company_name = "";
                                if (mentor.getCompanyid() != 0) {
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
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <p><strong>Introduction</strong><br>
                        <%= mentor.getIntroduction()%></p>
                        <% }%>
                </div> 
            </div>

        </div> -->


                    </form>
                </div>
            </div>

    </body>
</html>
