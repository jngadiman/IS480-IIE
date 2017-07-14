<%-- 
    Document   : registerCompany
    Created on : Jul 15, 2017, 12:25:35 AM
    Author     : JEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company Registration</title>
        <%@include file="navbar.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1 class="well">Company Registration Form</h1>
            <div class="col-lg-12 well">
                <div class="row">
                    <form>
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Company Name</label>
                                    <input id="companyName" type="text" placeholder="Enter Company Name Here.." class="form-control">
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label>Industry</label> 

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
                                    <label>Company Vision</label>
                                    <input id="vision" type="text" placeholder="Enter Company Vision Here.." class="form-control">
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label>Company Mission</label>
                                    <input id="mission" type="text" placeholder="Enter Company Mission Here.." class="form-control">
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Company Description</label>
                                    <textarea class="form-control" rows="3" id="description" placeholder="Enter Company Description Here.."></textarea>
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
