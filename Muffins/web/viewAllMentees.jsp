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
<%@include file="sidenav.jsp" %>
<%@include file="protect.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Mentees</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-8 col-lg-offset-3">
                <h1 class="page-header">View All Mentees</h1>
                <div class ='row'>
                    <%  int i = 0;
                        ArrayList<Mentee> allMentees = menteeController.getAllMentees();
                        for (Mentee mentee : allMentees) {
                            //Mentee mentee = allMentees.get(i);

                    %>

                    <div class="col-lg-3 well fixed">
                        <%  // display the image
                            if (imgData != null) {
                                String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                        %>
                        <div align="center"><img width="120" height="120" src="data:image/gif;base64,<%= imgDataBase64%>"  alt="images Here" /></div>
                            <%
                            } else {
                            %>
                        <div align="center"><img width="120"  height="120" src="img/user.png"  alt="Profile Picture" /></div>
                            <%
                                }
                            %>
                        <h4><%=mentee.getName()%></h4>
                        <% User displayedUser = profileController.displayUserDetails(mentee.getEmail());
                            int companyID = displayedUser.getCompanyid();
                            Company company = companyController.getCompany(companyID);%><br>
                        <span class="label label-primary"><%=company.getName()%></span><br><br>
                        <a href='displayProfile.jsp?email=<%=mentee.getEmail()%>' class='btn btn-success btn-xs'>View Profile</a>  
                    </div>
                    <div class="col-lg-1"></div>
                    <%
                            i++;
                            if (i % 3 == 0) {
                                out.println("</div><div class='row'>");
                            }

                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>