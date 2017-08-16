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
    </head>
    
    <%
            user = (User) session.getAttribute("user");
            int companyID = user.getCompanyid();
            Company company = CompanyDAO.getCompany(companyID);
            
            ArrayList<String> industries = new ArrayList<String>();
            industries.add("E-commerce");
            industries.add("Healthcare");
            industries.add("Medical Devices");
            industries.add("New Media");
            industries.add("Hospitality");	
            industries.add("Travel and Tourism");	
            industries.add("Consumer Durable");	
            industries.add("FMCB");	
            industries.add("Fashion/Lifestyle");	
            industries.add("Web services");	
            industries.add("Consumer Services");	
            industries.add("Media & Entertainment");

        %>
    <body>
        <div class="container">
            <h1 class="well">Edit Company Profile</h1>
            <%
                String status = (String) request.getAttribute("updateStatus");
                if(status != null && !status.isEmpty()){
                    out.println(status);
                }
            %>

            <div class="col-lg-12 well">
                <div class="row">
                    <form action="editCompanyServlet" method="post" enctype="multipart/form-data">
                        <div class="col-sm-12">
                            <div class="row">
                                <div>
                                    <input type="hidden" name="companyID" value="<%= company.getId()%>" >
                                    <br/>
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
                                        <input type="file" name="companyLogo">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Company Name</label>
                                    <input name="companyName" type="text" placeholder="Enter Company Name Here.." class="form-control" value="<%= company.getName()%>">
                                </div>
                            </div>	
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Company Description</label>
                                    <textarea class="form-control" rows="3" name="description" placeholder="Enter Company Description Here.."><%= company.getDescription()%></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Company Vision</label>
                                    <input name="vision" type="text" placeholder="Enter Company Vision Here.." class="form-control" value="<%= company.getVision()%>">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Company Mission</label>
                                    <input name="mission" type="text" placeholder="Enter Company Mission Here.." class="form-control" value="<%= company.getMission()%>">
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <!-- NEED TO SHOW THE SELECTED INDUSTRY FROM DB-->
                                    <label>Industry</label> 

                                    <select class="form-control" id="industry" name="industry">
                                        <option selected value = <%=company.getIndustry()%> ><%=company.getIndustry()%></option>
                                        <% for (String industry : industries) {
                                                if (!company.getIndustry().equals(industry)) {%>
                                        <option value=<%=industry%>> <%=industry%></option>
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
