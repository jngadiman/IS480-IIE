<%-- 
    Document   : displayEachMenteeProfile
    Created on : Oct 25, 2017, 2:09:54 PM
    Author     : Jennefer Ngadiman
--%>

<%@page import="CONTROLLER.mentorController"%>
<%@page import="java.util.Base64"%>
<%@page import="MODELS.Mentee"%>
<%@page import="DAO.MenteeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Profile</title>
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <%  String mentee_email = request.getParameter("mentee_email");
            if (mentee_email != null && !mentee_email.equals("")) {
                Mentee currentMentee = MenteeDAO.getMenteeByEmail(mentee_email);

        %>
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-sm-offset-2">
                    <h2 class="page-header col-lg-9  col-sm-offset-2">Personal Profile</h2>
                    <div class="col-lg-9 well col-sm-offset-2">
                        <div class ="row">
                            <div class="col-sm-12 form-group">
                                <%  // display the image
                                    byte[] profilePic = currentMentee.getProfile_pic();
                                    if (profilePic == null) {
                                %>
                                <img src="img/user.png" class="img-responsive center-block" width="200px" alt=""/>
                                <%
                                } else {
                                    String imgDataBase64 = new String(Base64.getEncoder().encode(profilePic));
                                %>
                                <img src="data:image/gif;base64,<%= imgDataBase64%>" class="img-responsive center-block" alt="Profile Picture" width="200px"/>
                                <%}%>
                            </div>
                        </div>
                        <div class ="row">
                            <div class="col-sm-12 form-group">
                                <h3 class='text-center'><%= currentMentee.getName()%></h3>
                            </div>
                        </div>
                        <div class ="row">

                            <%
                                if (user.getUser_type().equals("admin_im") || user.getUser_type().equals("admin_eir")) {
                            %>
                            <div class="col-sm-6 form-group">
                                <p><strong>Email Address</strong> : <%= currentMentee.getEmail()%></p>
                            </div>
                            <div class="col-sm-6 form-group">
                                <p><strong>NRIC</strong> : <%= currentMentee.getNric()%></p>
                            </div>
                            <%
                                }else{
                                    %>
                            <div class="col-sm-12 form-group">
                                <p><strong>Email Address</strong> : <%= currentMentee.getEmail()%></p>
                            </div>
                            <%
                                }
                            %>

                        </div>
                        <%
                            Mentee mentee = MenteeDAO.getMenteeByEmail(currentMentee.getEmail());
                            String mentor_name = "";
                            if (currentMentee.getMentor_email() != null && !currentMentee.getMentor_email().isEmpty()) {
                                Mentor myMentor = mentorController.getMentor(currentMentee.getMentor_email());
                                mentor_name = myMentor.getName();
                            } else {
                                mentor_name = "None";
                            }
                            String company_name = "";
                            if (currentMentee.getCompanyid() != 0) {
                                Company c = companyController.getCompany(currentMentee.getCompanyid());
                                company_name = c.getName();
                            }
                        %>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <p><strong>Contact Number </strong> : <%=currentMentee.getContactNumber()%></p>
                            </div>
                            <div class="col-sm-6 form-group">
                                <p><strong>Nationality</strong> : <%=currentMentee.getNationality()%></p>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <p><strong>Company </strong> : <%= company_name%></p>
                            </div>
                            <div class="col-sm-6 form-group">
                                <p><strong>Role in Company</strong> : <%= currentMentee.getRole()%></p>
                            </div>

                        </div>
                        <div class='row'>
                            <div class="col-sm-6 form-group">
                                <p><strong>Mentor </strong> : <%= mentor_name%></p>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <p><strong>Primary Degree</strong> : <%= currentMentee.getDegree()%></p>
                            </div>
                            <div class="col-sm-6 form-group">
                                <p><strong>Year of Graduation</strong> : <%= currentMentee.getYear_of_grad()%></p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>



    <%
        }


    %>
</body>
</html>
