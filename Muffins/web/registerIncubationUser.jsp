<%-- 
    Document   : registerIncubationUser.jsp
    Created on : Sep 1, 2017, 3:08:31 PM
    Author     : Xinyao
--%>

<%@page import="CONTROLLER.companyController"%>
<%@page import="MODELS.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="CONTROLLER.loginController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration</title>
        <link href="css/cosmos.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <link href="css/form.css" rel="stylesheet" type="text/css"/>
        <link href="css/registerationForm.css" rel="stylesheet" type="text/css"/>
        <script>
            function validateForm() {
//                var email = document.forms["registerUser"]["email"].value;
//                if (email.indexOf('@smu.edu.sg') == -1) {
//                    alert('Email must be an smu email address (e.g. tom.tan.2014@smu.edu.sg).');
//                    return false;
//                }

                var password = document.forms["registerUser"]["password"].value;
                if (password.length < 8 || password.length > 24) {
                    alert('password must be between 8-24 characters long!');
                    return false;
                }

                var confirmPwd = document.forms["registerUser"]["confirmPassword"].value;
                if (password !== confirmPwd) {
                    alert('Please key in your password again!');
                    return false;
                }

                var letters = /^[A-Za-z]+$/;
                var nric = document.forms["registerUser"]["nric"].value;
                if (nric.length != 9) {
                    alert('nric must be 9 characters long!');
                    return false;
                }

                if ((!nric.charAt(0).match(letters) || !nric.charAt(nric.length - 1).match(letters))
                        && (!nric.charAt(0).match(letters) && !nric.charAt(nric.length - 1).match(letters))) {
                    alert('Please enter your nric in the correct format!');
                    return false;
                }

                var shortNric = nric.substring(1, nric.length - 1);
                if (!shortNric.match(/^[0-9]+$/)) {
                    alert('Please enter your nric in the correct format!');
                    return false;
                }
            }


        </script>
    </head>
    <body>
        <div class="container">
            <h1 class="col-lg-10 col-lg-offset-1 well">User Registration Form</h1>
            <%
                ArrayList<String> degrees = new ArrayList<String>();
                degrees.add("-- select one --");
                degrees.add("Information Systems");
                degrees.add("Business");
                degrees.add("Economics");
                degrees.add("Accountancy");
                degrees.add("Law");
                degrees.add("Social Sciences");

                if (request.getAttribute("status") != null) {
                    out.println((String) request.getAttribute("status"));
                }
            %>

            <div class="col-lg-10 col-lg-offset-1 well">
                <div class="row">
                        <form action = "addUserServlet" method ="post" name="registerUser" enctype="multipart/form-data" onsubmit="return validateForm()">
                        <div class="col-sm-10 col-lg-offset-1">
                            <div class="row">
                                <input type = "hidden" name ="user_type" value ="regular_mentee">
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Full Name</label> 
                                    <input id="name" type="text" name="name" placeholder="Enter Full Name Here.." class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Email Address</label>
                                    <input id="email" type="email" name="email" placeholder="Enter Email Address Here.." class="form-control" data-fv-emailaddress-message="The value is not a valid email address" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4 form-group required">
                                    <label class="control-label">Access Code</label> check email 
                                    <input id="access_code" type="password" name="access_code" placeholder="Enter Access Code Here.." class="form-control" required>
                                </div>
                                <div class="col-sm-4 form-group required">
                                    <label class="control-label">Password</label> 8 to 24 characters
                                    <input id="password" type="password" name="password" placeholder="Enter Password Here.." class="form-control" required>
                                </div>
                                <div class="col-sm-4 form-group required">
                                    <label class="control-label">Confirm Password</label> 
                                    <input id="confirm_password" name="confirm_password" type="password" placeholder="Re-enter Password Here.." class="form-control" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">NRIC</label>
                                    <input id="nric" type="text" name="nric" placeholder="Enter NRIC Here.." class="form-control" required>
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
                            <div class="row">
                                <div class="col-sm-4 form-group required">
                                    
                                    <%
                                        int companyid = 0;
                                        String id = request.getParameter("id");
                                        if(id!=null){
                                            companyid = Integer.parseInt(id);
                                        }
                                        Company company = companyController.getCompany(companyid);
                                        String companyName = "";
                                        if(company!=null){
                                            companyName = company.getName();
                                        }
                                    %>
                                    <input type ="hidden" name ="company" value ="<%=companyid%>" >
                                    <label class="control-label">Company: <%=companyName%></label> 
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
                                    <label class="control-label">Designation</label>
                                    <input id="role" type="text" name="role" placeholder="Enter Role Here.." class="form-control" required>
                                </div>

                                <div class="col-sm-4 form-group required">
                                    <label class="control-label">Equity Percentage</label>
                                    <input id="percentage" type="text" name="percentage" placeholder="Enter Equity % Here.." class="form-control" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label  class="control-label">Only fill up the next part if you are SMU student</label>   
                                </div>


                            </div>


                            <div class="row">
                                <div class="col-sm-6 form-group ">
                                    <label  class="control-label">Primary Degree</label>
                                    <select class="form-control" name="course" id="course">
                                        <%
                                            for (String d : degrees) {
                                        %>
                                        <option value="<%= d%>"><%= d%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label class="control-label">Year of Graduation</label>
                                    <input id="yrOfGrad" type="text" name="yrOfGrad" placeholder="Enter Year Of Graduation Here.." class="form-control" >
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Required fields</label>
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

