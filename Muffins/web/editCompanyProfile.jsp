<%-- 
    Document   : registerCompany
    Created on : Jul 15, 2017, 12:25:35 AM
    Author     : JEN
--%>

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
    </head>
    
    <%
            user = (User) session.getAttribute("user");
            int companyID = user.getCompanyid();
            Company company = CompanyDAO.getCompany(companyID);
            
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

        %>
    <body>
        <div class="container">
            <h1 class="well col-lg-8 col-lg-offset-2">Edit Company Profile</h1>
            <%
                String status = (String) request.getAttribute("updateStatus");
                if(status != null && !status.isEmpty()){
                    out.println("<div align='center'>" + status + "</div>");
                }
            %>

            <div class="col-lg-8 well col-lg-offset-2">
                <div class="row">
                    <form action="editCompanyServlet" method="post" enctype="multipart/form-data">
                        <div class="col-sm-8">
                            <div class="row">
                                <div>
                                    <input type="hidden" name="companyID" value="<%= company.getId()%>">
                                    <br/>
                                    <div class="col-sm-6 form-group required">
                                    <%
                                        // display the image
                                        byte[] imgData = company.getCompanyLogo();
                                        if(imgData != null){
                                            String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                                    %>
                                        <div align="left"><img width="200" src="data:image/gif;base64,<%= imgDataBase64%>"  alt="images Here" /></div>
                                    <%
                                        }
                                    %>
                                    <br/>
                                   
                                        Select image to upload:
                                        <input type="file" name="companyLogo" required>
                                         </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <label>Company Name</label>
                                    <input name="companyName" type="text" placeholder="Enter Company Name Here.." class="form-control" value="<%= company.getName()%>" required>
                                </div>
                            </div>	
                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <label>Company Description</label>
                                    <textarea class="form-control" rows="3" name="description" placeholder="Enter Company Description Here.." required><%= company.getDescription()%></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <label>Number of Full-Time Staff</label>
                                    <input name="num_fulltime" type="text" placeholder="Enter Company Vision Here.." class="form-control" value="<%= company.getFullTimers()%>" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <label>Number of Part-Time Staff</label>
                                    <input name="num_parttime" type="text" placeholder="Enter Company Mission Here.." class="form-control" value="<%= company.getPartTimers()%>">
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <!-- NEED TO SHOW THE SELECTED INDUSTRY FROM DB-->
                                    <label>Industry</label> 

                                    <select class="form-control" id="industry" name="industry">
                                        <option selected value = <%=company.getIndustry()%> ><%=company.getIndustry()%></option>
                                        <% for (String industry : industries) {
                                                //if (!company.getIndustry().equals(industry)) {%>
                                        <option value='<%=industry%>'> <%=industry%></option>
                                        <%      }
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group"> <!-- Date input -->
                                <label for="inputDate">Start Date</label>
                                <input name="startDate" placeholder="MM/DD/YYY" type="text" value="<%= new SimpleDateFormat("dd/MM/yyyy").format(company.getStartDate())%>"/>
                             </div>
                            <!-- check if the current logged in user is a mentor or mentee. if mentee and regular mentee -> show stage -->
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <!-- NEED TO SHOW THE CURRENT STAGE FROM DB-->
                                    <label>Current Stage</label> 
                                    <select class="form-control" name="stage">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
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
