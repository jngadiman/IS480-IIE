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
                    <%  int i = 0;
                        ArrayList<Mentor> allMentors = mentorController.getMentors();
                        for (Mentor mentor : allMentors) {

                    %>
                    
                    <div class="col-lg-1"></div>
                    <div class="col-lg-3 well">
                        <%                        // display the image
                            imgData = mentor.getProfile_pic();
                            if (imgData != null) {
                                String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                                out.println(imgData);
                        %>
                        <img width="120" height="120" src="data:image/gif;base64,<%= imgDataBase64%>" alt="Profile Picture" />
                        <%
                        } else {
                        %>
                        <img src="img/user.png" width="120" height="120" alt=""/>
                        <%
                            }
                        %>

                        <h4><%=mentor.getName()%></h4>
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
                            <button type="submit" name="viewMentor" value="View Profile" class='pull-right btn btn-success btn-xs'>View Profile</button>
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