<%-- 
    Document   : editPersonalProfile
    Created on : Aug 6, 2017, 12:01:37 AM
    Author     : Xinyao
--%>

<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UserDAO"%>
<%@page import="MODELS.User"%>
<%@page import="MODELS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Personal Profile</title>
        <%@include file="navbar.jsp" %>
        <link href="css/stages.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/npm.js" type="text/javascript"></script>
        <link href="css/bootstrap-datepicker.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    </head>
    
     <body>
         <%
            String username = "admin@smu.edu.sg";
            User user= UserDAO.getUserByEmail(username);
            //hardcoded, need to replace with session key later
        %>
        <div class="container">
            <h1 class="well">Edit Personal Profile</h1>
            <div class="col-lg-12 well">
                
                    <form>
                        <div class="col-sm-12">
                            <div class="row">
                                <div>
                                    <h1><%= user.getName()%></h1>
                                    <h2>Email Address: <%= user.getEmail()%> </h2>
                                    <h2>NRIC: <%= user.getNric()%></h2>
                                    <h2>User Type: <%= user.getUser_type()%></h2>
                                    
                                    
                                    <label>Profile Photo</lable>
                                    </br>
                                    <form action="upload.php" method="post" enctype="multipart/form-data">
                                        Select image to upload:
                                        <input type="file" name="fileToUpload" id="fileToUpload">
                                        <input type="submit" value="Upload Image" name="submit">
                                    </form>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Experience</label>
                                    <input id="companyName" type="text" placeholder="System.out.println(user.getExperience());" class="form-control">
                                </div>
                                <%//need to have a field of experience and getExperience method%>
                            </div>	
                            <p>if (user.getClass().isInstance(Mentee.class)){</p>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Year of Graduation</label>
                                    <textarea class="form-control" rows="3" id="description" placeholder="Enter Year of Graduation Here.."></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Interested Industry</label>
                                    <div class="row">
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

                                </div>
                            </div>
                            <p>} else{</p> 
                            <div class="col-sm-6 form-group">
                                <label>Industries Worked Before</label>
                                <input id="past-industries" type="text" placeholder="Enter industries that you have worked before.." class="form-control">
                            }
                            </div>	
                        </div>
                            <button type="submit" class="btn btn-lg btn-info">Submit</button>
                    </form> 
                
            </div>
        </div>
    </body>
    
   
        

</html>
