<%-- 
    Document   : displaySearchedMentors
    Created on : 17 Nov, 2017, 5:58:25 AM
    Author     : Hui Min
--%>

<%@page import="MODELS.User"%>
<%@page import="CONTROLLER.assignmentController"%>
<%@page import="CONTROLLER.relationshipController"%>
<%@page import="DAO.PreferenceDAO"%>
<%@page import="MODELS.Preference"%>
<%@page import="MODELS.Company"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="java.util.Base64"%>
<%@page import="MODELS.Mentor"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Searched Results</h1>
        <%@include file="sidenav.jsp" %>
        <%
            ArrayList<Mentor> mentors = (ArrayList<Mentor>) session.getAttribute("searchedMentors");
            if(mentors == null || mentors.size() == 0){
                out.println("No Mentors were found!");
            }else{
                int i = 0;
                for(Mentor m: mentors){
        %>
                <div class='col-lg-12'>
                    <h4>Industry Professional Mentor(s)</h4>
                </div>
                    <div class="col-lg-6 ">

                        <%                            
                            Company c = companyController.getCompany(m.getCompanyid());
                            // display the image
                            byte[] imgDataM = m.getProfile_pic();
                            if (imgDataM != null) {
                                String imgDataBase64 = new String(Base64.getEncoder().encode(imgDataM));
                        %>

                        <div class="col-lg-6 well">

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
                                    <h5><strong>Position: </strong><%= m.getPosition()%></h5>
                                </div>

                                <div class="col-lg-12">
                                    <h5><strong>Areas of Expertise: </strong></h5>
                                    <h5> <%=m.getSkills()%></h5>
                                </div>


                                <div class="col-lg-12">
                                    <div class="col-lg-4 col-lg-offset-4">
                                        <form action="confirmAssignment.jsp" method="post">
                                            <input type="hidden" value="<%= m.getEmail()%>" name="mentorEmail">
                                            <%
                                                boolean status = false;
                                                ArrayList<Preference> preferences = PreferenceDAO.getPreferencesOfCompany(user.getCompanyid());
                                                Mentor mentor = relationshipController.getCurrentMentorOfCompany(user.getCompanyid());
                                                if ((preferences != null && preferences.size() != 0) || mentor != null) {
                                            %>
                                            <button type="submit" class='btn btn-danger btn-xs' disabled>Not Eligible</button>
                                            <%
                                            } else {
                                                status = true;
                                            %>
                                            <button type="submit" class='btn btn-success btn-xs'>Submit Preference</button>          
                                            <%
                                                }
                                            %>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <% 
                                i++;
                                    if (i % 2 == 0) {
                                        out.println("</div> <br><div class='row'>");
                                    }

                                }
                            %>
                        </div>
                        <br>
                        <p>* Not eligible: you have existing mentor or you have already previously states your preferences</p>
                    </div>
                </div>


            </div>
            <!--<h3 class="col-lg-8 col-lg-offset-3 page-header">System Recommendation</h3>
            <div class="col-lg-8 col-lg-offset-3 well">
            -->
            <!--                            
    
            <%
                ArrayList<Mentor> recMentors = assignmentController.getRecommendedMentorsByStartupIndustry(user.getCompanyid());
            %>
            

            <table class="table table-striped col-lg-9 well">
                <thead>
                    <tr>
                        <th>Mentor Name</th>
                        <th>Mentor Company</th>
                        <th>Mentor Skill</th>
                        <th>Assign</th>
                    </tr>
                </thead>
            <%
                for (Mentor m : recMentors) {


            %>

            <tbody>
                <tr>
                    <td><%=m.getName()%></td>
                    <td><%=companyController.getCompany(m.getCompanyid()).getName()%></td>
                    <td><%=m.getSkills()%></td>
                    <td><button type="button" class="btn-xs btn-success">View Profile</a></td>
                    <td><input type="hidden" name="company_id" value="<%=user.getCompanyid()%>"/></td>
                </tr>
            </tbody>

            <%
                }
            %>
        <%
                }
            
        %>
    </body>
</html>
