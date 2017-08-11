<%-- 
    Document   : registerCompany
    Created on : Jul 15, 2017, 12:25:35 AM
    Author     : JEN
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Company"%>
<%@page import="MODELS.Company"%>
<%@page import="DAO.UserDAO"%>
<%@page import="DAO.UserDAO"%>
<%@page import="MODELS.User"%>
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
            String username = "admin@smu.edu.sg";
            User mentor = UserDAO.getUserByEmail(username);
            int companyID = mentor.getCompanyid();
            Company company = CompanyDAO.getCompany(companyID);

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
                    <form action="editCompanyServlet" method="post">
                        <div class="col-sm-12">
                            <div class="row">
                                <div>
                                    <input type="hidden" name="companyID" value="<%= company.getId()%>" >
                                    <label>Company Logo</lable>
                                    <br/>
                                    <input type="text" value="<%= company.getCompanyLogo()%>" name="company_logo">
                                    <br/>
                                    <form action="upload.php" method="post" enctype="multipart/form-data">
                                        Select image to upload:
                                        <input type="file" name="companyLogo">
                                        <input type="submit" value="Upload Image" name="submit">
                                    </form>
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
                                        <option value="Food And Beverage">Food and Beverage</option>
                                        <option value="Retail">Retail</option>
                                        <option value="Construction">Construction</option>
                                        <option value="Manufacturing">Manufacturing</option>
                                        <option value="Technology">Technology</option>
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
