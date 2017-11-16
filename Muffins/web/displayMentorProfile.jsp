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
        <%
            String mentorEmail = request.getParameter("mentorEmail");
            if (mentorEmail != null && !mentorEmail.isEmpty()) {
                mentorEmail = (String) request.getParameter("mentorEmail");
            
            User userMentor = profileController.displayUserDetails(mentorEmail);
            if (userMentor != null) {


        %>

        <div class="container">
            <div class="row">
                <div class="col-md-offset-4 col-md-8 col-lg-offset-4 col-lg-6">
                    <div class="col-sm-11 well">
                        <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                            <%  // displaying of profile picture
                                byte[] imgDataMentor = userMentor.getProfile_pic();
                                String mentorProfilePic = "";
                                if (imgDataMentor == null) {
                                    mentorProfilePic = "img/user.png";
                                } else {
                                    String imgDataBase64 = new String(Base64.getEncoder().encode(imgDataMentor));
                                    mentorProfilePic = "data:image/gif;base64," + imgDataBase64;
                                }
                                // getting mentor details
                                String mentorName = userMentor.getName();
                                int mentorCompanyID = userMentor.getCompanyid();
                                Company mentorCompany = CompanyDAO.getCompany(mentorCompanyID);
                                String mentorCompanyName = "";
                                if (mentorCompany != null) {
                                    mentorCompanyName = mentorCompany.getName();
                                }
                                mentorEmail = userMentor.getEmail();
                                int mentorContactNo = userMentor.getContactNumber();
                                String mentorContactNoStr = "N/A";
                                if (mentorContactNo != 0) {
                                    mentorContactNoStr = mentorContactNo + "";
                                }
                                String mentorType = profileController.getUserType(userMentor);
                                
                                Mentor mentor = MentorDAO.getMentorByEmail(mentorEmail);
                                String mentorPosition = mentor.getPosition();
                                if (mentorPosition != null || !mentorPosition.isEmpty()) {
                                    mentorPosition += ", ";
                                }
                                String mentorIntrodction = mentor.getIntroduction();
                                String mentorSkills = mentor.getSkills();
                            %>
                            <center><div class="profile-pic" style="background-image: url('<%=mentorProfilePic%>')" width="200px" height="200" align="center">
                                </div></center>
                            <h3 class="text-center"><%= mentorName %></h3>
                            <p class="text-center" style="font-style: italic"><%= mentorPosition %> <br> <%= mentorCompanyName %></p>

                            <p><strong>Email Address</strong>: <%= mentorEmail %></p>

                            <p><strong>Contact Number</strong>: <%= mentorContactNoStr %></p>

                            <p><strong>Type: </strong><%= mentorType %></p>

                            <p><strong>Skill(s)</strong> : <%= mentorSkills %></p>
                            <br>
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
                                        <%= cMenteeCompanyName %>
                                <%
                                    }
                                }
                            }
                        }else{
                            out.println("No Mentor is assigned currently!");
                        }
                                %>
                                <br><br>
                            <a href="viewAllMentors.jsp" class="btn btn-success center-block btn-xs" align="middle">Back to Mentor List</a>
                        </div>             
                    </div>
                </div>
            </div>                 
        </div>
    </body>
</html>
