<%-- 
    Document   : viewAllMentees
    Created on : Aug 12, 2017, 8:34:16 PM
    Author     : Xinyao
--%>

<%@page import="java.util.Base64"%>
<%@page import="CONTROLLER.profileController"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="MODELS.Company"%>
<%@page import="CONTROLLER.menteeController"%>
<%@page import="DAO.MenteeDAO"%>
<%@page import="MODELS.Mentee"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<%@include file="protect.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Mentees</title>
    </head>
    <body>
        <div class="container">
        <div class="col-lg-8 col-lg-offset-2">
        <%
            ArrayList<Mentee> allMentees = menteeController.getAllMentees();
            for (int i = 0; i < allMentees.size(); i++){
                Mentee mentee = allMentees.get(i);
    
        %>
                
                 <div class="col-lg-4 well">
                <%  // display the image
                    byte[] imgData = mentee.getProfile_pic();
                    if(imgData != null){
                        String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                %>
                    <div align="center"><img width="200" height="200" src="data:image/gif;base64,<%= imgDataBase64%>"  alt="images Here" /></div>
                <%
                    }else{
                %>
                    <div align="center"><img width="200"  height="200" src="img/user.png"  alt="Profile Picture" /></div>
                <%
                    }
                %>
                <h2><%=mentee.getName()%></h2>
                <% User displayedUser = profileController.displayUserDetails(mentee.getEmail());
                    int companyID = displayedUser.getCompanyid();
                    Company company = companyController.getCompany(companyID);%><br>
                    <span class="label label-primary"><%=company.getName()%></span><br><br>
               <a href='displayProfile.jsp?email=<%=mentee.getEmail()%>' class='btn btn-success btn-xs'>View Profile</a>  
                 </div>
            <%}
        %>
        
        </div>
        </div>
    </body>
</html>