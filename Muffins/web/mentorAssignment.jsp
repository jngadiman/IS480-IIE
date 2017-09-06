<%-- 
    Document   : mentorAssignment
    Created on : Sep 6, 2017, 1:31:11 AM
    Author     : Xinyao
--%>

<%@page import="DAO.MentorDAO"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="CONTROLLER.profileController"%>
<%@page import="MODELS.Company"%>
<%@page import="MODELS.User"%>
<%@page import="java.util.Base64"%>
<%@page import="CONTROLLER.mentorController"%>
<%@page import="MODELS.Mentor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor Assignment</title>
        <link href="css/cosmos.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <link href="css/form.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-10 well">
                <div class="col-lg-12 well">
                    <p><strong>Mentee Company: </strong>get Mentee's Company</p>
                    <p><strong>Mentorship Period: </strong>get mentorship period indicated</p>
                    <p><strong>Preferred Mentors: </strong>get the list of preferred mentors</ps>
                </div>
                
                
                <% String type = request.getParameter("type");
                        session.setAttribute("requestType", type);
                        ArrayList<Mentor> mentors = MentorDAO.getMentors();
                        for (Mentor m : mentors) {
                    %>
                    <div class="col-lg-6 well">

                        <%
                            Company c = companyController.getCompany(m.getCompanyid());
                            // display the image
                            byte[] imgData = m.getProfile_pic();
                            if (imgData != null) {
                                String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                        %>

                        <div class="col-lg-4 ">
                            <img src="data:image/gif;base64,<%= imgDataBase64%>" width="100" height="100" alt="Profile Picture" />
                            <%
                            } else {
                            %>
                            <img src="img/user.png" width="100" height="100" alt=""/>
                            <%
                                }
                            %>

                        <div class="col-lg-8 ">
                            <h5><strong>Name: </strong><%= m.getName()%></h5>
                            <h5><strong>Company: </strong><%=c.getName()%></h5>
                            <h5><strong>Designation: </strong><%= m.getPosition()%></h5>
                        </div>

                        <div class="col-lg-12">
                            <h5><strong>Areas of Expertise: </strong></h5>
                            <h5>Data Engineering, Data Management, Data Mining</h5>
                        </div>


                        <div class="col-lg-12">
                            <div class="col-lg-4 col-lg-offset-4">
                                <input type="hidden" value="<%= m.getEmail()%>" name="mentorEmail">
                                <a href='confirmAssignment.jsp?email=<%=m.getEmail()%>' class='btn btn-success btn-xs'>View Profile</a>           
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
        </div>
    </body>
</html>
