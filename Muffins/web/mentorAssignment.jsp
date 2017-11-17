<%-- 
    Document   : mentorAssignment
    Created on : Sep 6, 2017, 1:31:11 AM
    Author     : Xinyao
--%>

<%@page import="CONTROLLER.assignmentController"%>
<%@page import="CONTROLLER.relationshipController"%>
<%@page import="MODELS.Preference"%>
<%@page import="DAO.PreferenceDAO"%>
<%@page import="DAO.MentorDAO"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="CONTROLLER.profileController"%>
<%@page import="MODELS.Company"%>
<%@page import="MODELS.User"%>
<%@page import="java.util.Base64"%>
<%@page import="CONTROLLER.mentorController"%>
<%@page import="MODELS.Mentor"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor Assignment</title>
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <div class="container">
            <!--
                            <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Small button
                            </button>
                            <div class="dropdown-menu">
                                <li><a href="#">Entrepreneur</a></li>
                                <li><a href="#">Venture Capitalist</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                            </div>
                            <div class="col-lg-10 col-lg-offset-1 well">
                                <div class ="row">
                                    <div class="col-sm-6 form-group required">
                                        <label class="control-label">State your reason for request </label>
                                        <input class="form-control" id="reason" name="reason" type="text" placeholder="Enter Reason Here (Compulsory)" class="form-control" required>
                                        <input type="submit" class="btn btn-xs btn-info" value="Submit">       
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-10 col-lg-offset-1 well">
                                            <div class="col-lg-12 well">
                                                <p><strong>Mentee Company: </strong>get Mentee's Company</p>
                                                <p><strong>Mentorship Period: </strong>get mentorship period indicated</p>
                                                <p><strong>Preferred Mentors: </strong>get the list of preferred mentors</ps>
                                            </div>-->



           
            <div class="col-lg-8 col-lg-offset-3">
                 <h1 class="page-header">Request for Mentor</h1>
                   <%                    if (session.getAttribute("addPreferenceStatus") != null) {
                            String status = (String) session.getAttribute("addPreferenceStatus");
                    %>
                    <div class="alert alert-dismissible alert-success">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <%=status%>
                    </div>
                    <%
                        }
%>
                
                <button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true">
                    Filter by
                </button>
                <ul class="dropdown-menu">
                    <li><a href="mentorAssignment.jsp">All</a></li>
                    <li><a href="mentorAssignment.jsp?mentorType=IncubationManager">Incubation Manager</a></li>
                    <li><a href="mentorAssignment.jsp?mentorType=VentureCapitalist">Venture Capitalist</a></li>
                    <li><a href="mentorAssignment.jsp?mentorType=IndustryProfessional">Industry Professional</a></li>
                    <li><a href="mentorAssignment.jsp?mentorType=Entrepreneur">Entrepreneur</a></li>
                </ul>
                <div class='pull-right'>
                    <form action="searchServlet" method="post">
                        Keywords : 
                        <input type="text" name="queries" placeholder="Search here"/>
                        <input type="submit" class="btn btn-xs btn-info " name="searchBtn" value="Submit"> 
                    </form>
                </div>



            </div>
            <div class="col-lg-8 col-lg-offset-3 well">
                <!--                <div class="col-lg-12 well">
                                    <p><strong>Mentee Company: </strong>get Mentee's Company</p>
                                    <p><strong>Mentorship Period: </strong>get mentorship period indicated</p>
                                    <p><strong>Preferred Mentors: </strong>get the list of preferred mentors</ps>
                                </div>-->

                <div class='row'>
                  
                    <%
                        ArrayList<Mentor> mentors = null;
                        if (request.getParameter("mentorType") != null && !request.getParameter("mentorType").isEmpty()) {
                            String mentorType = request.getParameter("mentorType");
                            session.setAttribute("mentorType", mentorType);
                            mentors = mentorController.getMentorsByType(mentorType);
                            if (mentorType.equals("Entrepreneur")) {
                                out.print("<div class='col-lg-12'>");
                                out.print("<h4>Entrepreneur Mentor(s)</h4>");
                                out.print("</div>");
                            }else if(mentorType.equals("VentureCapitalist")){
                                out.print("<div class='col-lg-12'>");
                                out.print("<h4>Venture Capitalist Mentor(s)</h4>");
                                out.print("</div>");
                            }else if(mentorType.equals("IndustryProfessional")){
                                out.print("<div class='col-lg-12'>");
                                out.print("<h4>Industry Professional Mentor(s)</h4>");
                                out.print("</div>");
                            }else{
                                out.print("<div class='col-lg-12'>");
                                out.print("<h4>Incubation Manager Mentor(s)</h4>");
                                out.print("</div>");
                            }
                            
                        } else {
                            mentors = MentorDAO.getMentors();
                        }

                        if (mentors == null || mentors.size() == 0) {
                            out.println("There is no mentor in this category! Please choose another category!");
                        }

                        int i = 0;
                        for (Mentor m : mentors) {

                    %>


                    <div class="col-lg-6 ">

                        <%                            Company c = companyController.getCompany(m.getCompanyid());
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
                            <% i++;
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
        </table>
        
                </div>  
                
      </div>-->

        </div>
    </div>
</body>
</html>
