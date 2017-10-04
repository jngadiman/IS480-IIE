
<%@page import="CONTROLLER.industryController"%>
<%@page import="MODELS.Industry"%>
<%@page import="DAO.MentorDAO"%>
<%@page import="MODELS.Mentor"%>
<%@page import="MODELS.Mentor"%>
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
        <title>Company Profile</title>
        <%@include file="sidenav.jsp" %>
        <%@include file="protect.jsp" %>
    </head>
    <%            user = (User) session.getAttribute("user");
        int companyID = user.getCompanyid();
        Company company = CompanyDAO.getCompany(companyID);
    %>
    <body>
        <div class="container">
            <div class="col-lg-9 col-lg-offset-2">
                <h1 class="page-header col-lg-9 col-lg-offset-2">View Company Profile</h1>
                <div class="col-lg-9 well col-lg-offset-2">
                    <div class="row">
                        <div class="col-sm-6 form-group">

                            <%  // display the image
                                byte[] imgDataComp = company.getCompanyLogo();
                                if (imgDataComp != null) {
                                    String imgDataBase64 = new String(Base64.getEncoder().encode(imgDataComp));
                            %>
                            <img width="200" src="data:image/gif;base64,<%= imgDataBase64%>"  alt="images Here" />
                            <%
                            } else {
                            %>
                            <img width="200" src="img/factory.png"  alt="images Here" /><%
                                }
                            %>

                            <p><font size="+3"><%= company.getName()%></font></p>
                                <%String startDate = new SimpleDateFormat("dd-MM-yyyy").format(company.getStartDate());%>
                            <label class="control-label">Start Date</label> : <%=startDate%>
                            <p><strong>Company Current Stage</strong> : <%= company.getCurrentStage()%></p>
                            <%Industry industry = industryController.getIndustry(company.getIndustry());
                                if (industry != null) {
                                    //industry still cannot edit properly%>
                            <p><strong>Industry</strong> : <%=industry.getIndustryName()%></p>
                            <%  }
                                Mentor m = relationshipController.getCurrentMentorOfCompany(company.getId());
                                String mentorName = "";
                                if (m != null) {
                                    mentorName = m.getName();
                                } else {
                                    mentorName = "Currently No Mentor";
                                }
                            %>
                            <p><strong>Company Current Mentor</strong> : <%= mentorName%>
                                <%
                                    ArrayList<String> all_founders = UserDAO.getUserEmailsOfCompany(companyID);
                                    String first_founder_email = all_founders.get(0);
                                    User first_user = UserDAO.getUserByEmail(first_founder_email);

                                    String first_user_type = first_user.getUser_type();

                                    /*    if (first_user!= null&&first_user_type.equals("mentee")) {
                                     Mentee first_user_mentee = (Mentee) first_user;
                                     String mentor_email = first_user_mentee.getMentor_email();
                                     if (mentor_email !=null && !mentor_email.equals("")){
                                     Mentor mentor2 = MentorDAO.getMentorByEmail(mentor_email);
                                     String mentor2_name = mentor2.getName();
                                     String mentor2_email = mentor2.getEmail();
                                     out.println(" <a href='displayProfile.jsp?email=" + mentor2_email + " class='btn btn-success btn-xs'>" + mentor2_name + "</a>");
                                     }

                                     } else{
                                     out.println("Company is owned by mentor");
                                     }
                                            
                                     */

                                %></p>
                        </div>
                    </div>

                    <!-- <div class="row">
                         <div class="col-sm-12 form-group required">
                             <p><strong>Company Founders</strong> :<br> 
                             <p><%/*
                                  ArrayList<String> allFounders = UserDAO.getUserEmailsOfCompany(companyID);
                                  String firstFounderEmail = allFounders.get(0);
                                  User firstUser = UserDAO.getUserByEmail(firstFounderEmail);
                                  String firstUserName = firstUser.getName();
                                  out.println(" <a href='displayProfile.jsp?email=" + firstFounderEmail + " class='btn btn-success btn-xs'>" + firstUserName + "</a>");
                                  for (int i = 1; i < allFounders.size(); i++) {
                                  String s = allFounders.get(i);
                                  User u = UserDAO.getUserByEmail(s);
                                  String userName = u.getName();
                                  out.println(", <a href='displayProfile.jsp?email=" + s + "'>" + userName + "</a>");
                                  }

                                  */
                    %></p>
            </div>	
        </div>
                    -->

                    <div class="row">
                        <div class="col-sm-12 form-group required">
                            <p><strong>Company Description</strong> :<br> 
                            <p><%= company.getDescription()%></p>
                        </div>	
                    </div>

                    <div class="row">
                        <div class="col-sm-12 form-group required">
                            <p><strong>Stakeholder(s)</strong> :<br> 
                                <%
                                    String[] stakeholders;
                                    stakeholders = company.getStakeholders();

                                    if (stakeholders != null && stakeholders.length != 0) {

                                        for (int i = 0; i < stakeholders.length; i++) {
                                            User u = UserDAO.getUserByEmail(stakeholders[i]);
                                            if (u != null) {
                                                String email = u.getEmail();
                                                String userName = u.getName();
                                                out.println("<a href='displayProfile.jsp?email=" + email + "'>" + userName + "</a>");
                                                if (i != stakeholders.length - 1) {
                                                    out.print(", ");
                                                }
                                            } else {
                                                out.print(stakeholders[i]);
                                                if (i != stakeholders.length - 1) {
                                                    out.print(", ");
                                                }
                                            }
                                        }
                                    }
                                %>
                        </div>	
                    </div>


                    <div class="row">
                        <div class="col-sm-6 form-group required">
                            <p><strong>Number of Full-Time Employees</strong> : <%= company.getFullTimers()%></p>
                        </div>
                        <div class="col-sm-6 form-group required">
                            <p><strong>Number of Part-Time Employees</strong> : <%= company.getPartTimers()%></p>
                        </div>	
                    </div>

                    <div class="row">
                        <div class="col-sm-6 form-group required">
                            <p><strong>Product Differentiation</strong> :<br> 
                                <%= company.getProductDiff()%></p>
                        </div>	
                        <div class="col-sm-6 form-group required">
                            <p><strong>Revenue Model</strong> :<br> 
                                <%= company.getRevenueModel()%></p>
                        </div>	
                    </div>

                    <div class="row">
                        <div class="col-sm-6 form-group required">
                            <p><strong>Traction</strong> :<br> 
                                <%= company.getTraction()%></p>
                        </div>	
                        <div class="col-sm-6 form-group required">
                            <p><strong>Deployment of Funds</strong> :<br> 
                                <%= company.getDeployOfFunds()%></p>
                        </div>	
                    </div>

                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label class="control-label">Incubation Pitch Deck Slides : 
                            </label> <%=company.getBizFile()%>
                        </div>
                    </div>
                </div>
            </div>
            <p class="text-center"><a href="editCompanyProfile.jsp" class="btn btn-success btn-xs">Edit Company Profile</a></p>

        </div>
        <!--
        <iframe width="420" height="315" src="https://www.youtube.com/embed/XGSy3_Czz8k"> </iframe>
        -->


    </body>



</html>
