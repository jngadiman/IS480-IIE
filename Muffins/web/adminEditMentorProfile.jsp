<%-- 
    Document   : adminEditMentorProfile
    Created on : Oct 8, 2017, 1:49:36 AM
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
                        <form action="editProfileServlet" method="post" enctype="multipart/form-data">
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
                        <br/>
                        <br/>
                        Select image to upload:
                        <input type="file" name="profilePhoto">

                        <h2><%= user.getName()%></h2>
                        <div class='row'>
                            <div class="col-sm-6 form-group">
                                <label>Email Address</label>
                                <input name="email" type="text" placeholder="Enter Email Address.." class="form-control" value="<%= user.getEmail()%>" required>

                            </div>
                        </div>
                        <p><strong>NRIC</strong> : <%= user.getNric()%></p>
                        <input type="hidden" name="email" value="<%= user.getEmail()%>">
                        <input type="hidden" name="password" value="<%= user.getPassword()%>">
                        <input type="hidden" name="name" value="<%= user.getName()%>">
                        <input type="hidden" name="nric" value="<%= user.getNric()%>">
                        <input type="hidden" name="userType" value="<%= user.getUserType()%>">
                        <input type="hidden" name="mentorEmail" value="replace with mentor email">
                        <%  //} else if (user.getUser_type().equals("mentor")) {
                            //Mentor mentor = MentorDAO.getMentorByEmail(user.getEmail());
                            //String company_name = "";
                            //if (mentor.getCompanyid() != 0) {
                                //Company c = companyController.getCompany(mentor.getCompanyid());
                                //company_name = c.getName();
                            //}
                        %> 
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <label>Designation</label>
                                <input name="position" type="text" placeholder="Enter your designation in your company" class="form-control" value="replace with mentor designation" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <label>Introduction</label>
                                <textarea name="introduction" type="text" rows="4" placeholder="Enter an introduction of yourself, what industries you have been and what can you bring or teach the mentees.." class="form-control" required>replace with introduction</textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <button type="submit" class="btn btn-md btn-success center-block">Save</button>					
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
