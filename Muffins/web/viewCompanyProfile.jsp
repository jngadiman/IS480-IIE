
<%@page import="java.util.Date"%>
<%@page import="DAO.ProgramStageDAO"%>
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
    <style>
        .company-logo {
            border-radius: 50%;
            height: 200px;
            width: 200px;
            background-size: cover;
            background-position: center;
            background-blend-mode: multiply;
            vertical-align: middle;
            text-align: center;
            color: transparent;
            transition: all .3s ease;
            text-decoration: none;
        }

        .company-logo:hover {
            background-color: rgba(0,0,0,.5);
            z-index: 10000;
            color: #fff;
            transition: all .3s ease;
            text-decoration: none;
        }
    </style>
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
            <div class="col-lg-10 col-sm-offset-1">
                <h1 class="page-header">View Company Profile</h1>
                <div class="col-lg-12 well">
                    <div class="row">
                        <div class="col-sm-12 form-group">

                            <%  // displaying of profile picture
                                byte[] companyLogo = company.getCompanyLogo();
                                String companyLogoImg = "";
                                if (companyLogo == null) {
                                    companyLogoImg = "img/building.png";
                                } else {
                                    String imgDataBase64 = new String(Base64.getEncoder().encode(companyLogo));
                                    companyLogoImg = "data:image/gif;base64," + imgDataBase64;
                                }

                                // getting company fields to be displayed
                                String companyName = company.getName();
                                String description = company.getDescription();
                                if (description == null) {
                                    description = companyName;
                                }
                                int cIndustryCode = company.getIndustry();
                                Industry cIndustry = industryController.getIndustry(cIndustryCode);
                                String cIndustryName = "";
                                if (cIndustry != null) {
                                    cIndustryName = cIndustry.getIndustryName();
                                }
                                Date startDate = company.getStartDate();
                                String startDateStr = "";
                                if (startDate != null) {
                                    startDateStr = new SimpleDateFormat("dd-MMM-yyyy").format(startDate);
                                }
                                int companyStage = company.getCurrentStage();
                                String stageName = ProgramStageDAO.getStage(companyStage);
                                String fullStageName = companyStage + ". " + stageName;
                                /*int numStages = ProgramStageDAO.getStages().size();
                                for (int i = 1; i <= numStages; i++) {
                                    ArrayList<Company> companies = new ArrayList<Company>();
                                    companies = companyController.getCompaniesInStage(i);
                                    String stageName = ProgramStageDAO.getStage(i);
                                } */
                                Mentor m = relationshipController.getCurrentMentorOfCompany(company.getId());
                                String mentorName = "";
                                if (m != null) {
                                    mentorName = m.getName();
                                } else {
                                    mentorName = "Currently No Mentor";
                                }
                            %>
                            <center><div class="company-logo" style="background-image: url('<%=companyLogoImg%>')" width="200px" height="200" align="center">
                                </div></center>
                            <h3 class='text-center'><%= companyName%></h3>

                            <p class="text-center" style="font-style: italic"><%= description%></p>
                            <br>

                            <p><strong>Current Mentor</strong> : <%= mentorName%>

                            <p><strong>Current Stage</strong> : <%=fullStageName%> </p>
                            <div class="row">
                                <div class="col-sm-6">
                                    <p><strong>Industry</strong> : <%=cIndustryName%></p>
                                </div>
                                <div class="col-sm-6">
                                    <p><strong>Start Date</strong> : <%=startDateStr%></p>
                                </div>
                            </div>

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
                            <p><strong>Stakeholder(s)</strong> :<br> 
                                <%                                    String[] stakeholders;
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
                    <%
                        String toBePopulated = "To Be Populated";

                        String productDiff = "";
                        String revenueModel = "";
                        String traction = "";
                        String deploymentOfFunds = "";

                        //productDiff = revenueModel = traction = deploymentOfFunds = toBePopulated;
                        productDiff = company.getProductDiff();
                        revenueModel = company.getRevenueModel();
                        traction = company.getTraction();
                        deploymentOfFunds = company.getDeployOfFunds();
                        
                        if (productDiff == null || productDiff.isEmpty()) {
                            productDiff = toBePopulated;
                        }
                        if (revenueModel == null || revenueModel.isEmpty()) {
                            revenueModel = toBePopulated;
                        }
                        if (traction == null || traction.isEmpty()) {
                            traction = toBePopulated;
                        }
                        if (deploymentOfFunds == null || deploymentOfFunds.isEmpty()) {
                            deploymentOfFunds = toBePopulated;
                        }
                    %>

                    <div class="row">
                        <div class="col-sm-6 form-group required">
                            <p><strong>Product Differentiation</strong>:<br>
                                <span style="font-style:italic"><%=productDiff%></span></p>
                        </div>	
                        <div class="col-sm-6 form-group required">
                            <p><strong>Revenue Model</strong>:<br>  
                            <span style="font-style:italic"><%=revenueModel%></span></p>
                        </div>	
                    </div>

                    <div class="row">
                        <div class="col-sm-6 form-group required">
                            <p><strong>Traction</strong>:<br>
                            <span style="font-style:italic"><%=traction%></span></p>
                        </div>	
                        <div class="col-sm-6 form-group required">
                            <p><strong>Deployment of Funds</strong>:<br>
                            <span style="font-style:italic"><%=deploymentOfFunds%></span></p>
                        </div>	
                    </div>

                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label class="control-label">Incubation Pitch Deck Slides:</label>  <a href="displayPdf.jsp?companyId=<%=company.getId()%>" target="blank" />View PDF</a>
                        </div>
                    </div>

                    <div class="col-lg-12" align="center"><a href="editCompanyProfile.jsp" class="btn-sm btn-success">Edit Company Profile</a></div>
                </div>
            </div>


        </div>
        <!--
        <iframe width="420" height="315" src="https://www.youtube.com/embed/XGSy3_Czz8k"> </iframe>
        -->


    </body>



</html>
