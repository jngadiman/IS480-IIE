<%-- 
    Document   : registerCompany
    Created on : Jul 15, 2017, 12:25:35 AM
    Author     : JEN
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company Registration</title>
        <link href="css/cosmos.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            ArrayList<String> industries = new ArrayList<String>();
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
            
        %>
        <div class="container">
            <h1 class="col-lg-10 well col-sm-offset-1">Company Registration Form</h1>
            <%
                String registerStatus = (String) request.getAttribute("registerCompanyStatus");
                if(registerStatus != null && !registerStatus.isEmpty()){
                    out.println("<h5 class='col-lg-10 col-sm-offset-1'>" + registerStatus + "</h5>");
                }
            %>
           <div class="col-lg-10 well col-sm-offset-1">
                <div class="row">
                    <form action="registerCompanyServlet" method="post" enctype="multipart/form-data">
                        <div class="col-sm-10 col-sm-offset-3">
                            <div class="row">
                                   <div class="col-sm-6 form-group">
                                <label>Company Logo</label>
                                    </br>
                                    Select image to upload:
                                    <input class="form-control" type="file" name="company_logo" id="company_logo">
                                    </form>
                                    </div>
                            </div>
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <label>Company Name</label>
                                        <input class="form-control" id="name" name="name" type="text" placeholder="Enter Company Name Here.." class="form-control">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <label>Company Description</label>
                                        <textarea class="form-control" rows="3" id="description" name="description" placeholder="Enter Company Description Here.."></textarea>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <label>Number of Full-Time Staff</label>
                                        <input id="vision" name="num_fulltime" type="text" placeholder="Enter the Number of Full-Time Staff Here.." class="form-control">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <label>Number of Part-Time Staff</label>
                                        <input id="mission" name="num_parttime" type="text" placeholder="Enter the Number of Part-Time Staff Here.." class="form-control">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <label>Industry</label> 

                                        <select class="form-control" id="industry" name="industry">
                                            <%
                                                for (String industry : industries) {
                                            %>
                                            <option value="<%= industry%>"><%= industry%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>	
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 form-group"> <!-- Date input -->
                                        <label for="startDate">Start Date</label>
                                        <input id="start_date" name="start_date" placeholder="MM/DD/YYY" type="text"/>
                                    </div>
                                </div>	
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <label>Current Stage</label> 

                                        <select class="form-control" id="current_stage" name="current_stage">
                                            <option value="1" >1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                   <div class="col-sm-6 form-group">
                                <label>Acra File</label>
                                    </br>
                                    Select file to upload:
                                    <input class="form-control" type="file" name="acra_file" id="acra_file">
                                    </form>
                                    </div>
                                </div>
                                        
                                <div class="row">
                                   <div class="col-sm-6 form-group">
                                <label>Business Plan Powerpoint Slides</label>
                                    </br>
                                    Select file to upload:
                                    <input class="form-control" type="file" name="biz-slides" id="biz-slides">
                                    </form>
                                    </div>
                                </div>
                                        <div class="row">
                                    <div class="col-sm-6 form-group">
                                <input type="submit" class="btn btn-lg btn-info" value="Submit">	
                                    </div></div>
                                <div class="col-sm-6 col-sm-offset-4"><a href="registerUser.jsp">Back to User Registration</a></div>
                                </div>
                                </form> 
                                </div>
                                </div>
                                </div>
                                </body>
                                </html>
