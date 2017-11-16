<%-- 
    Document   : viewAllMentors
    Created on : Aug 12, 2017, 8:34:03 PM
    Author     : Xinyao
--%>


<%@page import="java.util.Base64"%>
<%@page import="CONTROLLER.profileController"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="MODELS.Company"%>
<%@page import="MODELS.Company"%>
<%@page import="CONTROLLER.mentorController"%>
<%@page import="DAO.MentorDAO"%>
<%@page import="MODELS.Mentor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sidenav.jsp" %>
<%@include file="protect.jsp" %>
<!DOCTYPE html>
<html>
    <style>
        .profile-pic {
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

        .profile-pic:hover {
            background-color: rgba(0,0,0,.5);
            z-index: 10000;
            color: #fff;
            transition: all .3s ease;
            text-decoration: none;
        }
        .profile-pic label {
            display: inline-block;
            padding-top: 10em;
            padding-bottom: 1.5em;
            cursor: pointer;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Mentors</title>
    </head>
    <script>
        $(document).ready(function () {
            var heights = $(".well").map(function () {
                return $(this).height();
            }).get(),
                    maxHeight = Math.max.apply(null, heights);

            $(".well").height(maxHeight);
        });

    </script>
    <body>
        <div class="container">
            <div class="col-lg-8 col-lg-offset-3">
                <h1 class="page-header">View All Mentors</h1>
                <div class="row">
                    <%                        int i = 0;
                        ArrayList<Mentor> allMentors = mentorController.getMentors();
                        System.out.println("viewAllMentors JSP: " + allMentors);
                        for (Mentor mentor : allMentors) {
                    %>

                    <div class="col-lg-1"></div>
                    <div class="col-lg-3 well" align="center">
                        <%
                            // getting mentor details
                            // get profile pic
                            imgData = mentor.getProfile_pic();
                            String mentorProfilePic = "";
                            if (imgData == null) {
                                mentorProfilePic = "img/user.png";
                            } else {
                                String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                                mentorProfilePic = "data:image/gif;base64," + imgDataBase64;
                            }
                            // get mentor name
                            String mentorName = mentor.getName();
                        %>
                        <div class="profile-pic" style="background-image: url('<%=mentorProfilePic%>')" width="120px"></div>
                        

                        <h4><%=mentorName%></h4>
                        <%

                            User displayedUser = profileController.displayUserDetails(mentor.getEmail());
                            int companyID = displayedUser.getCompanyid();
                            Company company = companyController.getCompany(companyID);
                            String company_name = "";
                            if (company != null) {
                                company_name = company.getName();
                        %>
                        <span class="label label-primary"><%= company_name%></span><br><br>
                        <%
                            }
                        %>
                        <form method="post" action="displayMentorProfile.jsp">
                            <input type="hidden" name="mentorEmail" value="<%= mentor.getEmail()%>"/>
                            <button type="submit" name="viewMentor" value="View Profile" class='btn btn-success btn-xs'>View Profile</button>
                        </form>
                    </div>
                    <%
                            i++;
                            if (i % 3 == 0) {
                                out.println("</div><div class='row'>");
                            }
                        }
                    %>

                </div>
            </div>

    </body>
</html>