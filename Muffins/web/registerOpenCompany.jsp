<%-- 
    Document   : registerCompany
    Created on : Jul 15, 2017, 12:25:35 AM
    Author     : JEN
--%>

<%@page import="CONTROLLER.industryController"%>
<%@page import="MODELS.Industry"%>
<%@page import="MODELS.Industry"%>
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
        <link href="css/registerationForm.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            ArrayList<Industry> industries = industryController.getIndustries();
        %>
        <div class="container">
            <h1 class="col-lg-10 well col-sm-offset-1">Company Registration Form</h1>
            <%
                String registerStatus = (String) request.getAttribute("registerCompanyStatus");
                if (registerStatus != null && !registerStatus.isEmpty()) {
                    out.println("<h5 class='col-lg-10 col-sm-offset-1'>" + registerStatus + "</h5>");
                }
            %>
            <div class="col-lg-10 well col-sm-offset-1">
                <div class="row">
                    <form action="registerCompanyServlet" method="post" enctype="multipart/form-data">
                        <div class="col-sm-10 col-sm-offset-1">
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label class="control-label">Company Logo</label>
                                    </br>
                                    <input class="form-control" type="file" name="company_logo" id="company_logo">
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Company Name</label>
                                    <input class="form-control" id="name" name="name" type="text" placeholder="Enter Company Name Here.." class="form-control" required>
                                </div>


                            </div>
                            <div class="row">

                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Industry</label> 

                                    <select class="form-control" id="industry" name="industry" required>
                                        <%
                                            for (Industry i : industries) {
                                        %>
                                        <option value="<%= i.getIndustryCode()%>"><%= i.getIndustryName()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12 form-group required">
                                    <label class="control-label">Company Description</label>
                                    <textarea class="form-control" rows="3" id="description" name="description" placeholder="Enter Company Description Here.." required></textarea>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">OMS Incubation Interest Form</label>
                                    </br>
                                    Select file to upload:
                                    <input class="form-control" type="file" name="application_form" id="application_form" required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Pitch Deck Slides</label>
                                    </br>
                                    Select file to upload:
                                    <input class="form-control" type="file" name="pitch_deck_slides" id="pitch_deck_slides" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12 form-group required">
                                    <label class="control-label">Founder E-mails</label>
                                    <input id="shareholders" name="shareholders" type="text" placeholder="Enter emails separated by , (comma)" class="form-control" required multiple>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12 form-group required">
                                    <label class="control-label">Differentiation of Product</label>
                                    <textarea class="form-control" rows="3" id="product_differetiation" name="product_differetiation" placeholder="Enter Differetiation of Product Here.. (200 words)" required></textarea>
                                </div>


                            </div>

                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Required fields</label>
                                </div>	
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <input type="hidden" name="companyType" value="open"/>
                                    <input type="submit" class="btn btn-lg btn-info" value="Submit">	
                                </div>
                            </div>
                            <div class="col-sm-6 col-sm-offset-4"><a href="login.jsp">Back to Login Page</a></div>
                        </div>
                    </form> 
                </div>
            </div>
        </div>
                                    
                                    
                                    
    </body>
</html>
