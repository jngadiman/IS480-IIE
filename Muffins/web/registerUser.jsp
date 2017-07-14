<%-- 
    Document   : home
    Created on : Jun 24, 2017, 10:25:29 AM
    Author     : JEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration</title>
        <%@include file="navbar.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1 class="well">User Registration Form</h1>
            <div class="col-lg-12 well">
                <div class="row">
                    <form>
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Full Name</label>
                                    <input id="name" type="text" placeholder="Enter Full Name Here.." class="form-control">
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label>Username</label>
                                    <input id="username" type="text" placeholder="Enter Username Here.." class="form-control">
                                </div>
                            </div>					
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Email Address</label>
                                    <input id="email" type="text" placeholder="Enter Email Address Here.." class="form-control">
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label>NIRC</label>
                                    <input id="nirc" type="text" placeholder="Enter NRIC Here.." class="form-control">
                                </div>	
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Company</label> * if not found please sign up your company first

                                    <select class="form-control" id="select">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>	
                            </div>


                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Password</label>
                                    <input id="password" type="password" placeholder="Enter Password Here.." class="form-control">
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label>Confirm Password</label>
                                    <input id="confirmPassword" type="password" placeholder="Re-enter Password Here.." class="form-control">
                                </div>
                            </div>

                            <button type="button" class="btn btn-lg btn-info">Submit</button>					
                        </div>
                    </form> 
                </div>
            </div>
        </div>
    </body>
</html>
