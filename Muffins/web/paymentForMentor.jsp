<%-- 
    Document   : paymentForMentor
    Created on : Sep 10, 2017, 3:56:56 PM
    Author     : Xinyao
--%>

<%@page import="CONTROLLER.relationshipController"%>
<%@page import="java.time.LocalDate"%>
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
        <title>Generate Payment Voucher for Mentor</title>
        <%@include file="sidenav.jsp" %>
        <link href="css/dashboard.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="container">
            <%                LocalDate today = LocalDate.now();
                int month = today.getMonthValue();
                int year = today.getYear();
                String m = "";
                if (month == 1) {
                    m = "January";
                } else if (month == 2) {
                    m = "February";
                } else if (month == 3) {
                    m = "March";
                } else if (month == 4) {
                    m = "April";
                } else if (month == 5) {
                    m = "May";
                } else if (month == 6) {
                    m = "June";
                } else if (month == 7) {
                    m = "July";
                } else if (month == 8) {
                    m = "August";
                } else if (month == 9) {
                    m = "September";
                } else if (month == 10) {
                    m = "October";
                } else if (month == 11) {
                    m = "November";
                } else if (month == 12) {
                    m = "December";
                }
                //maybe set reminder to ask them to generate before end of the month
%>

<h3><div class="col-lg-10 col-lg-offset-1">Choose the mentor to generate payment voucher for: <strong><%=m%> <%=year%></strong></div></h3>

            <div class="col-lg-10 col-lg-offset-1">
                <%                    byte[] mentorPhoto;
                    ArrayList<Mentor> allMentors = mentorController.getMentors();
                    for (Mentor mentor : allMentors) {
                %>

                <div class="col-lg-6 well">
                    <%                        // display the image
                        imgData = mentor.getProfile_pic();
                        if (imgData != null) {
                            String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                            out.print(imgData);
                    %>
                    <div class="col-lg-6">
                        <img width="150" height="150" src="data:image/gif;base64,<%= imgDataBase64%>" alt="Profile Picture" />
                    </div>

                    <%
                    } else {
                    %>
                    <div class="col-lg-6">
                        <img src="img/user.png" width="150" height="150" alt=""/>
                    </div>

                    <%
                        }
                    %>
                    <div class="col-lg-6">
                        <h4 style="text-align:centre"><strong><%=mentor.getName()%></strong></h4>
                        <h4 style="text-align:centre"><strong>Companies:</strong></h4>
                        <%
                            //User displayedUser = profileController.displayUserDetails(mentor.getEmail());
                            //int companyID = displayedUser.getCompanyid();
                            //Company company = companyController.getCompany(companyID);
                            String company_name = "";
                            ArrayList<Relationship> rlsInMonthYear = relationshipController.getAssignedRelationshipsOfMonthYear(month, year);
                            ArrayList<Relationship> rls = relationshipController.getRelationshipsOfMentor(rlsInMonthYear, mentor.getEmail());
                            String company_ids = "";
                            if (rls != null && rls.size() != 0) {
                                for (Relationship r : rls) {
                                    int companyID = r.getCompanyID();
                                    company_ids += companyID + ",";
                                    Company company = companyController.getCompany(companyID);
                                    if (company != null) {
                                        company_name = company.getName();
                        %>

                        <form action ="mentorPaymentServlet" method ="post">
                            <ul class="nav nav-pills ">
                                <input type ="hidden" name ="month" value ="<%=month%>">
                                <input type ="hidden" name ="year" value ="<%=year%>">
                                <input type ="hidden" name ="mentor_email" value ="<%=mentor.getEmail()%>">
                                <input type ="hidden" name ="company_id" value ="<%=company_ids%>"> 
                                <li class=""><button type="submit" class="btn btn-xm btn-primary" style='border-radius: 12px'><%= company_name%><span class="badge">1</span></a></li></button>
                            </ul> 
                        </form>

                        <%
                                }
                            }
                        %>
                    </div>

                    <%
                        }
                    %>
                </div>
                <%
                        mentorPhoto = null;
                    }
                %>

                <div class="col-lg-4 col-lg-offset-4">
                    <a href='' class='btn btn-success btn-md' style='border-radius: 12px'><center>Generate All Payment Vouchers</center></a>
                </div>

            </div>

    </body>
</html>
