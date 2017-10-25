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
        <link href="css/form.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>
        <div class="container">
            <div class="col-lg-10 col-lg-offset-1">
                <h1 class="page-header col-lg-12">Mentor Registration Form</h1>
                <div class="col-lg-12 well">
                    <div class="row">

                        <form action = "addUserServlet" method ="post" name="registerUser" onsubmit="return validateForm()">
                            <div class="col-sm-12">
                                <h3 class="page-header"><strong>Personal Information</strong></h3>
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
                                        <%@include file="nationality.jsp" %>

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <h3 class="page-header"><strong>Career Information</strong></h3>

                                <div class="row">
                                    <div class="col-sm-6 form-group required">
                                        <label class="control-label">Company Name</label>
                                        <input id="nric" type="text" name="companyName" placeholder="Enter Company Name Here.." class="form-control" required>

                                    </div>	
                                    <div class="col-sm-6 form-group required">
                                        <label class="control-label">Designation</label>
                                        <input id="contact" type="text" name="designation" placeholder="Enter Your Designation Here.." class="form-control" required>
                                    </div>	
                                    <div class = "col-lg-12 form-group required">
                                        <label><strong>Skills:</strong></label>
                                        <textarea rows="4" cols="50" id="skills" maxlength="200000" type="text" name="skills" placeholder="Enter Your Skills here, Break Each Skill with ', ' in between (E.g., 'Software Engineering, Project Management')" class="form-control" required></textarea>

                                    </div>
                                    <div class="col-lg-12 form-group required">
                                        <label><strong>Introduction (past companies, past working experience, etc.):</strong></label>
                                        <textarea rows="4" cols="50" id="introduction" maxlength="200000" type="text" name="introduction" placeholder="Enter Introduction about Yourself Here.." class="form-control" required></textarea>
                                        <!--select class="form-control" id="select" name="company" required>
                                        <%--
                                            ArrayList<Company> companies = loginController.getAllCompanies();
                                            for (Company c : companies) {
                                                out.println("<option value='" + c.getId() + "'>" + c.getName() + "</option>");
                                            }
                                        --%>
                                    </select>-->
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 form-group required">
                                <h3 class="page-header"><strong>Bank Account Information</strong></h3>

                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Mail Address</label>
                                    <input id="nric" type="text" name="mailAddress" placeholder="Enter Your Mail Address Here.." class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Account Name</label>
                                    <input id="contact" type="text" name="accountName" placeholder="Enter Account Name Here.." class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Account No.</label>
                                    <input id="contact" type="text" name="accountNo" placeholder="Enter Account Number Here.." class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Bank Name</label>
                                    <input id="contact" type="text" name="bankName" placeholder="Enter Bank Name Here.." class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Swift Code</label>
                                    <input id="contact" type="text" name="swiftCode" placeholder="Enter Swift Code Here.." class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Bank Address</label>
                                    <input id="contact" type="text" name="bankAddress" placeholder="Enter Bank Address Here.." class="form-control" required>
                                </div>
                            </div>	
                    </div>

                    <div class="col-sm-12 form-group required">
                        <label class="control-label">Required Fields</label>
                    </div>	
                </div>
                <a href="adminViewMentorProfile.jsp" class="btn btn-success btn-xs">Create Now!</a></p>	
            </div>



        </div>   



    </form> 

</body>