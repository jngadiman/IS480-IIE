
<%-- 
    Document   : viewMentorProfile
    Created on : Jul 15, 2017, 4:30:40 PM
    Author     : Xinyao
--%>

<%@page import="CONTROLLER.industryController"%>
<%@page import="MODELS.Industry"%>
<%@page import="DAO.MentorDAO"%>
<%@page import="MODELS.Mentor"%>
<%@page import="MODELS.Mentor"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Base64"%>
<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UserDAO"%>
<%@page import="MODELS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company Profile</title>
        <%@include file="sidenav.jsp" %>
    </head>
    <%            user = (User) session.getAttribute("user");
        int companyID = user.getCompanyid();
        Company company = CompanyDAO.getCompany(companyID);
    %>
    <body>
        <div class="container">
            <div class="col-lg-8 col-lg-offset-3">
                <h1 class="page-header">View Company Profile</h1>
                <div class="col-lg-12 well">
                    <div class="row">
                        <div class="col-sm-12 form-group">

                            <%  // display the image
                                byte[] imgDataComp = company.getCompanyLogo();
                                if (imgDataComp != null) {
                                    String imgDataBase64 = new String(Base64.getEncoder().encode(imgDataComp));
                            %>
                            <img width="200" src="data:image/gif;base64,<%= imgDataBase64%>"  class="img-responsive center-block" alt="images Here" />
                            <%
                            } else {
                            %>
                            <img width="200" src="img/factory.png"  class="img-responsive center-block" alt="images Here" /><%
                                }

                                out.println("<h3 class='text-center'>" + company.getName() + "</h3>");
                            %>


                            <%String startDate = new SimpleDateFormat("dd-MM-yyyy").format(company.getStartDate());%>
                            <label class="control-label">Start Date</label> : <%=startDate%>
                            <%
                                String stageName = "";
                                int stageNo = company.getCurrentStage();
                                if (stageNo == 1) {
                                    stageName = "1. Business model validation stage";
                                } else if (stageNo == 2) {
                                    stageName = "2. Innovation Development stage";
                                } else if (stageNo == 3) {
                                    stageName = "3. Go-To-Market & early customer acquisition stage";
                                } else if (stageNo == 4) {
                                    stageName = "4. Business Plan/Financial Modelling stage";
                                } else {

                                }

                            %>
                            <p><strong>Company Current Stage</strong> : <%=stageName%> </p>
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
                                                if (userName != null) {
                                                    out.println("<a href='displayEachMenteeProfile.jsp?mentee_email=" + email + "'>" + userName + "</a>");
                                                } else {
                                                    out.println("<a href='displayEachMenteeProfile.jsp?mentee_email=" + email + "'>" + email + "</a>");
                                                }

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
                                <%
                                    if (company.getProductDiff() == null) {
                                        out.println("To be populated");
                                    } else {
                                        out.println(company.getProductDiff());
                                    }
                                %>
                        </div>	
                        <div class="col-sm-6 form-group required">
                            <strong>Revenue Model</strong> :<br> 
                            <%
                                if (company.getRevenueModel() == null) {
                                    out.println("To be populated");
                                } else {
                                    out.println(company.getRevenueModel());
                                }
                            %>
                        </div>	
                    </div>

                    <div class="row">
                        <div class="col-sm-6 form-group required">
                            <strong>Traction</strong> :<br> 
                            <%
                                if (company.getTraction() == null) {
                                    out.println("To be populated");
                                } else {
                                    out.println(company.getTraction());
                                }
                            %>
                        </div>	
                        <div class="col-sm-6 form-group required">
                            <strong>Deployment of Funds</strong> :<br> 
                            <%
                                if (company.getDeployOfFunds() == null) {
                                    out.println("To be populated");
                                } else {
                                    out.println(company.getDeployOfFunds());
                                }
                            %>
                        </div>	
                    </div>

                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label class="control-label">Incubation Pitch Deck Slides : 
                            </label> <a href="displayPdf.jsp?companyId=<%=company.getId()%>" target="blank" />PDF</a>
                        </div>
                    </div>
                        
                    <a href="editCompanyProfile.jsp" class="btn btn-success btn-xs text-center">Edit Company Profile</a>
                </div>
            </div>
          

        </div>
        <!--
        <iframe width="420" height="315" src="https://www.youtube.com/embed/XGSy3_Czz8k"> </iframe>
        -->


    </body>



</html>
