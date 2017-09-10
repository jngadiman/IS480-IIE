<%-- 
    Document   : registerCompany
    Created on : Jul 15, 2017, 12:25:35 AM
    Author     : JEN
--%>

<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="MODELS.Industry"%>
<%@page import="MODELS.Industry"%>
<%@page import="CONTROLLER.industryController"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Company"%>
<%@page import="MODELS.Company"%>
<%@page import="DAO.UserDAO"%>
<%@page import="DAO.UserDAO"%>
<%@page import="MODELS.User"%>
<%@include file="protect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Company Profile</title>
        <%@include file="navbar.jsp" %>
        <link href="css/stages.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/npm.js" type="text/javascript"></script>
        <link href="css/bootstrap-datepicker.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <link href="css/cosmos.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <link href="css/form.css" rel="stylesheet" type="text/css"/>

    </head>

    <%        user = (User) session.getAttribute("user");
        int companyID = user.getCompanyid();
        Company company = CompanyDAO.getCompany(companyID);
        /*
         ArrayList<String> industries = new ArrayList<String>();
         industries.add("-- select one --");
         industries.add("Energy Equipment & Services");
         industries.add("Oil, Gas & Consumable Fuels");
         industries.add("Chemicals");
         industries.add("Construction Materials");
         industries.add("Containter & Packaging");
         industries.add("Metals & Mining");
         industries.add("Paper & Forest Products");
         industries.add("Aerospace & Defense");
         industries.add("Building Products");
         industries.add("Construction & Engineering");
         industries.add("Electrical Equipment");
         industries.add("Industrial Conglomerates");
         industries.add("Machinery");
         industries.add("Trading Companies & Distributors");
         industries.add("Commercial Services & Supplies");
         industries.add("Professional Services");
         industries.add("Air Freight & Logistics");
         industries.add("Airlines");
         industries.add("Marine");
         industries.add("Road & Rail");
         industries.add("Transportation Infrastructure");
         industries.add("Auto Components");
         industries.add("Automobiles");
         industries.add("Household Durables");
         industries.add("Leisure Products");
         industries.add("Textiles, Apparel & Luxury Goods");
         industries.add("Hotels, Restaurants & Leisure");
         industries.add("Diversified Consumer Services");
         industries.add("Media");
         industries.add("Distributors");
         industries.add("Internet & Direct Marketing Retail");
         industries.add("Multiline Retail");
         industries.add("Specialty Retail");
         industries.add("Food & Staples Retailing");
         industries.add("Beverages");
         industries.add("Food Products");
         industries.add("Tobacco");
         industries.add("Household Products");
         industries.add("Personal Products");
         industries.add("Health Care Equipment & Supplies");
         industries.add("Health Care Providers & Services");
         industries.add("Health Care Technology");
         industries.add("Biotechnology");
         industries.add("Pharmaceuticals");
         industries.add("Life Sciences Tools & Services");
         industries.add("Banks");
         industries.add("Thrifts & Mortgage Finance");
         industries.add("Diversified Financial Services");
         industries.add("Capital Markets");
         industries.add("Mortgage Real Estate Investment Trusts (REITs)");
         industries.add("Insurance");
         industries.add("Internet Software & Services");
         industries.add("IT Services");
         industries.add("Software");
         industries.add("Communications Equipment");
         industries.add("Technology Hardware, Storage & Peripherals");
         industries.add("Electronic Equipment, Instruments & Components");
         industries.add("Semiconductors & Semiconductor Equipment");
         industries.add("Diversified Telecommunication Services");
         industries.add("Wireless Telecommunication Services");
         industries.add("Electric Utilities");
         industries.add("Gas Utilities");
         industries.add("Multi-Utilities");
         industries.add("Water Utilities");
         industries.add("Independent Power and Renewable Electricity Producers");
         industries.add("Equity Real Estate Investment Trusts (REITs)");
         industries.add("Real Estate Management & Development");
         */

        ArrayList<Integer> stages = new ArrayList<Integer>();
        stages.add(1);
        stages.add(2);
        stages.add(3);
        stages.add(4);
    %>
    <body>
        <div class="container">
            <div class="col-lg-10 well col-sm-offset-1"><h1>Edit Company Profile</h1>
                <%                String status = (String) request.getAttribute("updateStatus");
                    if (status != null && !status.isEmpty()) {
                %>

                <div class="alert alert-dismissible alert-success col-lg-5">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <%=status%>
                </div>
            </div>
            <%
                }
            %>

            <div class="col-lg-10 well col-sm-offset-1">
                <div class="row">
                    <form action="editCompanyServlet" method="post" enctype="multipart/form-data">
                        <div class="col-sm-10 col-sm-offset-1">
                            <div class="row">
                                <div>
                                    <input type="hidden" name="companyID" value="<%= company.getId()%>">
                                    <br/>
                                    <div class="col-sm-6 form-group required">
                                        <%
                                            // display the image
                                            byte[] imgData = company.getCompanyLogo();
                                            if (imgData != null) {
                                                String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                                        %>
                                        <div align="left"><img width="200" src="data:image/gif;base64,<%= imgDataBase64%>"  alt="images Here"/></div>
                                            <%
                                                }
                                            %>
                                        <br/>
                                        <label class="control-label">Company Logo</label>
                                        <br/>
                                        Select image to upload:
                                        <input type="file" name="companyLogo">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Company Name</label>
                                    <input name="companyName" type="text" placeholder="Enter Company Name Here.." class="form-control" value="<%= company.getName()%>" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6 form-group required"> <!-- Date input -->
                                    <label class="control-label">Start Date</label><br>
                                    <input name="startDate" placeholder="MM/DD/YYYY" type="text" class="form-control" value="<%= new SimpleDateFormat("dd/MM/yyyy").format(company.getStartDate())%>" required>
                                </div>
                            </div>
                            <!-- check if the current logged in user is a mentor or mentee. if mentee and regular mentee -> show stage -->
                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <!-- NEED TO SHOW THE CURRENT STAGE FROM DB-->
                                    <label class="control-label">Current Stage</label> 
                                    <select class="form-control" name="stage" required>
                                        <option selected value = <%= company.getCurrentStage()%> ><%= company.getCurrentStage()%></option>
                                        <% for (Integer s : stages) {
                                                if (company.getCurrentStage() != s) {%>
                                        <option value='<%=s%>'><%=s%></option>
                                        <%      }
                                            }
                                        %>

                                    </select>

                                </div>
                            </div>

                            <div class="row">

                                <div class="col-sm-6 form-group required">
                                    <!-- NEED TO SHOW THE SELECTED INDUSTRY FROM DB-->
                                    <label class="control-label">Industry</label> 
                                    <select class="form-control" name="industry" required>
                                        <%
                                            Industry industry = industryController.getIndustry(company.getIndustry());
                                            if (industry != null) {
                                                String industry_name = industry.getIndustryName();
                                        %>
                                        <option selected value = <%=company.getIndustry()%> ><%=industry_name%></option>
                                        <%
                                            }
                                        %>
                                        <%
                                            ArrayList<Industry> industries = industryController.getIndustries();
                                            for (Industry i : industries) {
                                                if (company.getIndustry() != i.getIndustryCode()) {%>
                                        <option value='<%=i.getIndustryCode()%>'><%=i.getIndustryName()%></option>
                                        <%      }
                                            }
                                        %>
                                    </select>

                                </div>
                            </div>

                            <div class="row">

                                <div class="col-sm-12 form-group required">
                                    <label class="control-label">Company Description</label>
                                    <textarea class="form-control" rows="3" name="description" placeholder="Enter Company Description Here.." required><%= company.getDescription()%></textarea>
                                </div>
                            </div>

                            <div class="row">

                                <div class="col-sm-12 form-group required">
                                    <label class="control-label">Stakeholders E-mails</label>
                                    <%
                                        String[] stakeholders;
                                        stakeholders = company.getStakeholders();

                                        if (stakeholders != null && stakeholders.length != 0) {

                                            String stakeholderFull = stakeholders[0];
                                            for (int i = 1; i < stakeholders.length; i++) {
                                                stakeholderFull = stakeholderFull + ',' + stakeholders[i];
                                            }
                                    %>
                                    <input id="shareholders" name="shareholders" type="text" placeholder="Enter emails separated by , (comma)" class="form-control" value="<%=stakeholderFull%>" required multiple>

                                    <%
                                    } else {
                                    %>
                                    <input id="shareholders" name="shareholders" type="text" placeholder="Currently, no stakeholders found! Enter emails separated by , (comma) " class="form-control" required multiple>

                                    <%
                                        }
                                    %>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Number of Full-Time Staff</label>
                                    <input name="num_fulltime" type="text" placeholder="Enter Company Vision Here.." class="form-control" value="<%= company.getFullTimers()%>" required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Number of Part-Time Staff</label>
                                    <input name="num_parttime" type="text" placeholder="Enter Company Mission Here.." class="form-control" value="<%= company.getPartTimers()%>">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Differentiation of Product</label>
                                    <textarea class="form-control" rows="3" id="product_differentiation" name="product_differentiation" placeholder="Enter Differentiation of Product Here.." required><%= company.getProductDiff()%></textarea>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Revenue Model</label>
                                    <textarea class="form-control" rows="3" id="revenue_model" name="revenue_model" placeholder="Enter Revenue Model Here.." required><%= company.getDeployOfFunds()%></textarea>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Traction</label>
                                    <textarea class="form-control" rows="3" id="traction" name="traction" placeholder="Enter Traction Here.." required><%= company.getTraction()%></textarea>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Deployment of Funds</label>
                                    <textarea class="form-control" rows="3" id="deployment_of_funds" name="deployment_of_funds" placeholder="Enter Deployment Of Funds Here.." required><%= company.getDeployOfFunds()%></textarea>
                                </div>
                            </div>
                            NEED TO PERFORM CHECK ONLY SHOW IF IT'S OPENMENTOR
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Update Business Slides </label>
                                    <input type="file" name="biz_slides"/>
                                </div>


                            </div>
                            <button type="submit" class="btn btn-lg btn-info">Submit</button>					
                        </div>
                    </form> 
                </div>
            </div>
        </div>
    </body>
</html>
