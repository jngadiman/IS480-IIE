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
                                <%// }%>
                            </div>   
                        </div>
                    </div>
                    <br>
                    <a href="adminEditMentorProfile.jsp" class="btn btn-success btn-xs">Edit</a></p>	
                </div>

            </div>
        </div>
    </div>
</div>




</body>
</html>
