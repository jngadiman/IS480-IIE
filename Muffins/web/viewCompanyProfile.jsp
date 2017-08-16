
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Base64"%>
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
<%@include file="protect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor Profile</title>
        <%@include file="navbar.jsp" %>
        <%@include file="protect.jsp" %>
    </head>
        <%            String username = "admin@smu.edu.sg";
            User mentor = UserDAO.getUserByEmail(username);
            int companyID = mentor.getCompanyid();
            Company company = CompanyDAO.getCompany(companyID);

        %>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-offset-4 col-md-8 col-lg-offset-4 col-lg-6">
                    <h2>Company Profile</h2>
                    <div class="col-sm-10 well">
                        <div class="col-xs-12 col-sm-10 col-sm-offset-1">

                            <%                    // display the image=
                                byte[] imgData = company.getCompanyLogo();
                                String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                            %>
                            <div align="center"><img width="200" src="data:image/gif;base64,<%= imgDataBase64%>"  alt="images Here" /></div>

                            <h1><%= company.getName()%></h1>

                            <p><strong>Description</strong> :<br> 
                                <%= company.getDescription()%></p>
                            <p><strong>Vision</strong> :
                                <%= company.getVision()%></p>

                            <p><strong>Mission</strong> : 
                                <%= company.getMission()%></p>
                            <p><strong>Company Industry</strong> : <%= company.getIndustry()%></p>
                            <%String startDate = new SimpleDateFormat("dd-MM-yyyy").format(company.getStartDate());%>
                            <p><strong>Start Date</strong> : <%=startDate%></p>
                            <p><strong>Company Current Stage</strong> : <%= company.getCurrentStage()%></p>  

                            <p class="text-center"><a href="editCompanyProfile.jsp" class="btn btn-success btn-xs">Edit Company Profile</a></p>

                        </div>
                    </div>
                </div>
            </div>
        </div>


    </body>

    

</html>
