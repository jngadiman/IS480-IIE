<%-- 
    Document   : mentorRegistration
    Created on : Oct 7, 2017, 10:38:17 AM
    Author     : Xinyao
--%>

<%@page import="java.util.HashMap"%>
<%@page import="DAO.CompanyDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp" %>
<%@include file="sidenav.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register for New Mentor</title>
        <link href="css/registerationForm.css" rel="stylesheet" type="text/css"/>
        <link href="css/form.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>
        <%    HashMap<String, String> hm = (HashMap<String, String>) request.getAttribute("errorMessages");
            String nameErr = "";
            String email = "";
            String nric = "";

            if (hm != null && !hm.isEmpty()) {
                if (hm.containsKey("name")) {
                    nameErr = hm.get("name");
                }

                if (hm.containsKey("email")) {
                    email = hm.get("email");
                }
                if (hm.containsKey("nric")) {
                    nric = hm.get("nric");
                }

            }
        %>
        <div class="container">
            <div class="col-lg-10 col-lg-offset-3">
                <h1 class="page-header">Mentor Registration Form</h1>
                <%
                    String registerStatus = (String) request.getAttribute("status");
                    if (registerStatus != null && !registerStatus.isEmpty()) {
                        if (registerStatus.equals("Success!")) {
                            out.println("<h5 class='col-lg-12'>Mentor Registration is successful! Login details will be sent to the mentor's email directly. </h5>");
                        } else {
                            out.println("<font color = 'red' ><h5 class='col-lg-12'> " + registerStatus + "</h5></font>");
                        }
                    }
                %>
                <div class="col-lg-12 well">
                    <div class="row">
                        <form action = "mentorRegistrationServlet" method ="post" name="registerUser" enctype="multipart/form-data">
                            <div class="col-sm-12">

                                <div class="row">
                                    <div class="col-sm-6 form-group required">
                                        <h3 class="page-header"><strong>Mentor Type</strong></h3>
                                        <select class="form-control" name="user_type" required>
                                            <option selected value = "mentor_im" >Incubation Manager</option>
                                            <option selected value = "mentor_vc" >Venture Capitalist</option>
                                            <option selected value = "mentor_ip" >Industry Professional</option>
                                            <option selected value = "mentor_entre" >Entrepreneur</option>
                                        </select> 
                                    </div>
                                </div>
                                <h3 class="page-header"><strong>Personal Information</strong></h3>
                                <div class="row">

                                    <div class="col-sm-6 form-group required">
                                        <label class="control-label">Full Name</label> 
                                        <font color = red >  <%=nameErr%></font></br>
                                        <input id="name" type="text" name="name" placeholder="Enter Full Name Here.." class="form-control" required>

                                    </div>
                                    <div class="col-sm-6 form-group required">
                                        <label class="control-label">Email Address</label>
                                        <font color = red >  <%=email%></font></br>
                                        <input id="email" type="email" name="email" placeholder="Enter Email Address Here.." class="form-control" data-fv-emailaddress-message="The value is not a valid email address" required>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-6 form-group required">
                                        <label class="control-label">NRIC</label>
                                        <font color = red >  <%=nric%></font></br>
                                        <input id="nric" type="text" name="nric" placeholder="Enter NRIC Here.." class="form-control" required>
                                        <link href="css/mentorRegistration.css" rel="stylesheet" type="text/css"/>
                                    </div>	
                                    <div class="col-sm-6 form-group required">
                                        <label class="control-label">Contact Number</label>
                                        <input id="contact" type="text" name="contact" onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));" placeholder="Enter Contact Here.." class="form-control" required>
                                    </div>	
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <label class="control-label">Profile Picture</label>
                                        <input class="form-control" type="file" name="profile_pic" id="profile_pic" accept="image/*">
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
                                        <input id="companyName" type="text" name="companyName" placeholder="Enter Company Name Here.." class="form-control" required>

                                    </div>	
                                    <div class="col-sm-6 form-group required">
                                        <label class="control-label">Designation</label>
                                        <input id="designation" type="text" name="designation" placeholder="Enter Your Designation Here.." class="form-control" required>
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
                                    <input id="contact" type="text" name="accountNo" onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));" placeholder="Enter Account Number Here.." class="form-control" required>
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
                                <div class="col-sm-12 form-group required">
                                    <label class="control-label">Required Fields</label>
                                </div>
                                <button type="submit" class="btn btn-success btn-s center-block text-center">Create</button>	
                        
                    </div>
                                    </form>
                </div>




            </div>
        </div>

    </div>



</body>
</html>