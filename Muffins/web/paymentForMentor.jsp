<%-- 
    Document   : paymentForMentor
    Created on : Sep 10, 2017, 3:56:56 PM
    Author     : Xinyao
--%>

<%@page import="java.util.Date"%>
<%@page import="java.time.YearMonth"%>
<%@page import="CONTROLLER.paymentController"%>
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
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <h2 class="page-header col-lg-8  col-lg-offset-2">Mentor Payment(s)</h2>
            <%            LocalDate today = LocalDate.now();
                int month = today.getMonthValue();
                int year = today.getYear();

                LocalDate endMonth = YearMonth.of(year, month).atEndOfMonth(); //2015-12-31

                Date endDate = java.sql.Date.valueOf(endMonth);
                ArrayList<Relationship> overdue = relationshipController.getAllRelationshipByStatus("assigned");
                if (overdue != null && overdue.size() != 0) {%>
            
                    <h3 class="page-header col-lg-8  col-lg-offset-2">Overdue Payment(s)</h3>
            <%for (Relationship r : overdue) {
                    if (r.getEnd_date().after(endDate) || r.getEnd_date().equals(endDate)) {
                        String mentorEmail = r.getMentorEmail();
                        Mentor mentor = mentorController.getMentor(mentorEmail);


            %>

            <div class="col-lg-8 col-lg-offset-2">
                <div class="col-lg-12 well">
                    <%                        // display the image
                        imgData = mentor.getProfile_pic();
                        if (imgData != null) {
                            String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                            out.print(imgData);
                    %>
                    <div class="col-lg-4">
                        <img width="100" height="100" src="data:image/gif;base64,<%= imgDataBase64%>" alt="Profile Picture" />
                    </div>

                    <%
                    } else {
                    %>
                    <div class="col-lg-4">
                        <img src="img/user.png" width="100" height="100" alt=""/>
                    </div>

                    <%
                        }
                    %>
                    <div class="col-lg-8">
                        <button href='#' class='btn btn-default btn-md'><%=mentor.getName()%></button>
                        <p>List of Mentoring Companies:</p>
                        <%

                            int companyID = r.getCompanyID();
                            String company_name = "";
                            Company company = companyController.getCompany(companyID);
                            if (company != null) {
                                company_name = company.getName();
                                int badge = paymentController.getCountOfMonthYearByMentorNCompany(month, year, companyID, mentor.getEmail());
                        %>

                        <form action ="mentorPaymentServlet" method ="post">
                            <ul class="nav nav-pills ">
                                <input type ="hidden" name ="month" value ="<%=month%>">
                                <input type ="hidden" name ="year" value ="<%=year%>">
                                <input type ="hidden" name ="mentor_email" value ="<%=mentorEmail%>">
                                <input type ="hidden" name ="company_id" value ="<%=companyID%>"> 
                                <button type="submit" class="btn btn-md btn-primary"><%= company_name%> <span class="badge"><%=badge%></span></button>
                            </ul> 
                        </form>

                        <%
                            }

                        %>
                    </div>

                    <%            %>
                </div>
            </div>

            <%}

                    }
                }

            %>
            <%            String m = "";
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
    
<h3 class="page-header col-lg-8  col-lg-offset-2">Mentors with Incubator Mentee Attachment ending <strong><%=m%> <%=year%></h3>
           
 <div class="col-lg-8 col-lg-offset-2">
               
                <%                    byte[] mentorPhoto;

                    ArrayList<Mentor> allMentors = mentorController.getMentors();
                    for (Mentor mentor : allMentors) {
                %>
 <div class="col-lg-12 well">
                    <div class="col-lg-4">
                
                    <%                        // display the image
                        imgData = mentor.getProfile_pic();
                        if (imgData != null) {
                            String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                            out.print(imgData);
                    %>
                    
                        <img width="100" height="100" src="data:image/gif;base64,<%= imgDataBase64%>" alt="Profile Picture" />
                    

                    <%
                    } else {
                    %>
                    
                        <img src="img/user.png" width="100" height="100" alt=""/>
                    

                    <%
                        }
                    %>
                    </div>
                    <div class="col-lg-8">
                        <button href='#' class='btn btn-default btn-md'><%=mentor.getName()%></button>
                        <p>List of Mentoring Companies:</p>
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
                                        int badge = paymentController.getCountOfMonthYearByMentorNCompany(month, year, companyID, mentor.getEmail());
                        %>

                        <form action ="mentorPaymentServlet" method ="post">
                            <ul class="nav nav-pills ">
                                <input type ="hidden" name ="month" value ="<%=month%>">
                                <input type ="hidden" name ="year" value ="<%=year%>">
                                <input type ="hidden" name ="mentor_email" value ="<%=mentor.getEmail()%>">
                                <input type ="hidden" name ="company_id" value ="<%=company_ids%>"> 
                                <li class=""><button type="submit" class="btn btn-xm btn-primary" style='border-radius: 12px'><%= company_name%><span class="badge"><%=badge%></span></li></button>
                            </ul> 
                        </form>
                    </div>
                
 </div>
 

                        <%
                                }
                            }
                        %>

                    <%
                        } else {
                            out.println("No Ending Mentoring Period!</div>");
                        }
                    %>
                </div>
                <%
                    }
                %>
 </div>
               

                <div class="col-lg-4 col-lg-offset-4">
                    <a href='' class='btn btn-success btn-md' style='border-radius: 12px'><center>Generate All Payment Vouchers</center></a>
                </div>

            </div>
                
                </div>
            </div>
        </div>

    </body>
</html>
