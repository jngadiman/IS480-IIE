<%-- 
    Document   : paymentForMentor
    Created on : Sep 10, 2017, 3:56:56 PM
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
        <title>Generate Payment Voucher for Mentors</title>
        <%@include file="navbar.jsp" %>
        <link href="css/dashboard.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="container">
            <h1><center>Choose the mentor to generate payment voucher</center></h1>

            <div class="col-lg-10 col-lg-offset-1">
                <%                    byte[] imgData;
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
                    </div>



                    <%

                        User displayedUser = profileController.displayUserDetails(mentor.getEmail());
                        int companyID = displayedUser.getCompanyid();
                        Company company = companyController.getCompany(companyID);
                        String company_name = "";
                        if (company != null) {
                            company_name = company.getName();
                    %>
                    <p style="text-align:centre"><%= company_name%></p>
                    <%
                        }
                    %>

                    <div class="col-lg-12">
                        <ul class="nav nav-pills ">
                            <div class='row'>
                                <div class='col-lg-4'>
                                    <li class=""><button type="submit" class="btn btn-xm btn-primary" style='border-radius: 12px'>Company A <span class="badge">1</span></a></li></button>	
                                </div>
                                <div class='col-lg-4'>
                                    <li class=""><button type="submit" class="btn btn-xm btn-primary" style='border-radius: 12px'>Company B <span class="badge">2</span></a></li></button>	
                                </div>
                                <div class='col-lg-4'>
                                    <li class=""><button type="submit" class="btn btn-xm btn-primary" style='border-radius: 12px'>Company C <span class="badge">3</span></a></li></button>	
                                </div>
                                <div class='col-lg-4'>
                                    <li class=""><button type="submit" class="btn btn-xm btn-primary" style='border-radius: 12px'>Company D <span class="badge">4</span></a></li></button>	
                                </div>
                            </div>

                        </ul> 

                    </div>

                </div>
                <%
                        imgData = null;
                    }
                %>
                <div class="col-lg-4 col-lg-offset-4">
                    <a href='' class='btn btn-success btn-md' style='border-radius: 12px'><center>Generate All Payment Vouchers</center></a>
                </div>
            </div>
        </div>
    </body>
</html>
