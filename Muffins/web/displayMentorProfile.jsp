<%-- 
    Document   : displayProfile
    Created on : Aug 16, 2017, 9:49:40 AM
    Author     : Jennefer Ngadiman
--%>
<%@page import="CONTROLLER.profileController"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="CONTROLLER.mentorController"%>
<%@page import="java.util.Base64"%>
<%@page import="DAO.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MODELS.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sidenav.jsp" %>
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
        .profile-pic label {
            display: inline-block;
            padding-top: 10em;
            padding-bottom: 1.5em;
            cursor: pointer;
        }
        #upload-photo {
            opacity: 0;
            position: absolute;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Mentor Profile</title>
    </head>
    <body>
        <%            String mentorEmail = request.getParameter("mentorEmail");
            System.out.println("displayMentorProfile get mentorEmail1: " + mentorEmail);
            User currentUserMentor = null;
            // if the mentorEmail is not null
            // user accessed dMP through mentors list
            // set currentUserMentor to the selected mentor
            if (mentorEmail != null) {
                currentUserMentor = profileController.displayUserDetails(mentorEmail);
            }
            // if mentorEmail is null
            // user accessed dMP through mentee homepage
            // check if the mentee currently have a mentor
            if (mentorEmail == null) {
                String cMenteeMentorEmail = "";
                if (userType.contains("mentee")) {
                    String cMenteeEmail = user.getEmail();
                    Mentee currentMentee = MenteeDAO.getMenteeByEmail(cMenteeEmail);
                    cMenteeMentorEmail = currentMentee.getMentor_email();
                    System.out.println("displayMentorProfile cMenteeMentorEmail: " + cMenteeMentorEmail);
                }
                // if cMenteeMentorEmail is null, mentee currently doesn't have mentor
                // if cMenteeMentorEmail is not null, mentee currently have mentor
                // set that mentor to currentUserMentor
                if (cMenteeMentorEmail != null) {
                    currentUserMentor = profileController.displayUserDetails(cMenteeMentorEmail);
                }
                System.out.println("displayMentorProfile currentUserMentor: "+ cMenteeMentorEmail);
            }
            //System.out.println("displayMentorProfile currentUserMentor: "+ cMenteeMentorEmail);
            // if currentUserMentor is not null, display mentor details
            // else redirect back to mentee home page
            if (currentUserMentor != null) {
                System.out.println("displayMentorProfile i come into here");
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-offset-4 col-md-8 col-lg-offset-4 col-lg-6">
                    <div class="col-sm-11 well">
                        <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                            <%  // displaying of profile picture
                                byte[] imgDataMentor = currentUserMentor.getProfile_pic();
                                String mentorProfilePic = "";
                                if (imgDataMentor == null) {
                                    mentorProfilePic = "img/user.png";
                                } else {
                                    String imgDataBase64 = new String(Base64.getEncoder().encode(imgDataMentor));
                                    mentorProfilePic = "data:image/gif;base64," + imgDataBase64;
                                }
                                // getting mentor details
                                // mentor name
                                String mentorName = currentUserMentor.getName();
                                // mentor company, company name
                                int mentorCompanyID = currentUserMentor.getCompanyid();
                                Company mentorCompany = CompanyDAO.getCompany(mentorCompanyID);
                                String mentorCompanyName = "";
                                if (mentorCompany != null) {
                                    mentorCompanyName = mentorCompany.getName();
                                }
                                // mentor email
                                mentorEmail = currentUserMentor.getEmail();
                                // mentor contact number
                                int mentorContactNo = currentUserMentor.getContactNumber();
                                String mentorContactNoStr = "N/A";
                                if (mentorContactNo != 0) {
                                    mentorContactNoStr = mentorContactNo + "";
                                }
                                // mentor type
                                String mentorType = profileController.getUserType(currentUserMentor);

                                // mentor position
                                Mentor mentor = MentorDAO.getMentorByEmail(mentorEmail);
                                String mentorPosition = mentor.getPosition();
                                System.out.println("displayMentorProfile mentorPosition: " + mentorPosition);
                                if (mentorPosition != null && !mentorPosition.isEmpty()) {
                                    mentorPosition += ", ";
                                }
                                if (mentorPosition == null) {
                                    mentorPosition = "";
                                }
                                // mentor introduction
                                String mentorIntrodction = mentor.getIntroduction();
                                if (mentorIntrodction == null || mentorIntrodction.isEmpty()) {
                                    mentorIntrodction = "";
                                }
                                // mentor skills
                                String mentorSkills = mentor.getSkills();
                            %>
                            <center><div class="profile-pic" style="background-image: url('<%=mentorProfilePic%>')" width="200px" height="200" align="center">
                                </div></center>
                            <h3 class="text-center"><%= mentorName%><br>
                                <%= mentorPosition%><%= mentorCompanyName%></h3>
                            <p class="text-center" style="font-style: italic"><%= mentorIntrodction%></p>

                            <p><strong>Email Address</strong>: <%= mentorEmail%></p>

                            <p><strong>Contact Number</strong>: <%= mentorContactNoStr%></p>

                            <p><strong>Type: </strong><%= mentorType%></p>

                            <p><strong>Skill(s)</strong>: <%= mentorSkills%></p><br>
                            <%
                                if (userType.contains("admin")) {
                                    ArrayList<Relationship> mentorRS = RelationshipDAO.getAllRelationshipsForMentor(mentorEmail);
                                    ArrayList<Integer> currentMentees = new ArrayList<Integer>();
                                    ArrayList<Integer> pastMentees = new ArrayList<Integer>();
                                    if (mentorRS != null || !mentorRS.isEmpty()) {
                                        for (Relationship rs : mentorRS) {
                                            String rsStatus = rs.getStatus();
                                            if (rsStatus.contains("assigned")) {
                                                currentMentees.add(rs.getCompanyID());
                                            }
                                            if (rsStatus.contains("over")) {
                                                pastMentees.add(rs.getCompanyID());
                                            }
                                        }
                                    }
                            %>
                            <p><strong>Current Relationships:</strong>
                                <%
                                    for (int i = 0; i < currentMentees.size(); i++) {
                                        int cCompanyID = currentMentees.get(i);
                                        Company cMenteeCompany = CompanyDAO.getCompany(cCompanyID);
                                        String cMenteeCompanyName = "";
                                        if (cMenteeCompany != null) {
                                            cMenteeCompanyName = cMenteeCompany.getName();
                                        }
                                %>
                                <%= cMenteeCompanyName%>
                                <%
                                    }
                                    if (userType.equals("admin_im")) {
                                %>
                            <div class="row">
                                <br/>
                                <div class="col-sm-6">
                                    <a href="" class="btn btn-success center-block btn-sm" align="middle">Edit Mentor Profile</a>
                                </div>
                                <div class="col-sm-6">
                                    <a href="" class="btn btn-danger center-block btn-sm" align="middle">Delete Mentor Profile</a>
                                </div><br/>
                                </div>
                            <%
                                    }
                                }
                                if (userType.contains("mentee")) {
                                    String currentUserMenteeEmail = user.getEmail();
                                    Mentee currentUserMentee = MenteeDAO.getMenteeByEmail(currentUserMenteeEmail);
                                    String currentUserMenteeMentorEmail = currentUserMentee.getMentor_email();
                                    if (currentUserMenteeMentorEmail != null) {
                                        if (currentUserMenteeMentorEmail.equals(mentorEmail)) {
                            %>
                            <button class="btn btn-success center-block btn-xs" align="middle">Current Mentor</button>
                            <%
                                            }
                                        }
                                    }
                                }
                                if (currentUserMentor == null) {

                                    request.setAttribute("currentUserMentorResult", "Currently no assigned mentor!");
                                    request.getRequestDispatcher("home.jsp").forward(request, response);
                                }
                            %>
                            <br>
                            <a href="viewAllMentors.jsp" class="btn btn-primary center-block btn-sm" align="middle">Back to Mentor List</a>
                        </div>             
                    </div>
                </div>
            </div>                 
        </div>
    </body>
</html>
