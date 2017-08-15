<%-- 
    Document   : viewMentorProfile
    Created on : Jul 27, 2017, 2:30:40 AM
    Author     : Xinyao
--%>

<%@page import="java.util.Base64"%>
<%@page import="DAO.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MODELS.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor Profile</title>
        <%@include file="navbar.jsp" %>
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
        %>
        
           <div class="container">
	<div class="row">
		<div class="col-md-offset-4 col-md-8 col-lg-offset-4 col-lg-6">

            <div class="col-sm-8 well">
                <div class="col-xs-12 col-sm-8">
                <%
                    // display the image
                        byte[ ] imgData = user.getProfile_pic();
                        String imgDataBase64=new String(Base64.getEncoder().encode(imgData));
                %>
                <img src="data:image/gif;base64,<%= imgDataBase64 %>" alt="images Here" />
                
                <h2><%= user.getName()%></h2>


                <p><strong>Email Address</strong> : <%= user.getEmail()%></p>


                <p><strong>NRIC</strong> : <%= user.getNric()%></p>
                
                <%String type = user.getUser_type(); %>
                
                <% if (type.equals("mentee")){
                    Mentee mentee = MenteeDAO.getMenteeByEmail(user.getEmail());
                %>
                    
                <p><strong>User Type</strong> : <%= mentee.getMentee_type() + " " + type%></p>
                    
                
                <p><strong>Degree</strong> : <%= mentee.getDegree()%></p>
                  
                <p><strong>Year of Graduation</strong> : <%= mentee.getYear_of_grad()%></p>
                    
                
                <%} else if(type.equals("mentor")){
                        Mentor mentor = MentorDAO.getMentorByEmail(user.getEmail());
                %>
                     <p><strong>User Type</strong> : <%=type%></p>
                     <p><strong>Current Position in the Company</strong> : <%= mentor.getPosition()%></p>
                     <p><strong>Introduction</strong><br>
                         <%= mentor.getIntroduction()%></p>
                <% } %>
            </div>             
                
                </div>
            </div>
    	 </div>                 
		</div>
	</div>
        </body>
        
        <div class="text-center"><a href="editPersonalProfile.jsp" class="btn-sm btn-success">Edit Profile</a></div>
        

</html>
