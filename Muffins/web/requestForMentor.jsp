<%-- 
    Document   : RequestForMentor
    Created on : Aug 1, 2017, 11:50:25 AM
    Author     : Xinyao
--%>

<%@page import="MODELS.Preference"%>
<%@page import="CONTROLLER.preferenceController"%>
<%@page import="MODELS.Company"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="java.util.Base64"%>
<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Mentor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.MentorDAO"%>
<%@include file="protect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor List</title>
        <%@include file="navbar.jsp" %>
        
    </head>
    <body>
        <%
            user = (User) session.getAttribute("user");
            ArrayList<Preference> companyPref = preferenceController.getPreferencesOfCompany(user.getCompanyid());
            if(companyPref == null || companyPref.size() == 0){
                //show pop up
            }else if(companyPref.size() < 3){
                out.println("You can choose " + (3-companyPref.size()) + " more mentors!");
            }else{
                out.println("You cannot choose any more mentors! Go to View All Mentors if you want to view the mentors' details");
            }
        %>
        <div class="container">
        <div class="col-lg-8 col-lg-offset-2">
             <h1>List of Mentors</h1>
            <%
                String type = request.getParameter("type");
                session.setAttribute("requestType", type);
                ArrayList<Mentor> mentors = MentorDAO.getMentors();
                for(Mentor m: mentors){    
                    Company c = companyController.getCompany(m.getCompanyid());
            %>       
 
            <form action="requestForMentorViewServlet" method="post">
                   <div class="col-lg-4 well">
                   <%
                        // display the image
                        byte[] imgData = m.getProfile_pic();
                        if(imgData != null){
                            String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));

                    %>
                        <img src="data:image/gif;base64,<%= imgDataBase64%>" width="200" height="200" alt="Profile Picture" />
                    <%
                        }else{
                    %>
                            <img src="img/user.png" width="200" height="200" alt=""/>
                    <%
                        }
                    %>
                   <br/>
                   <h2><%= m.getName()%></h2>
                   <h2><%=c.getName()%></h2>
                   <br/>
                   
                    <input type="hidden" value="<%= m.getEmail()%>" name="mentorEmail">
                    <input type="submit" value="View Profile" class="btn btn-sm btn-success" name="submitBtn">
                    </div>
            </form>
            <%
                }
            %>
        </div>
</div>     
                     
    </body>
</html>
