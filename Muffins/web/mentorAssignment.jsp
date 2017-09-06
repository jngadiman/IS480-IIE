<%-- 
    Document   : mentorAssignment
    Created on : Sep 6, 2017, 1:31:11 AM
    Author     : Xinyao
--%>

<%@page import="CONTROLLER.companyController"%>
<%@page import="CONTROLLER.profileController"%>
<%@page import="MODELS.Company"%>
<%@page import="MODELS.User"%>
<%@page import="java.util.Base64"%>
<%@page import="CONTROLLER.mentorController"%>
<%@page import="MODELS.Mentor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor Assignment</title>
        <link href="css/cosmos.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <link href="css/form.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-10 well">
                <div class="col-lg-12 well">
                    <p><strong>Mentee Comapany: </strong>get Mentee's Company</p>
                    <p><strong>Mentorship Period: </strong>get mentorship period indicated</p>
                    <p><strong>Preferred Mentors: </strong>get the list of preferred mentors</ps>
                </div>
                <%
            byte[] imgData;
            ArrayList<Mentor> allMentors = mentorController.getMentors();
            for (Mentor mentor : allMentors){
                
                %>
                
                <div class="col-lg-4 well">
                    <%
                        // display the image
                        imgData = mentor.getProfile_pic();
                        if(imgData != null){
                            String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                            out.println(imgData);
                    %>
                        <img width="200" height="200" src="data:image/gif;base64,<%= imgDataBase64%>" alt="Profile Picture" />
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
                imgData = null;
            }
        %>
        </div>
    </body>
</html>
