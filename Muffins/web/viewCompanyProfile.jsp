<%-- 
    Document   : viewMentorProfile
    Created on : Jul 15, 2017, 4:30:40 PM
    Author     : Xinyao
--%>

<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UserDAO"%>
<%@page import="MODELS.User"%>
<%@page import="MODELS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor Profile</title>
        <%@include file="navbar.jsp" %>
        <link href="css/stages.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/npm.js" type="text/javascript"></script>
        <link href="css/bootstrap-datepicker.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            try {
                String username = "aaa";
                User mentor = UserDAO.getUserByEmail(username);
                int companyID = mentor.getCompanyid();
                Company mentorCompany = CompanyDAO.getCompany(companyID);
                //need to add in method to get company id of mentor
                
            }catch (NullPointerException nullPointer){
                out.println("No such mentor");//error message
            }

        %>
        <body>
            <div>
                <div align="center">A Picture Should Be Inserted Here</div>
                <h1 align="center">Lazada</h1>
                <br>
                <h2 align="center">Description</h2>
                <p align="center">System.out.println(mentorCompany.getDescription());</p>
                <br>
                <h2 align="center">Vision</h2>
                <p align="center">System.out.println(mentorCompany.getVision());</p>
                <br>
                <h2 align="center">Mission</h2>
                <br>
                <p align="center">System.out.println(mentorCompany.getMission());</p>
                <br>
                <h2 align="center">Company Industry</h2>
                <br>
                <p align="center">System.out.println(mentorCompany.getIndustry());</p>
                <p align="center">if (mentor.getClass().isInstance(Mentee.class)) {</p>
                    <br>
                    <p align="center">Start Date</p>
                    <br>
                    <p align="center">System.out.println(mentorCompany.getStartDate());</p>
                    <p align="center">Company Current Stage</p>
                    <br>
                    <p align="center">System.out.println(mentorCompany.getCurrentStage());</p>
                
                    <p align="center">}</p>
                
            </div>
        </body>
        
        <a href="editMentorProfile.jsp" class="btn btn-success btn-outline-rounded green" ><p style="text-align:center">Edit Company Profile</a>
        

</html>
