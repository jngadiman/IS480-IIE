<%-- 
    Document   : viewMentorProfile
    Created on : Jul 27, 2017, 2:30:40 AM
    Author     : Xinyao
--%>

<%@page import="CONTROLLER.profileController"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="CONTROLLER.mentorController"%>
<%@page import="java.util.Base64"%>
<%@page import="DAO.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MODELS.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp" %>
<!DOCTYPE html>
<html>
    <style>
        .profile-pic {
            border-radius: 50%;
            height: 200px;
            width: 200px;
            background-size: cover;
            background-position: center;
            background-blend-mode: multiply;
            vertical-align: middle;
            text-align: center;
            color: transparent;
            transition: all .3s ease;
            text-decoration: none;
        }

        .profile-pic:hover {
            background-color: rgba(0,0,0,.5);
            z-index: 10000;
            color: #fff;
            transition: all .3s ease;
            text-decoration: none;
        }
        #upload-photo {
            opacity: 0;
            position: absolute;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Profile</title>
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <%            user = (User) session.getAttribute("user");
            user = profileController.getUser(user.getEmail());
            session.setAttribute("user", user);
        %>

        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-sm-offset-3">
                    <div class="col-lg-8 well">
                        <div class ="row">
                            <div class="col-lg-12" align="center">
                                <%  // getting variables to display
                                    // profile picture
                                    String profilePic = "";
                                    if (imgData == null) {
                                        profilePic = "img/user.png";
                                    } else {
                                        String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                                        profilePic = "data:image/gif;base64," + imgDataBase64;
                                    }
                                    // user email
                                    String email = user.getEmail();
                                    System.out.println("viewPersonalProfile " + email);
                                    // user name
                                    String name = user.getName();
                                    if (name == null) {
                                        name = email;
                                    }
                                    System.out.println("viewPersonalProfile " + name);
                                    // user nric
                                    String nric = user.getNric();
                                    if (nric == null) {
                                        nric = "";
                                    }
                                    System.out.println("viewPersonalProfile " + nric);
                                    // user contact
                                    int contactNo = user.getContactNumber();
                                    String contactNoStr = "";
                                    if (contactNo != 0) {
                                        contactNoStr = contactNo + "";
                                    }
                                    System.out.println("viewPersonalProfile " + contactNoStr);
                                    // user nationality
                                    String nationality = user.getNationality();
                                    if (nationality == null) {
                                        nationality = "";
                                    }
                                    System.out.println("viewPersonalProfile " + nationality);
                                    // user company position
                                    String position = user.getRole();
                                    if (position == null) {
                                        if (userType.contains("mentee")) {
                                            position = "Founder";
                                        } else {
                                            position = "";
                                        }
                                    }
                                    System.out.println("viewPersonalProfile position: " + position);
                                    // user company
                                    int companyID = user.getCompanyid();
                                    Company company = CompanyDAO.getCompany(companyID);
                                    String companyName = company.getName();
                                    System.out.println("viewPersonalProfile company: " + company);

                                    System.out.println("viewPersonalProfile user: " + user);

                                    // other details
                                    String password = user.getPassword();
                                %>
                                <div class="profile-pic" style="background-image: url('<%=profilePic%>')" width="200px">
                                </div>
                                <h3><%= name%></h3>
                                <h4 style="font-style:italic"><%= companyName%>, <%= position%></h4>
                            </div>
                        </div><br/>
                        <div class='row'>
                            <div class="col-sm-6 form-group">
                                <label class="control-label">NRIC</label>: <%= nric%></p>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label class="control-label">Nationality</label>: <%= nationality%>
                            </div>
                        </div>
                        <div class='row'>
                            <div class="col-sm-6 form-group">
                                <label class="control-label">Email</label>: <%= email%></p>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label  class="control-label">Contact Number</label>: <%= contactNoStr%>
                            </div>
                        </div>
                        <%
                            if (userType.contains("mentee")) {
                                Mentee currentMentee = MenteeDAO.getMenteeByEmail(email);
                                System.out.println("viewPersonalProfile currentMentee: " + currentMentee);
                                // get degree
                                String degree = currentMentee.getDegree();
                                System.out.println("viewPersonalProfile degree: " + degree);
                                // get year of grad
                                int gradYear = currentMentee.getYear_of_grad();
                                System.out.println("viewPersonalProfile gradYear: " + gradYear);
                                // get mentor email
                                String cMentorEmail = currentMentee.getMentor_email();
                                String cMentorName = "";
                                if (cMentorEmail == null) {
                                    cMentorEmail = "";
                                }
                                if (cMentorEmail != null && !cMentorEmail.isEmpty()) {
                                    Mentor cMentor = MentorDAO.getMentorByEmail(cMentorEmail);
                                    cMentorName = cMentor.getName();
                                }
                        %>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <label class="control-label">Current Mentor</label>: <%= cMentorName%>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <label class="control-label">Degree</label>: <%= degree%>
                            </div>

                            <div class="col-sm-6 form-group required">
                                <label  class="control-label">Year of Graduation</label>: <%= gradYear%>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <%
                            if (userType.contains("mentor")) {
                                Mentor currentMentor = MentorDAO.getMentorByEmail(user.getEmail());
                                // mentor introduction
                                String mentorIntroduction = currentMentor.getIntroduction();
                                // mentor type
                                String mentorType = profileController.getUserType(currentMentor);
                                // mentor skills
                                String mentorSkills = currentMentor.getSkills();
                                // getting mentor's mentees
                                ArrayList<Mentee> currentMentorMentees = new ArrayList<Mentee>();
                                currentMentorMentees = MenteeDAO.getMenteeByMentor(email);
                        %>

                        <div class="row">
                            <div class="col-sm-12">
                                <label class="control-label">Mentor Type</label>: <%= mentorType%>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <label class="control-label">Mentor Skills</label>: <%= mentorSkills%>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <p><strong>Introduction</strong>: <br> <%= mentorIntroduction%></p>
                                <br>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <br/>
                        <div class="col-lg-12" align="center"><a href="editPersonalProfile.jsp" class="btn btn-sm btn-success">Edit Profile</a></div>
                    </div>    
                </div>
            </div>
        </div>                 
    </body>

</html>
