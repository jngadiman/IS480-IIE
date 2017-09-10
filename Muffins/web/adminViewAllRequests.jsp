<%-- 
    Document   : adminViewAllPendingRequests
    Created on : 12 Aug, 2017, 6:32:14 PM
    Author     : Hui Min
--%>

<<<<<<< HEAD
<%@page import="DAO.MentorDAO"%>
<%@page import="MODELS.Preference"%>
<%@page import="CONTROLLER.preferenceController"%>
=======
<%@page import="CONTROLLER.preferenceController"%>
<%@page import="MODELS.Preference"%>
>>>>>>> eba72689d61b634a4d72d83c6d04f639725f497e
<%@page import="java.util.Base64"%>
<%@page import="MODELS.Company"%>
<%@page import="MODELS.Mentor"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="CONTROLLER.mentorController"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protect.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="navbar.jsp" %>
    </head>
    <body>
        <div class="col-md-9  col-md-offset-2">
            <!--            <ul class="nav nav-tabs">
                            <li class="active"><a href="#incubation" data-toggle="tab" aria-expanded="true">Incubation <span class="badge">10</span></a></li>
                            <li class=""><a href="#openmentor" data-toggle="tab" aria-expanded="false">Open Mentor <span class="badge">5</span></a></li>
                            </li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane fade" id="incubation">-->
            <div class="container-fluid">
<<<<<<< HEAD
                <%  ArrayList<Company> noMentorCompanies = assignmentController.getNoMentorCompanies();
=======
                <%  
                    ArrayList<Preference> preferences = preferenceController.getAllPreferences();
                    ArrayList<Company> companies = preferenceController.getCompaniesWPreference();
>>>>>>> eba72689d61b634a4d72d83c6d04f639725f497e
                    String requestStatus = (String) session.getAttribute("requestStatus");
                    if (preferences != null || requestStatus.equals("all")) {
                %>
                <div class="row">
                    <div class="col-md-10 well col-md-offset-1">

                        <ul class="nav nav-pills ">
<<<<<<< HEAD
                            <li class=""><a href="#">pending <span class="badge"><%=noMentorCompanies.size()%></span></a></li>
                        </ul>            
                        <form action="adminPendingRequestServlet" method="post"> 
                            <%
                                for (Company c : noMentorCompanies) {
=======
                                <li class=""><a href="#">Pending <span class="badge"><%=preferences.size()%></span></a></li>
                        </ul>            
                        <form action="adminPendingRequestServlet" method="post">
                            <%  
                                for (Company c: companies) {
>>>>>>> eba72689d61b634a4d72d83c6d04f639725f497e
                            %>
                            <div class="col-lg-4 well">
                                <%
                                    ArrayList<Preference> allPreferences = preferenceController.getPreferencesOfCompany(c.getId());
                                    byte[] imgData = c.getCompanyLogo();
                                    if (imgData != null) {
                                        String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                                %>
                                <a href="mentorAssignment.jsp"><img width="200" src="data:image/gif;base64,<%= imgDataBase64%>"  alt="images Here"/></a>
                                    <%
                                        }
                                    %>
                                <div class="row">
                                    <p style="text-align:center"><strong><%=c.getName()%></strong></p>
                                </div>

                                <div class="row">
                                    <p><strong>Preferred Mentors:</strong></p>
                                    <%
<<<<<<< HEAD
                                        for (Preference p : allPreferences){
                                            String mentor_email = p.getMentor_email();
                                            Mentor m = MentorDAO.getMentorByEmail(mentor_email);
                                            String mentor_name = m.getName();
                                    %>
                                    <p><%=mentor_name%>, </p>
                                    <%
                                        }
                                    %>
                                    <div class="col-lg-6 col-md-offset-3"><a href="mentorAssignment.jsp">Assign Mentor</a></div>
=======
                                        ArrayList<Mentor> mentors = mentorController.getMentors();
                                    %>
                                    <p>retrieve mentor names and display here</p>
>>>>>>> eba72689d61b634a4d72d83c6d04f639725f497e
                                </div>
                            </div>
                            <%
                                }
                            %>

                        </form>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <!--                </div>-->
        <!--                <div class="tab-pane fade active in" id="openmentor">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-8  col-md-offset-2"><ul class="nav nav-pills pull-right">
                                            <form method="post" action ="adminDisplayRequestsServlet">
                                                <li class="active"> Select Filter  <select name = "requestStatus">
                                                        <option value = "all">All</option>
                                                        <option value = "requesting">Requested</option>
                                                        <option value = "approved">Approved</option>
                                                        <option value = "declined">Declined</option>
                                                        <option value = "over">Over</option>
                                                    </select><input class="btn btn-primary btn-xs"type ="submit" value =" Choose "> 
                                                </li></form>
                                        </ul>
        
                                    </div>
                                </div>
        
                                <div class="row">
        
                                    <div class="col-md-8 well col-md-offset-2">
                                        <ul class="nav nav-pills ">
                                            <li class=""><a href="#">Pending <span class="badge">3</span></a></li>
                                        </ul>
                                        <div class="col-md-4"><div class="panel panel-primary">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Panel primary</h3>
                                                </div>
                                                <div class="panel-body">
                                                    Panel content
                                                </div>
                                            </div></div>
                                        <div class="col-md-4"><div class="panel panel-primary">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Panel primary</h3>
                                                </div>
                                                <div class="panel-body">
                                                    Panel content
                                                </div>
                                            </div></div>
                                        <div class="col-md-4"><div class="panel panel-primary">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Panel primary</h3>
                                                </div>
                                                <div class="panel-body">
                                                    Panel content
                                                </div>
                                            </div></div>
        
                                    </div>
                                </div>
        
                                <div class="row">
        
                                    <div class="col-md-8 well col-md-offset-2">
                                        <ul class="nav nav-pills ">
                                            <li class=""><a href="#">Approved <span class="badge">3</span></a></li>
                                        </ul>
                                        <div class="col-md-4"><div class="panel panel-success">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Panel success</h3>
                                                </div>
                                                <div class="panel-body">
                                                    Panel content
                                                </div>
                                            </div></div>
                                        <div class="col-md-4"><div class="panel panel-success">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Panel success</h3>
                                                </div>
                                                <div class="panel-body">
                                                    Panel content
                                                </div>
                                            </div></div>
                                        <div class="col-md-4"><div class="panel panel-success">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Panel success</h3>
                                                </div>
                                                <div class="panel-body">
                                                    Panel content
                                                </div>
                                            </div></div>
        
                                    </div>
                                </div>
        
        
        
                                <div class="row">
        
                                    <div class="col-md-8 well col-md-offset-2">
                                        <ul class="nav nav-pills ">
                                            <li class=""><a href="#">Declined <span class="badge">3</span></a></li>
                                        </ul>
                                        <div class="col-md-4"><div class="panel panel-danger">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Panel success</h3>
                                                </div>
                                                <div class="panel-body">
                                                    Panel content
                                                </div>
                                            </div></div>
                                        <div class="col-md-4"><div class="panel panel-danger">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Panel success</h3>
                                                </div>
                                                <div class="panel-body">
                                                    Panel content
                                                </div>
                                            </div></div>
                                        <div class="col-md-4"><div class="panel panel-danger">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Panel success</h3>
                                                </div>
                                                <div class="panel-body">
                                                    Panel content
                                                </div>
                                            </div></div>
        
                                    </div>
                                </div>
        
                                <div class="row">
        
                                    <div class="col-md-8 well col-md-offset-2">
                                        <ul class="nav nav-pills ">
                                            <li class=""><a href="#">Over <span class="badge">3</span></a></li>
                                        </ul>
                                        <div class="col-md-4"><div class="panel panel-warning">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Panel success</h3>
                                                </div>
                                                <div class="panel-body">
                                                    Panel content
                                                </div>
                                            </div></div>
                                        <div class="col-md-4"><div class="panel panel-warning">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Panel success</h3>
                                                </div>
                                                <div class="panel-body">
                                                    Panel content
                                                </div>
                                            </div></div>
                                        <div class="col-md-4"><div class="panel panel-warning">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Panel success</h3>
                                                </div>
                                                <div class="panel-body">
                                                    Panel content
                                                </div>
                                            </div></div>
        
                                    </div>
                                </div>
        
        
        
        
                            </div> 
        
                        </div>-->

    </div>

</div>
</div>
</body>
</html>
