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
            ArrayList<String> industries = new ArrayList<>();
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
                                        <label>Company Vision</label>
                                        <input id="vision" name="vision" type="text" placeholder="Enter Company Vision Here.." class="form-control">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <label>Company Mission</label>
                                        <input id="mission" name="mission" type="text" placeholder="Enter Company Mission Here.." class="form-control">
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
