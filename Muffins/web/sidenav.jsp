<%-- 
    Document   : sidenav
    Created on : Sep 20, 2017, 6:40:40 PM
    Author     : Jennefer Ngadiman
--%>

<%@page import="MODELS.Mentor"%>
<%@page import="MODELS.Company"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="java.util.Base64"%>
<%@page import="CONTROLLER.relationshipController"%>
<%@page import="MODELS.Relationship"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MODELS.Mentee"%>
<%@page import="MODELS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/cosmos.css" rel="stylesheet" type="text/css"/>
        <link href="css/dashboard.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
        %>

        <div class="container-fluid">
            <div class="row">
                <div class="nav col-sm-3 col-md-2 sidebar">
                    <img src="img/iielogo.png" width="200px" class="nav nav-sidebar text-center" alt=""/>
                    
                    <div class="logo">
                        <%  // display the image
                            byte[] imgData = user.getProfile_pic();
                            if (imgData == null) {
                        %>
                        <img src="img/user.png" width="70px" class="img-responsive center-block" alt=""/>
                        <%
                        } else {
                            String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                        %>
                        <img src="data:image/gif;base64,<%= imgDataBase64%>" width="70px" class="img-responsive center-block" alt="Profile Picture" />
                        <%}%>
                    </div>
                    <ul class="nav nav-sidebar">


                        <%
                            String userType = user.getUser_type();
                            if (userType.equals("regular_mentee")) {
                                out.println("<li><button href='#' class='btn btn-xs btn-primary center-block'>Incubator Mentee</a></li>");
                            } else if (userType.equals("lightmentee")) {
                                out.println("<li><button href='#' class='btn btn-xs btn-primary center-block'>Open Mentor Mentee</a></li>");
                            } else {
                                out.println("<li><button href='#' class='btn btn-xs btn-primary center-block'>Administrator</button></li>");
                            }
                        %>
                        <li class="dropdown">
                           <a href="#" class="dropdown-toggle text-center" data-toggle="dropdown" role="button" aria-expanded="false"><%=user.getName()%><span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="viewPersonalProfile.jsp">View Personal Profile</a></li>
                                <li><a href="editPersonalProfile.jsp">Edit Personal Profile</a></li>
                                <li><a href="changePassword.jsp">Change Password</a></li>
                            </ul>
                        </li>

                        <%
                            if (user.getUser_type().equals("regular_mentee") || user.getUser_type().equals("light_mentee")) {
                                Mentee m = (Mentee) session.getAttribute("mentee");
                        %>    
                        <li><a href="home.jsp">Home</a></li>
                            <%
                                if (user.getUser_type().equals("regular_mentee")) {
                                    Company userComp = companyController.getCompany(user.getCompanyid());
                                    
                            %>
                        
                        <li class="dropdown">
                           <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=userComp.getName()%><span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="viewCompanyProfile.jsp">View Company Profile</a></li>
                                <li><a href="editCompanyProfile.jsp">Edit Company Profile</a></li>
                            </ul>
                        </li>
                        <li><a href="stages.jsp">Progress</a></li>
                        <li><a href="viewTasks.jsp?id=<%=userComp.getCurrentStage()%>">View Current Tasks</a></li>
                            <%
                                }
                            %>
                         <%
                                Mentor mentor = relationshipController.getCurrentMentorOfCompany(user.getCompanyid());
                                if (mentor!=null) {
                                   
                            %>
                        <li class="dropdown">
                           <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Meeting<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="addMeetingMinutes.jsp">Add Meeting Minutes</a></li>
                                <li><a href="viewMeetingMinutes.jsp">View Meeting Minutes</a></li>
                            </ul>
                        </li>
                            <%
                                }
                            %>

                        <li class="dropdown">
                           <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">View All<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                        <li><a href="viewAllCompanies.jsp">View All Companies</a></li>
                        <li><a href="viewAllMentors.jsp">View All Mentors</a></li>
                            </ul>
                        </li>
                            <%
                                if (user != null) {
                                    if (user.getUser_type().equals("regular_mentee")) {
                            %>
                        <li><a href="mentorAssignment.jsp">Request For Mentor</a></li>
                            <%
                            } else if (user.getUser_type().equals("light_mentee")) {

                            %>
                        <li><a href="requestForMentor.jsp?type=open">Open Mentorship Request</a></li>
                            <%                                            }
                                }
                            %>
                            <%
                            } else if (user.getUser_type().equals("admin")) {

                                ArrayList<Relationship> pendingRequests = relationshipController.getAllRelationshipByStatus("requesting");
                            %>

                        <li><a href="adminHomepage.jsp">Homepage</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">View All<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="viewAllCompanies.jsp">View All Companies</a></li>
                                <li><a href="viewAllMentees.jsp">View All Mentees</a></li>
                                <li><a href="viewAllMentors.jsp">View All Mentors</a></li>
                                <li><a href="adminShowRelationships.jsp">View Relationships</a></li>
                            </ul>
                        </li>
                        <li><a href="logout.jsp">Logout</a></li></ul>
                        
                       
<!--                        <span class="badge"><%=pendingRequests.size()%></span>-->
                        
                        
                        
                        <hr />
                        <li><button href='#' class='btn btn-xs btn-primary'>EIR</a></li>
         <li><a href="adminViewAllRequests.jsp">Pending Mentor Request  </a></li>
         <li><a href="confirmCompany.jsp">Pending Company</a></li>
                        <hr />
                        <li><button href='#' class='btn btn-xs btn-primary'>IM</a></li>
                        <li><a href="IMUploadContract.jsp">IM Upload Contract</a></li>
                        <li><a href="paymentForMentor.jsp">Payment Vouchers</a></li>
                        <li><a href="mentorRegistration.jsp">Register New Mentor</a></li>
<<<<<<< HEAD
                        <li><a href="IMUploadContract.jsp">Upload Contracts</a></li>
<!--                        <li><a href="IMUploadContract.jsp">IM Upload Contract</a></li>-->
=======
>>>>>>> 6a350241d18d48b64032e5d875fcbd6451c8c76d

                        <%
                        } else {
                        %>
                        <%
                            if (user.getUser_type().equals("regular_mentee")) {
                        %>
                        <li><a href="stages.jsp">Progress</a></li>
                            <%
                                }
                            %>
                        <li><a href="#">Meetings</a></li>
                        <li><a href="calendar.jsp">Calendar</a></li>
                        <li><a href="viewCompanyProfile.jsp">View Company Profile</a></li>
                        <li><a href="viewAllCompanies.jsp">View All Companies</a></li>
                            <%
                                if (user.getUser_type().equals("admin")) {
                            %>
                        <li><a href="viewAllMentees.jsp">View All Mentees</a></li>
                            <%
                                }
                            %>
                        <li><a href="viewAllMentors.jsp">View All Mentors</a></li>
                            <%
                                if (user.getUser_type().equals("regular_mentee")) {
                            %>
                        <li><a href="confirmCompany.jsp">Pending Registration Requests</a></li>
                            <%
                                }
                            %>
                            <%
                                }
                            %>    
                        
<<<<<<< HEAD
                        <li><a href="changePassword.jsp">Change Password</a></li>
                        <li><a href="logout.jsp">Logout</a></li></ul>
=======
>>>>>>> 6a350241d18d48b64032e5d875fcbd6451c8c76d
                </div>
            </div>
        </div>
    </body>
</html>
