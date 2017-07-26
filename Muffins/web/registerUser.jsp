<%-- 
    Document   : home
    Created on : Jun 24, 2017, 10:25:29 AM
    Author     : JEN
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="CONTROLLER.loginController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration</title>
        <%@include file="navbar.jsp" %>
        <script>
            function validateForm(){
                var email = document.forms["registerUser"]["email"].value;
                if (email.indexOf('@smu.edu.sg') == -1){
                   alert('Email must be an smu email address (e.g. tom.tan.2014@smu.edu.sg).');
                   return false;
                } 
                
                var password = document.forms["registerUser"]["password"].value;
                if (password.length < 8 || password.length > 24){
                   alert('password must be between 8-24 characters long!');
                   return false;
                }
                
                var confirmPwd = document.forms["registerUser"]["confirmPassword"].value;
                if (password !== confirmPwd){
                   alert('Please key in your password again!');
                   return false;
                }
                
                var letters = /^[A-Za-z]+$/; 
                var nric = document.forms["registerUser"]["nric"].value;
                if (nric.length != 9){
                   alert('nric must be 9 characters long!');
                   return false;
                }
                
                if((!nric.charAt(0).match(letters) || !nric.charAt(nric.length - 1).match(letters)) 
                    && (!nric.charAt(0).match(letters) && !nric.charAt(nric.length - 1).match(letters)) ){
                    alert('Please enter your nric in the correct format!');
                    return false;
                }
                
                var shortNric = nric.substring(1, nric.length-1);
                if(!shortNric.match(/^[0-9]+$/)){
                    alert('Please enter your nric in the correct format!');
                    return false;
                }
            }
            
            
        </script>
    </head>
    <body>
        <div class="container">
            <h1 class="well">User Registration Form</h1>
            <%
                if(request.getAttribute("status") != null){
                    out.println((String) request.getAttribute("status"));
                }
            %>
            <div class="col-lg-12 well">
                <div class="row">
                    <form action = "addUserServlet" method ="post" name="registerUser" onsubmit="return validateForm()">
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Full Name</label>
                                    <input id="name" type="text" name="name" placeholder="Enter Full Name Here.." class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label>Email Address</label> *sign up using smu email (e.g. tom.tan.2014@smu.edu.sg)
                                    <input id="email" type="email" name="email" placeholder="Enter Email Address Here.." class="form-control" data-fv-emailaddress-message="The value is not a valid email address" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Password</label>
                                    <input id="password" type="password" name="password" placeholder="Enter Password Here.." class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label>Confirm Password</label>
                                    <input id="confirmPassword" name="confirmPassword" type="password" placeholder="Re-enter Password Here.." class="form-control" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>NRIC</label>
                                    <input id="nric" type="text" name="nric" placeholder="Enter NRIC Here.." class="form-control" required>
                                </div>	
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Company</label> * if not found please sign up your company first

                                    <select class="form-control" id="select" name="company" required>
                                        <%
                                            HashMap<Integer, String> companies = loginController.getAllMenteeCompanyNames();
                                            Iterator it = companies.keySet().iterator();
                                            Iterator it1 = companies.values().iterator();
                                            while (it.hasNext()) {
                                                out.println("<option value='" + it.next() + "'>");
                                                while(it1.hasNext()){
                                                    out.println(it1.next() + "</option>");
                                                    break;
                                                }
                                            }
                                        %>
                                    </select>
                                </div>	
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>User Type</label>

                                    <select class="form-control" id="select" name="user_type" required>
                                        <option>light_mentee</option>
                                        <option>regular_mentee</option>
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
