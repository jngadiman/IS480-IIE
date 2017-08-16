<%-- 
    Document   : editPersonalProfile
    Created on : Aug 6, 2017, 12:01:37 AM
    Author     : Xinyao
--%>

<%@page import="CONTROLLER.companyController"%>
<%@page import="CONTROLLER.mentorController"%>
<%@page import="java.util.Base64"%>
<%@page import="DAO.MentorDAO"%>
<%@page import="DAO.MenteeDAO"%>
<%@page import="MODELS.Mentor"%>
<%@page import="MODELS.Mentee"%>
<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UserDAO"%>
<%@page import="MODELS.User"%>
<%@page import="MODELS.User"%>
<%@include file="protect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Personal Profile</title>
        <%@include file="navbar.jsp" %>
        <script type="text/javascript">
            var degree = document.getElementById('degree');
            var opts = degree.options.length;
            var value = document.getElementById('degreeText').value;
            function onload() {
                alert(value);
                for (var i = 0; i < opts; i++) {
                    if (degree.options[i].value == value) {
                        degree.options[i].selected = true;
                        break;
                    }
                }
            }
        </script>
    </head>
    <body>
        <%
            user = (User) session.getAttribute("user");

           //hardcoded, need to replace with session key later
            ArrayList<String> degrees = new ArrayList<String>();
            degrees.add("Information Systems");
            degrees.add("Business");
            degrees.add("Economics");
            degrees.add("Accountancy");
            degrees.add("Law");
            degrees.add("Social Sciences");
        %>
        <div class="container">
            <h1 class="col-lg-8 well col-lg-offset-2">Edit Personal Profile</h1>
            <%
                String status = (String) request.getAttribute("updateStatus");
                if (status != null && !status.isEmpty()) {
                    out.println(status);
                }
            %>
            <div class="col-lg-8 well col-lg-offset-2">

                <form action="editProfileServlet" method="post" enctype="multipart/form-data">
                                <%  // display the image
                                    byte[] imgData = user.getProfile_pic();
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
                                <p><strong>Email Address</strong> : <%= user.getEmail()%></p>
                                <p><strong>NRIC</strong> : <%= user.getNric()%></p>
                                <p><strong>User Type</strong> : <%= user.getUser_type()%></p>
                                <p><strong>Company ID</strong> : <%= user.getCompanyid()%></p>
                                <input type="hidden" name="email" value="<%= user.getEmail()%>">
                                <input type="hidden" name="password" value="<%= user.getPassword()%>">
                                <input type="hidden" name="name" value="<%= user.getName()%>">
                                <input type="hidden" name="nric" value="<%= user.getNric()%>">
                                <input type="hidden" name="user_type" value="<%= user.getUser_type()%>">
                                <input type="hidden" name="companyID" value="<%= user.getCompanyid()%>"
                                    
                                    <br/>
                                    <%
                                        if (user.getUser_type().equals("mentee")) {
                                            Mentee mentee = MenteeDAO.getMenteeByEmail(user.getEmail());
                                            
                                            String mentor_name = "";
                                            if(mentee.getMentor_email() == null || !mentee.getMentor_email().isEmpty()){
                                                Mentor myMentor = mentorController.getMentor(mentee.getMentor_email());
                                                mentor_name = myMentor.getName();
                                            }
                                            
                                            String company_name= "";
                                            if(mentee.getCompanyid() != 0){
                                                Company c = companyController.getCompany(mentee.getCompanyid());
                                                company_name = c.getName();
                                            }
                
                                    %>
                                    <input type="hidden" name="degreeText" value="<%= mentee.getDegree()%>">
                                    <p><strong>Mentor</strong> : <%= mentor_name%></p>
                                    <p><strong>Company </strong> : <%= company_name%></p>
                                    <div class="row">
                                        <div class="col-sm-6 form-group">
                                            <label>Year of Graduation</label>
                                            <input name="yearOfGrad" type="text" placeholder="Enter Year of Graduation Here.." class="form-control" value="<%= mentee.getYear_of_grad()%>" required>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6 form-group required">
                                            <label  class="control-label">Degree</label>
                                            <select class="form-control" name="degree" required>
                                                <option selected value = <%=mentee.getDegree()%> ><%=mentee.getDegree()%></option>
                                                <% for (String d : degrees) {
                                                if (!mentee.getDegree().equals(d)) {%>
                                                <option value=<%=d%>> <%=d%></option>
                                                <%      }
                                                    }
                                                %>

                                            </select>
                                        </div>
                                    </div>
                                    <input type="hidden" name="menteeType" value="<%= mentee.getMentee_type()%>">
                                    <input type="hidden" name="mentorEmail" value="<%= mentee.getMentor_email()%>">
                                    <%  } else if (user.getUser_type().equals("mentor")){
                                        Mentor mentor = MentorDAO.getMentorByEmail(user.getEmail());
                                        String company_name= "";
                                        if(mentor.getCompanyid() != 0){
                                            Company c = companyController.getCompany(mentor.getCompanyid());
                                            company_name = c.getName();
                                        }
                                    %> 
                                    <div class="row">
                                        <div class="col-sm-6 form-group">
                                            <label>Position in the Company</label>
                                            <input name="position" type="text" placeholder="Enter your position in your company" class="form-control" value="<%= mentor.getPosition()%>" required>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6 form-group">
                                            <label>Introduction</label>
                                            <textarea name="introduction" type="text" rows="4" placeholder="Enter an introduction of yourself, what industries you have been and what can you bring or teach the mentees.." class="form-control" required><%= mentor.getIntroduction()%></textarea>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <button type="submit" class="btn btn-lg btn-info">Submit</button>
                           
                            </form> 

                        </div>
                    </div>
                    </body>




                    </html>
