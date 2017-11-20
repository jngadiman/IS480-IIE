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
<head>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <link href="css/editPersonalProfile.css" rel="stylesheet" type="text/css"/>
</head>
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
        #profilePhoto {
            opacity: 0;
            position: absolute;
        }
    </style>
    <body>
        <meta http-eqouiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Personal Profile</title>
        <%@include file="sidenav.jsp" %>
        <%            /* User currentUser = (User) session.getAttribute("user");
            User user1 = profileController.getUser(user.getEmail());;
            session.setAttribute("user", user1);

            Mentee mentee1 = (Mentee) session.getAttribute("mentee");
            Mentee mentee2 = menteeController.getMentee(mentee1.getEmail());
            session.setAttribute("mentee", mentee2); */
            // hardcoded, need to replace with session key later
            ArrayList<String> degrees = new ArrayList<String>();
            degrees.add("Information Systems");
            degrees.add("Business");
            degrees.add("Economics");
            degrees.add("Accountancy");
            degrees.add("Law");
            degrees.add("Social Sciences");
        %>
        <div class="container">
            <div class="col-sm-8 col-sm-offset-3">
                <h2 class="page-header">Edit Personal Profile</h2>
                <%                String status = (String) request.getAttribute("updateStatus");
                    if (status != null && !status.isEmpty()) {
                %>

                <div class="alert alert-dismissible alert-success">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <%=status%>
                </div>
                <%
                    }
                %>
                <div class="col-lg-12 well">
                    <form action="editProfileServlet" method="post" enctype="multipart/form-data">
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
                            System.out.println("editPersonalProfile: " + email);
                            // user name
                            String name = user.getName();
                            if (name == null) {
                                name = email;
                            }
                            System.out.println("editPersonalProfile: " + name);
                            // user nric
                            String nric = user.getNric();
                            if (nric == null) {
                                nric = "";
                            }
                            System.out.println("editPersonalProfile: " + nric);
                            // user contact
                            int number = user.getContactNumber();
                            String numStr = "";
                            if (number != 0) {
                                numStr = number + "";
                            }
                            System.out.println("editPersonalProfile: " + numStr);
                            // user nationality
                            String nationality = user.getNationality();
                            if (nationality == null) {
                                nationality = "";
                            }
                            System.out.println("editPersonalProfile: " + nationality);
                            // user company position
                            String position = user.getRole();
                            if (position == null) {
                                if (userType.contains("mentee")) {
                                    position = "Founder";
                                } else {
                                    position = "";
                                }
                            }
                            System.out.println("editPersonalProfile position: " + position);
                            // user company
                            int companyID = user.getCompanyid();
                            Company company = CompanyDAO.getCompany(companyID);
                            String companyName = company.getName();
                            System.out.println("editPersonalProfile company: " + company);

                            // user equity percentage
                            int equityPercentage = user.getEquityPercentage();
                            System.out.println("editPersonalProfile percentage: " + equityPercentage);

                            // if user is mentor, get mentor's mentees
                            if (userType.contains("mentor")) {
                                ArrayList<Mentee> currentMentorMentees = new ArrayList<Mentee>();
                                currentMentorMentees = MenteeDAO.getMenteeByMentor(email);
                            }
                            System.out.println("editPersonalProfile user: " + user);
                            // other details
                            String password = user.getPassword();
                        %>
                        <%-- forms to pass in data to servlet --%>
                        <input type="hidden" name="email" value="<%= email%>">
                        <input type="hidden" name="password" value="<%= password%>">
                        <input type="hidden" name="user_type" value="<%= userType%>">
                        <input type="hidden" name="companyID" value="<%= companyID%>">

                        <%-- displaying of profile picture --%>
                        <div class="col-lg-12" align="center">
                            <div class="profile-pic" style="background-image: url('<%=profilePic%>')" width="200px" id="displayPic">
                                <label for="profilePhoto">Change Photo</label>
                                <input type="file" name="profilePhoto" id="profilePhoto">
                            </div>
                            <script>
                                document.getElementById("profilePhoto").oninput = function () {
                                    previewPhoto()
                                };
                                function previewPhoto() {
                                    var x = document.getElementById("profilePhoto").value;
                                    var y = x.replace(/\\/g, "/");
                                    document.getElementById("displayPic").style.backgroundImage = "url('"+y+"')";
                                }
                            </script>
                        </div>
                        <div class="col-lg-12" align="center">
                            <h3 id="displayName"><%=name%></h3>
                            <h4 style="font-style: italic"><%=email%></h4><br>
                        </div><br/><br/><br/>
                        <div class='row'>
                            <div class="col-sm-6 form-group">
                                <label>Name</label>
                                <input type="text" id ="name" name="name" placeholder="Enter Name.." class="form-control" value="<%=name%>" required>
                                <script>
                                    document.getElementById("name").onkeyup = function () {
                                        liveUpdate()
                                    };
                                    function liveUpdate() {
                                        var x = document.getElementById("name");
                                        document.getElementById("displayName").innerHTML = x.value;
                                    }
                                </script>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label>NRIC</label>
                                <input name="nric" type="text" placeholder="Enter NIRC.." class="form-control" value="<%= nric%>" required>

                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <label>Contact Number</label>
                                <input name="contactNo" type="text" placeholder="Enter Contact Number.." class="form-control" value="<%=numStr%>" onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));" required>

                            </div>
                            <div class="col-sm-6 form-group">
                                <p><strong>Nationality</strong></p>
                                <%@include file="nationality.jsp" %>
                            </div>
                        </div>
                        <%                            // if user is mentee, get other mentee details
                            if (userType.contains("regular_mentee")) {
                                Mentee currentMentee = MenteeDAO.getMenteeByEmail(email);
                                
                                //out.println("editPersonalProfile currentMentee: " + currentMentee.getName());
                                // get degree
                                String degree = currentMentee.getDegree();
                                //out.println("editPersonalProfile degree: " + degree);
                                // get year of grad
                                int gradYear = currentMentee.getYear_of_grad();
                                //out.println("editPersonalProfile gradYear: " + gradYear);
                                // get mentor email
                                String cMentorEmail = currentMentee.getMentor_email();
                                String cMentorName = "";
                                if (cMentorEmail != null && !cMentorEmail.isEmpty()) {
                                    Mentor cMenteeMentor = MentorDAO.getMentorByEmail(cMentorEmail);
                                    cMentorName = cMenteeMentor.getName();
                                }
                        %>
                      
                        <div class='row'>
                            <div class="col-sm-6 form-group">
                                <p><strong>Company</strong>: <%= companyName%></p>
                            </div>
                            <div class="col-sm-6 form-group">
                                <p><strong>Mentor</strong>: <%= cMentorName%></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <label>Company Position</label>
                                <input name="position" type="text" placeholder="Enter Company Position..." class="form-control" value="<%= position%>" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label>Equity Percentage</label>
                                <input name="equityPercentage" type="text" placeholder="Enter Equity Percentage..." class="form-control" value="<%= equityPercentage%>" onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <label>Year of Graduation</label>
                                <input name="yearOfGrad" type="text" onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));" placeholder="Enter Year of Graduation Here.." class="form-control" value="<%= gradYear%>" required>
                            </div>

                            <div class="col-sm-6 form-group required">
                                <label  class="control-label">Degree</label>
                                <select class="form-control" name="degree" required>
                                    <option selected value = "<%=degree%>"><%=degree%></option>
                                    <%
                                        System.out.println("editPersonalProfile: " + degree);
                                        for (String d : degrees) {
                                    %>
                                    <option value="<%=d%>"><%=d%></option>
                                    <%
                                            System.out.println("editPersonalProfile: " + d);
                                        }
                                    %>
                                </select>
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
                                // mentor position
                                String mentorPosition = currentMentor.getPosition();
                                // mentor bank account number
                                String mentorBankAcc = currentMentor.getBankAccount();
                        %> 
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <label>Bank Account</label>
                                <input name="bank_account" type="text" placeholder="Enter Bank Account Number..." class="form-control" value="<%= mentorBankAcc%>" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group required">
                                <label>Mentor Type</label>
                                <select class="form-control" name="user_type" value="<%=mentorType%>" required>
                                    <option selected value="<%=mentorType%>"><%=mentorType%></option>
                                    <option value = "mentor_im" >Incubation Manager</option>
                                    <option value = "mentor_vc" >Venture Capitalist</option>
                                    <option value = "mentor_ip" >Industry Professional</option>
                                    <option value = "mentor_entre" >Entrepreneur</option>
                                </select> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <label>Company Position</label>
                                <input name="position" type="text" placeholder="Enter Company Position..." class="form-control" value="<%= mentorPosition%>" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label>Equity Percentage</label>
                                <input name="equityPercentage" type="text" placeholder="Enter Equity Percentage..." class="form-control" value="<%= equityPercentage%>" onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 form-group">
                                <label>Skills</label>
                                <textarea name="skills" type="text" rows="4" placeholder="Enter your skills, your area of expertise and what you specialize in..." class="form-control" required><%= mentorSkills%></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 form-group">
                                <label>Introduction</label>
                                <textarea name="introduction" type="text" rows="4" placeholder="Enter an introduction of yourself, what industries you have been and what can you bring or teach the mentees.." class="form-control" required><%= mentorIntroduction%></textarea>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <button type="submit" class="btn btn-sm btn-success center-block">Save</button>
                        <!-- <div class="row">
                            <div class="col-sm-6 col-sm-offset-4">
                                <button value="cancel" class="btn btn-default">Cancel</button> 
                                <button value="save" class="btn btn-primary">Save</button>
                            </div>
                        </div> -->

                    </form> 

                </div>
            </div>
        </div>
    </body>
</html>
