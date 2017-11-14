<%-- 
    Document   : displayEachCompanyProfile
    Created on : Aug 8, 2017, 4:39:21 PM
    Author     : Xinyao
--%>

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
    <body>
        <%  String company_id = request.getParameter("company_id");
            int compID = 0;
            if (company_id != null && !company_id.equals("")) {
                compID = Integer.parseInt(company_id);
            }

            Company company = CompanyDAO.getCompany(compID);

        %>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-offset-4 col-lg-6">
                    <h1 class="page-header">Company Profile</h1>
                    <div class="col-sm-11 well">
                        <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                            <%                   // display the image
                                byte[] companyLogo = company.getCompanyLogo();
                                if (companyLogo != null) {
                                    String imgDataBase64 = new String(Base64.getEncoder().encode(companyLogo));

                            %>
                            <img src="data:image/gif;base64,<%= imgDataBase64%>" class="img-responsive center-block" width="200" height="200" alt="Profile Picture" />
                            <%
                            } else {
                            %>
                            <img src="img/factory.png" class="img-responsive center-block" width="200" height="200" alt=""/>
                            <%
                                }
                                
                            %>
                            <h3 class='text-center'><%= company.getName()%></h3>

                            <p><strong>Description</strong> :<br> 
                                <%= company.getDescription()%></p>
                            <p><strong>Company Industry</strong> : <%= industryController.getIndustry(company.getIndustry()).getIndustryName()%></p>
                           
                            <%
                                 String stageName = "";
                                int stageNo = company.getCurrentStage();
                                if (stageNo == 1) {
                                    stageName = "1. Business Model Validation Stage";
                                } else if (stageNo == 2) {
                                    stageName = "2. Innovation Development Stage";
                                } else if (stageNo == 3) {
                                    stageName = "3. Go-To-Market & Early Customer Acquisition Stage";
                                } else if (stageNo == 4) {
                                    stageName = "4. Business Plan/Financial Modelling Stage";
                                } else {
                                    stageName = Integer.toString(stageNo);
                                }
                                
                            %>
                            <p><strong>Current Stage</strong> : <%=stageName%> </p>

                            <a href="viewAllCompanies.jsp" class="btn btn-success btn-xs">Return to Company List</a>
                        </div>



                    </div>
                </div>
            </div>
        </div>
    </body>

</html>