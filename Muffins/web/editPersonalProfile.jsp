<%-- 
    Document   : editPersonalProfile
    Created on : Aug 6, 2017, 12:01:37 AM
    Author     : Xinyao
--%>

<%@page import="CONTROLLER.menteeController"%>
<%@page import="CONTROLLER.profileController"%>
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
<link href="css/editPersonalProfile.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Personal Profile</title>
        <%@include file="sidenav.jsp" %>
        
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


    <%            User currentUser = (User) session.getAttribute("user");
        User user1 = profileController.getUser(user.getEmail());;
        session.setAttribute("user", user1);

        Mentee mentee1 = (Mentee) session.getAttribute("mentee");
        Mentee mentee2 = menteeController.getMentee(mentee1.getEmail());
        session.setAttribute("mentee", mentee2);

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
        <%
            String status = (String) request.getAttribute("updateStatus");
            if (status != null && !status.isEmpty()) {
                out.println("<div align='center'>" + status + "</div>");
            }
        %>
        <div class="col-sm-8 col-sm-offset-3">
            <h2 class="page-header">Edit Personal Profile</h2>
            <div class="col-lg-12 well">
                <form action="editProfileServlet" method="post" enctype="multipart/form-data">
                    <%  // display the image
                        if (imgData == null) {
                    %>

                    <div class="col-sm-6 col-sm-offset-3">
                        
                        <img src="img/user.png" class="img-responsive center-block" width="200px" alt=""/>
                        <div class="overlay">
                            <div class="text">
                                Change Profile Picture
                                <br>
                                <input type="file" name="profilePhoto">
                            </div>
                            
                        </div>
                    </div>
                       
                    <%
                    } else {
                        String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                    %>

                    <div class="col-sm-6 col-sm-offset-3">
                        
                        <img src="data:image/gif;base64,<%= imgDataBase64%>" class="img-responsive center-block" alt="Profile Picture" width="200px"/>
                        <div class="overlay">
                            <div class="text">Change Profile Picture</div>
                            
                        </div>
                    </div>
                       

                    <%}%>

                    <div class="col-sm-4 col-sm-offset-4">
                        <h3 class='text-center'><%= user.getName()%></h3>
                    </div>
                    

                    <div class='row'>
                        <div class="col-sm-6 form-group">
                            <label>Email Address</label>
                            <input name="email" type="text" placeholder="Enter Email Address.." class="form-control" value="<%= user.getEmail()%>" required>

                        </div>

                        <div class="col-sm-6 form-group">
                            <label>NRIC</label>
                            <input name="email" type="text" placeholder="Enter NIRC.." class="form-control" value="<%= user.getNric()%>" required>

                        </div>
                    </div>

                    <input type="hidden" name="email" value="<%= user.getEmail()%>">
                    <input type="hidden" name="password" value="<%= user.getPassword()%>">
                    <input type="hidden" name="name" value="<%= user.getName()%>">
                    <input type="hidden" name="nric" value="<%= user.getNric()%>">
                    <input type="hidden" name="user_type" value="<%= user.getUser_type()%>">
                    <input type="hidden" name="companyID" value="<%= user.getCompanyid()%>">
                    <input type="hidden" name="nationality" value="<%= user.getNationality()%>">
                    <br/>
                    <%
                        if (user.getUser_type().equals("regular_mentee")) {
                            Mentee mentee = MenteeDAO.getMenteeByEmail(user.getEmail());

                            String mentor_name = "";
                            if (mentee.getMentor_email() != null && !mentee.getMentor_email().isEmpty()) {
                                Mentor myMentor = mentorController.getMentor(mentee.getMentor_email());
                                mentor_name = myMentor.getName();
                            }

                            String company_name = "";
                            if (mentee.getCompanyid() != 0) {
                                Company c = companyController.getCompany(mentee.getCompanyid());
                                company_name = c.getName();
                            }

                    %>
                    <input type="hidden" name="degreeText" value="<%= mentee.getDegree()%>">
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label>Contact Number</label>
                            <input name="contactNo" type="text" placeholder="Enter Contact Number.." class="form-control" value="<%=mentee.getContactNumber()%>" required>

                        </div>
                        <div class="col-sm-6 form-group">
                            <p><strong>Nationality</strong> : <%@include file="nationality.jsp" %>
                            </p></div>

                    </div>

                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label>Company Position</label>
                            <input name="role" type="text" placeholder="Enter Company Position.." class="form-control" value="<%= mentee.getRole()%>" required>

                        </div>

                    </div>
                    <div class='row'>

                        <div class="col-sm-6 form-group">
                            <p><strong>Company </strong> : <%= company_name%></p>
                        </div>
                        <div class="col-sm-6 form-group">
                            <p><strong>Mentor </strong> : <%= mentor_name%></p>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label>Year of Graduation</label>
                            <input name="yearOfGrad" type="text" placeholder="Enter Year of Graduation Here.." class="form-control" value="<%= mentee.getYear_of_grad()%>" required>
                        </div>

                        <div class="col-sm-6 form-group required">
                            <label  class="control-label">Degree</label>
                            <select class="form-control" name="degree" required>
                                <option selected value = <%=mentee.getDegree()%> ><%=mentee.getDegree()%></option>
                                <% for (String d : degrees) {
                                        if (!mentee.getDegree().equals(d)) {%>
                                <option value='<%=d%>'><%=d%></option>
                                <%      }
                                    }
                                %>

                            </select>
                        </div>
                    </div>
                    <input type="hidden" name="userType" value="<%= user.getUser_type()%>">
                    <input type="hidden" name="mentorEmail" value="<%= mentee.getMentor_email()%>">
                    <%  } else if (user.getUser_type().equals("mentor")) {
                        Mentor mentor = MentorDAO.getMentorByEmail(user.getEmail());
                        String company_name = "";
                        if (mentor.getCompanyid() != 0) {
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
                    <button type="submit" class="btn btn-md btn-success center-block">Save</button>

                </form> 

            </div>
        </div>
    </div>
</body>




</html>
