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
<%@include file="navbar.jsp" %>
<%@include file="protect.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Mentors</title>
    </head>
    <body>
        
        <div class="container">
        <div class="col-lg-8 col-lg-offset-2">
        <%
            ArrayList<Mentor> allMentors = mentorController.getMentors();
            for (Mentor mentor : allMentors){
                
                %>
                
                <div class="col-lg-4 well">
                    <%
                        // display the image
                        byte[] imgData = mentor.getProfile_pic();
                        if(imgData != null){
                            String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));

                    %>
                        <img src="data:image/gif;base64,<%= imgDataBase64%>" width="200" height="200" alt="Profile Picture" />
                    <%
                        }else{
                    %>
                            <img src="img/user.png" width="200" height="200" alt=""/>
                    <%
                        }
                    %>

                    <h2><%=mentor.getName()%></h2>
                    <% 
                        
                    User displayedUser = profileController.displayUserDetails(mentor.getEmail());
                    int companyID = displayedUser.getCompanyid();
                    Company company = companyController.getCompany(companyID);
                    String company_name = "";
                    if(company != null){
                        company_name = company.getName();    
                    %>
                    <span class="label label-primary"><%= company_name%></span><br><br>
                    <%
                    }
                    %>
                <a href='displayProfile.jsp?email=<%=mentor.getEmail()%>' class='btn btn-success btn-xs'>View Profile</a>
                </div>
                <%
            }
        %>
        </div>
    </div>
        
    </body>
</html>