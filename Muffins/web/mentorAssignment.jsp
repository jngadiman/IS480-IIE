<%-- 
    Document   : mentorAssignment
    Created on : Sep 6, 2017, 1:31:11 AM
    Author     : Xinyao
--%>

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

                        
                <% String type = request.getParameter("type");%>
                <h1 class="col-lg-8 col-lg-offset-3 page-header">Request for Mentor</h1>
                <div class="col-lg-8 col-lg-offset-3">
          <button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true">
              Filter by
            </button>
                    <ul class="dropdown-menu">
      <li><a href="#">Incubation Manager</a></li>
      <li><a href="#">Venture Capitalist</a></li>
      <li><a href="#">Industry Professional</a></li>
      <li><a href="#">Entrepreneur</a></li>
    </ul>
                    
                    <div class='pull-right'>
                        Keywords : 
                    <input type='text' name='queries' placeholder="Seach here">
                    <input type="submit" class="btn btn-xs btn-info " value="Submit"> 
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
                    if(session.getAttribute("addPreferenceStatus") != null){
                        String status = (String) session.getAttribute("addPreferenceStatus");
                        out.println(status);
                    }
                    

                    session.setAttribute("requestType", type);
                    ArrayList<Mentor> mentors = MentorDAO.getMentors();
                    int i = 0;
                    for (Mentor m : mentors) {
                %>
               
                 
                <div class="col-lg-6 well">
                    
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
                            <h5>
                                <br> <%=m.getSkills()%></h5>
                        </div>


                        <div class="col-lg-12">
                            <div class="col-lg-4 col-lg-offset-4">
                                 <form action="confirmAssignment.jsp" method="post">
                                <input type="hidden" value="<%= m.getEmail()%>" name="mentorEmail">
                                <%
                                    ArrayList<Preference> preferences= PreferenceDAO.getPreferencesOfCompany(user.getCompanyid());
                                    Mentor mentor = relationshipController.getCurrentMentorOfCompany(user.getCompanyid());
                                    if((preferences != null && preferences.size() != 0) || mentor != null){
                                %>
                                <button type="submit" class='btn btn-success btn-xs' disabled>View Profile </button>
                                <%
                                    }else{
                                %>
                                <button type="submit" class='btn btn-success btn-xs'>View Profile</button>          
                                <%
                                    }
                                %>
                                </form>
                            </div>
                        </div>
                    </div>
                          <% i++;
                           if(i%2==0){
                             out.println("</div><div class='row'>");
                           }
                    
                        }
                    %>
                    </div>
                </div>
            </div>
           
          </div>
          </div>
    </body>
</html>
