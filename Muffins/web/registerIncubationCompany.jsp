<%-- 
    Document   : registerIncubationCompany.jsp
    Created on : Aug 30, 2017, 12:49:09 PM
    Author     : Xinyao
--%>

<%@page import="MODELS.Industry"%>
<%@page import="CONTROLLER.industryController"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Startup Company Registration Form</title>
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
            <h1 class="col-lg-10 well col-sm-offset-1">Startup Company Registration Form</h1>
            <%                String registerStatus = (String) request.getAttribute("registerCompanyStatus");
                if (registerStatus != null && !registerStatus.isEmpty()) {
                    if(registerStatus.equals("Success!")){
                        out.println("<h5 class='col-lg-10 col-sm-offset-1'>Your company application is successful, please check your email for confirmation!</h5>");
                    }else{
                    out.println("<h5 class='col-lg-10 col-sm-offset-1'>" + registerStatus + "</h5>");
                    }
                }
            %>
            <div class="col-lg-10 well col-sm-offset-1">
                <div class="row">
                    <form action="registerCompanyServlet" method="post" enctype="multipart/form-data">
                        <div class="col-sm-10 col-sm-offset-1">
                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Company Name</label>
                                    <input class="form-control" id="name" name="name" type="text" placeholder="Enter Company Name Here.." class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label class="control-label">Company Logo</label>
                                    </br>
                                    <input class="form-control" type="file" name="company_logo" id="company_logo" >
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
                                    <textarea class="form-control" rows="3" id="description" name="description" placeholder="Enter Company Description Here.. " required></textarea>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Incubation Pitch Deck Slides</label>
                                    </br>
                                    Format <b>.pdf</b>, Max. 2mb, Guideline <a href="https://image.ibb.co/cFoVFb/Business_Deck_Guidelines_v2.png" target="blank">here</a>
                                    <input class="form-control" type="file" name="pitch_deck_slides" id="pitch_deck_slides" required>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label class="control-label">Acra File</label>
                                    </br>
                                    If company is registered, please upload <b>.pdf</b> format
                                    <input class="form-control" type="file" name="acra_file" id="acra_file">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 form-group required">
                                    <label class="control-label">Founder E-mails</label>
                                    <input id="shareholders" name="shareholders" type="text" placeholder="Enter emails separated by , (comma)" class="form-control" required>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-sm-12 form-group required">
                                    <label class="control-label">Differentiation of Product</label>
                                    <textarea class="form-control" rows="3" id="product_differetiation" name="product_differetiation" placeholder="Enter differetiation of product here.. (200 words)" required></textarea>
                                </div>

                                <div class="row">
                                    <div class="col-sm-6 form-group required">
                                        <label class="control-label">Required fields</label>
                                    </div>	
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <input type="hidden" name="companyType" value="incubator"/>
                                        <input type="submit" class="btn btn-lg btn-info" value="Submit">	
                                    </div>
                                </div>
                                <!--                            <div class="col-sm-6 col-sm-offset-4"><a href="registerIncubationUser.jsp">Back to User Registration</a></div>-->
                            </div>
                    </form> 
                </div>
            </div>
        </div>
    </div>
</body>
</html>
