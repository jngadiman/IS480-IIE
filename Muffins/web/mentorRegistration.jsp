<%-- 
    Document   : mentorRegistration
    Created on : Oct 7, 2017, 10:38:17 AM
    Author     : Xinyao
--%>

<%@page import="DAO.CompanyDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register for New Mentor</title>
        <%@include file="sidenav.jsp" %>
        <link href="css/mentorRegistration.css" rel="stylesheet" type="text/css"/>
        <link href="css/cosmos.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <link href="css/form.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="container">
            <h1 class="col-lg-10 col-lg-offset-1 well">User Registration Form</h1>

            <div class="col-lg-10 col-lg-offset-1 well">
                <div class="row">
                    <form action = "addUserServlet" method ="post" name="registerUser" onsubmit="return validateForm()">
                        <div class="col-sm-10 col-lg-offset-1">
                            <div class="row">
                                <input type = "hidden" name ="user_type" value ="mentor">
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Full Name</label> 
                                    <input id="name" type="text" name="name" placeholder="Enter Full Name Here.." class="form-control" required>
                                    <input type = "hidden" name ="password" type="password" value ="fullName">
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Email Address</label>
                                    <input id="email" type="email" name="email" placeholder="Enter Email Address Here.." class="form-control" data-fv-emailaddress-message="The value is not a valid email address" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">NRIC</label>
                                    <input id="nric" type="text" name="nric" placeholder="Enter NRIC Here.." class="form-control" required>
                                    <link href="css/mentorRegistration.css" rel="stylesheet" type="text/css"/>
                                </div>	
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Contact Number</label>
                                    <input id="contact" type="text" name="contact" placeholder="Enter Contact Here.." class="form-control" required>
                                </div>	
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label class="control-label">Profile Picture</label>
                                    <input class="form-control" type="file" name="profile_pic" id="profile_pic">
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Nationality</label>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4 form-group required">
                                    <label  class="control-label">Company:</label>
                                    <select class="form-control" name="course" id="course">
                                        <%                                            ArrayList<Company> allCompanies = CompanyDAO.getAllCompanies();
                                            for (Company c : allCompanies) {
                                                int companyId = c.getId();
                                                String companyName = c.getName();
                                        %>
                                        <option value="<%= companyId%>"><%= companyName%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                    <!--select class="form-control" id="select" name="company" required>
                                    <%--
                                        ArrayList<Company> companies = loginController.getAllCompanies();
                                        for (Company c : companies) {
                                            out.println("<option value='" + c.getId() + "'>" + c.getName() + "</option>");
                                        }
                                    --%>
                                </select>-->
                                </div>	


                                <div class="col-sm-4 form-group required">
                                    <label class="control-label">Company Role</label>
                                    <input id="role" type="text" name="role" placeholder="Enter Role Here.." class="form-control" required>
                                </div>

                                <div class="col-sm-4 form-group required">
                                    <label class="control-label">Equity Percentage</label>
                                    <input id="percentage" type="text" name="percentage" placeholder="Enter Equity % Here.." class="form-control" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Required fields</label>
                                </div>	
                            </div>

                        </div>   
                        <div class = "col-lg-10 col-lg-offset-1 ">
                            <h4><strong>Choose your skills from below:</strong></h4>
                        </div>

                        <button type="submit" class="btn btn-lg btn-info">Submit</button>	
                    </form> 
                </div>
            </div>
        </div>
    </body>