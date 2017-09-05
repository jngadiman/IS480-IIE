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
            <h2 class="col-lg-10 well col-sm-offset-1">List of Mentors</h2>
            <%
                String type = request.getParameter("type");
                session.setAttribute("requestType", type);
                ArrayList<Mentor> mentors = MentorDAO.getMentors();
                for(Mentor m: mentors){    
                    Company c = companyController.getCompany(m.getCompanyid());
            %> 
            <div class="col-lg-10 well col-sm-offset-1">
                <div class="row">
                    <div class="col-sm-12 form-group">
                        Please choose mentorship period before viewing mentor profile
                    </div>
                    <div class="col-sm-5 form-group">
                        <p><strong>Start Date</strong> : </p>
                        <% if (session.getAttribute("start_date") == null){%>
                            <input id=mentor_period"  name="start_date" placeholder="DD/MM/YYYY" type="text" class="form-control">
                        <%} else {%>
                            <input id=mentor_period"  name="start_date" text=<%=session.getAttribute("sart_date")%> type="text" class="form-control">
                        <%}%>
                    </div>

                    <div class="col-sm-5 form-group">
                        <p><strong>End Date</strong> : </p>
                        <% if (session.getAttribute("start_date") == null){%>
                            <input id=mentor_period"  name="end_date" placeholder="DD/MM/YYYY" type="text" class="form-control">
                        <%} else {%>
                            <input id=mentor_period"  name="end_date" text=<%=session.getAttribute("sart_date")%> type="text" class="form-control">
                        <%}%>
                    </div>
                    <div class="col-sm-2">
                        <br>
                        <button type="submit" class="btn btn-primary" name="submit">Submit</button>
                    </div>
                </div>

                <%  ArrayList<Mentor> mentors = MentorDAO.getMentors();
                    for (Mentor m : mentors) {
                        Company c = companyController.getCompany(m.getCompanyid());
                %>       

                <form action="requestForMentorViewServlet" method="post">
                    <div class="col-lg-6 well">
                        <div class="col-lg-4">
                            <%
                                // display the image
                                byte[] imgData = m.getProfile_pic();
                                if (imgData != null) {
                                    String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));

                            %>
                            <img src="data:image/gif;base64,<%= imgDataBase64%>" width="100" height="100" alt="Profile Picture" />
                            <%
                            } else {
                            %>
                            <img src="img/user.png" width="100" height="100" alt=""/>
                            <%
                                }
                            %>
                        </div>

                        <div class="col-lg-8">
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
                                <%if (session.getAttribute("start_date") != null && session.getAttribute("end_date") != null){%>
                                <input type="submit" value="View Profile" class="btn btn-sm btn-success" name="submitBtn">
                                <%} else{%>
                                <input type="submit" value="View Profile" class="btn btn-sm btn-success" name="submitBtn" disabled>
                                <%}%>                               
                            </div>
                        </div>
                    </div>


                </form>
                <%
                    }
                %>
            </div>
        </div>     

    </body>
</html>
