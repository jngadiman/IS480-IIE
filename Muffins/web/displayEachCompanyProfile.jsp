<%-- 
    Document   : displayEachCompanyProfile
    Created on : Aug 8, 2017, 4:39:21 PM
    Author     : Xinyao
--%>

<%@page import="DAO.ProgramStageDAO"%>
<%@page import="java.util.Date"%>
<%@page import="MODELS.Industry"%>
<%@page import="CONTROLLER.industryController"%>
<%@page import="java.util.Base64"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UserDAO"%>
<%@page import="MODELS.User"%>
<%@page import="MODELS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sidenav.jsp" %>
<%@include file="protect.jsp" %>
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
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company Profile</title>
    </head>
    <body>
        <%  
            String company_id = request.getParameter("company_id");
            System.out.println("displayEachCompanyProfile: " + company_id);
            int compID = 0;
            if (company_id != null && !company_id.equals("")) {
                compID = Integer.parseInt(company_id);
            }

            Company company = CompanyDAO.getCompany(compID);
            System.out.println("displayEachCompanyProfile: " + company);

        %>
        <div class="container">
            <div class="row">
                <div class="col-md-offset-4 col-md-8 col-lg-offset-4 col-lg-6">
                    <div class="col-sm-11 well">
                        <div class="col-xs-12 col-sm-10 col-sm-offset-1">
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
                                    cIndustry.getIndustryName();
                                }
                                Date startDate = company.getStartDate();
                                String startDateStr = "";
                                if (startDate != null) {
                                    startDateStr = new SimpleDateFormat("dd-MM-yyyy").format(startDate);
                                }
                                int companyStage = company.getCurrentStage();
                                String stageName = ProgramStageDAO.getStage(companyStage);
                                /*int numStages = ProgramStageDAO.getStages().size();
                                for (int i = 1; i <= numStages; i++) {
                                    ArrayList<Company> companies = new ArrayList<Company>();
                                    companies = companyController.getCompaniesInStage(i);
                                    String stageName = ProgramStageDAO.getStage(i);
                                } */
                            %>
                            <center><div class="company-logo" style="background-image: url('<%=companyLogoImg%>')" width="200px" height="200" align="center">
                                </div></center>
                            <h3 class='text-center'><%= companyName%></h3>

                            <p class="text-center" style="font-style: italic"><%= description %></p>
                            <br>

                            <p><strong>Start Date</strong>: <%= startDateStr %></p>

                            <p><strong>Company Industry</strong>: <%= cIndustryName %></p>

                            <p><strong>Current Stage</strong>: <%= stageName %></p>
                            <br>

                            <a href="viewAllCompanies.jsp" class="btn btn-success center-block btn-xs" align="middle">Return to Company List</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>