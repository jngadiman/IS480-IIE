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
    <style>
        .user-pic {
            border-radius: 50%;
            height: 110px;
            width: 110px;
            background-size: cover;
            background-position: center;
            background-blend-mode: multiply;
            vertical-align: middle;
            text-align: center;
            color: transparent;
            transition: all .3s ease;
            text-decoration: none;
        }

        .user-pic:hover {
            background-color: rgba(0,0,0,.5);
            z-index: 10000;
            color: #fff;
            transition: all .3s ease;
            text-decoration: none;
        }
        .user-pic label {
            display: inline-block;
            padding-top: 10em;
            padding-bottom: 1.5em;
            cursor: pointer;
        }
    </style>
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
                    <ul class="nav nav-sidebar-top" style="padding:0px">
                        <%-- displaying of iie logo --%>
                        <img src="img/iielogo.png" width="100%" style="vertical-align: middle; background-color:#fff" alt=""/>
                        <div class="logo">
                            <%  // displaying of profile picture
                                byte[] imgData = user.getProfile_pic();
                                String userPic = "";
                                if (imgData == null) {
                                    userPic = "img/user.png";
                                } else {
                                    String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                                    userPic = "data:image/gif;base64," + imgDataBase64;
                                }
                            %>
                            <center><div class="user-pic" style="background-image: url('<%=userPic%>')" width="110px" align="center">
                                </div></center>
                        </div> 
                        <%-- displaying of user position --%>
                        <%
                            String userType = user.getUser_type();
                            System.out.println("sidenav: " + userType);
                            if (userType.contains("mentee") || userType.contains("mentor")) {
                                String position = user.getRole();
                                if (position == null) {
                                    position = "Founder";
                                }
                                out.println("<li><button href='#' class='btn btn-xs btn-primary center-block' style='min-width:100px; width: auto;'>" + position + "</a></li>");
                                String userName = user.getName();
                                if (userName == null) {
                                    userName = user.getEmail();
                                }
                        %>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle text-center" data-toggle="dropdown" role="button" aria-expanded="true"><%=userName%><span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="viewPersonalProfile.jsp">My Profile</a></li>
                                <li><a href="editPersonalProfile.jsp">Edit My Profile</a></li>
                                <li><a href="changePassword.jsp">Change Password</a></li>
                            </ul>
                        </li>
                        <%
                            } else if (userType.equals("admin_eir")) {
                                out.println("<li><button href='#' class='btn btn-xs btn-primary center-block'>Entrepreneur in Residence</button></li><br>");
                            } else if (userType.equals("admin_im")) {
                                out.println("<li><button href='#' class='btn btn-xs btn-primary center-block'>Incubation Manager</button></li><br>");
                            }
                        %>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <%-- MENTEE SIDEBAR --%>
                        <%
                            if (userType.contains("mentee") || userType.contains("mentor")) {
                                Mentee m = (Mentee) session.getAttribute("mentee)");
                        %>
                        <li><a href="home.jsp">Home</a></li>
                            <%
                                Company userCompany = companyController.getCompany(user.getCompanyid());
                                String companyName = userCompany.getName();
                            %>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=companyName%><span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="viewCompanyProfile.jsp">My Company Profile</a></li>
                                <li><a href="editCompanyProfile.jsp">Edit My Company Profile</a></li>
                            </ul>
                        </li>
                        <li><a href="stages.jsp">Company Progress</a></li>
                            <%
                                }
                            %>

                        <%-- ADMIN SIDEBAR --%>
                        <%
                            if (userType.contains("admin")) {
                                /* ADMIN HOMEPAGE */
                        %>
                        <li><a href="adminHome.jsp">Home</a></li>
                            <%
                                }
                            %>
                            <%-- common properties --%>
                            <%
                                if (userType.contains("mentee")) {
                            %>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Schedule<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="viewAllMeetings.jsp">My Schedule</a></li>
                                <li><a href="showCalendar.jsp">Schedule Meeting</a></li>
                                <li><a href="addMeetingMinutes.jsp">Add Meeting Minutes</a></li>
                            </ul>
                        </li>
                        <%
                            }
                        %>
                        <%
                            if (userType.contains("admin")) {
                        %>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Schedule<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="viewAllMeetings.jsp">My Schedule</a></li>
                                <li><a href="showCalendar.jsp">Schedule Meeting</a></li>
                            </ul>
                        </li>
                        <%
                            }
                        %>
                        <li><a href="viewAllCompanies.jsp">Start-up Companies</a></li>
                        <li><a href="viewAllMentors.jsp">Mentors</a></li>
                        <hr/>
                        <%
                            if (user.getUser_type().equals("admin_eir")) {
                        %>
                        <li><a href="adminViewAllRequests.jsp">Pending Mentor Request</a></li>
                        <li><a href="EIRAssignMentor.jsp">Assign Mentor</a></li>
                        <li><a href="adminShowRelationships.jsp">Relationships</a></li>
                        <hr/>
                        <%
                            }
                        %>

                        <%
                            if (user.getUser_type().equals("admin_im")) {
                        %>
                        <li><a href="confirmCompany.jsp">Pending Registration Requests</a></li>
                        <li><a href="mentorRegistration.jsp">Register New Mentor</a></li>
                        <li><a href="IMUploadContract.jsp">Upload Contracts</a></li>
                        <li><a href="paymentForMentor.jsp">Mentor Payment</a></li>
                        <li><a href="adminShowRelationships.jsp">Relationships</a></li>
                        <hr/>
                        <%
                            }
                        %>                        
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
