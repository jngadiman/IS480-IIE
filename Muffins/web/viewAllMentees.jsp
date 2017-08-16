<%-- 
    Document   : viewAllMentees
    Created on : Aug 12, 2017, 8:34:16 PM
    Author     : Xinyao
--%>

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
                <%=mentee.getProfile_pic()%>
                <h2><%=mentee.getName()%></h2>
                <% User displayedUser = (User)mentee;
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