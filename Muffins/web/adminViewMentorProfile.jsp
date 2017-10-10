<%-- 
    Document   : adminViewMentorProfile
    Created on : Oct 8, 2017, 12:51:21 AM
    Author     : Xinyao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor Profile</title>
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-10 col-lg-offset-1">
                <h1 class="page-header col-lg-10 col-lg-offset-1">Mentor Profile</h1>
                <div class="col-lg-10 well col-lg-offset-1">
                    <div class="row">
                        <div class="row">
                            <div class="col-sm-9 form-group">
                                <%  // display the image
                                    if (imgData == null) {
                                %>
                                <img src="img/user.png" width="200px" alt=""/>
                                <%
                                } else {
                                    String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                                %>
                                <img src="data:image/gif;base64,<%= imgDataBase64%>" alt="Profile Picture" />
                                <%}%>
                            </div>
                        </div>

                        <div class ="row">
                            <div class="col-sm-9 form-group">
                                <p><font size="+3">replace with user name</font></p>
                                <p><strong>Email Address</strong> : replace with user email</p>
                                <p><strong>NRIC</strong> : replace with user nric</p>
                                <p><strong>Company Name</strong> : replace with mentor company name</p>
                                <p><strong>Designation</strong> : replace with mentor designation</p>
                            </div>
                        </div>

                        <div class ="row">
                            <div class="col-sm-9 form-group">
                                <p><strong>Introduction</strong> :replace with introduction </p>
                            </div>
                        </div>

                        <div class ="row">
                            <div class="col-sm-6 form-group">
                                <p><strong>Skills</strong> : replace with user skill</p>
                                
                            </div>   
                        </div>

                        <div class="row">
                            <div class="col-sm-10 col-lg-offset-1 well form-group required">
                                <h4><strong>Bank Account Details</strong></h4>
                                <p><strong>Mail Address</strong> : replace with user mail address</p>
                                <p><strong>Account Name</strong> : replace with user account name</p>
                                <p><strong>Bank Name</strong> : replace with user bank name</p>
                                <p><strong>Swift Code</strong> : replace with user swift code</p>
                                <p><strong>Bank Address</strong> : replace with user bank address</p>

                            </div>	
                        </div>
                    </div>
                    <br>
                    <a href="adminHomepage.jsp" class="btn btn-success btn-xs">Back to Homepage</a></p>	
                </div>

            </div>
        </div>
    </div>
</div>




</body>
</html>
