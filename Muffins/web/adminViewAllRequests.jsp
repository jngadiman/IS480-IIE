<%-- 
    Document   : adminViewAllPendingRequests
    Created on : 12 Aug, 2017, 6:32:14 PM
    Author     : Hui Min
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.HashMap"%>
<%@page import="CONTROLLER.preferenceController"%>
<%@page import="MODELS.Preference"%>
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
        <h1>Requests</h1>
        <div class="col-md-6  col-md-offset-3 well">
            <h4>Assign Mentor to Company</h4>
            <form action="adminPendingRequestServlet" method="post">
                <div class="col-sm-8 form-group required">
                    <select class="form-control" id="mentor" name="mentor" required>
                        <% ArrayList<Company> companyWoMentor = companyController.getAllCompanies();
                            for (Company company : companyWoMentor) {
                        %>
                        <option value="<%= company.getId()%>"><%= company.getName()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <button type="submit" class="btn-sm btn-primary" name="submit">Submit</button>
        </div>
        <div class="col-md-10  col-md-offset-1">
            <!--            <ul class="nav nav-tabs">
                            <li class="active"><a href="#incubation" data-toggle="tab" aria-expanded="true">Incubation <span class="badge">10</span></a></li>
                            <li class=""><a href="#openmentor" data-toggle="tab" aria-expanded="false">Open Mentor <span class="badge">5</span></a></li>
                            </li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane fade" id="incubation">-->
            <div class="container-fluid">
                <%                    ArrayList<Preference> preferences = preferenceController.getAllPreferences();
                    //ArrayList<Company> companies = preferenceController.getCompaniesWPreference();
                    String requestStatus = (String) session.getAttribute("requestStatus");
                    if (preferences != null || requestStatus.equals("all")) {
                %>
                <div class="row">
                    <div class="col-md-8 well col-md-offset-2">

                        <ul class="nav nav-pills ">
                            <li class=""><a href="#">Pending <span class="badge"><%=preferences.size()%></span></a></li>
                        </ul>            
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Company Name</th>
                                    <th>Preferred Mentor</th>
                                    <th>Approve</th>
                                    <th>Edit</th>
                                    <th>Reject</th>
                                </tr>
                            </thead>
                            <%
                                for (Preference p : preferences) {
                            %>


                            <%
                                Company c = companyController.getCompany(p.getCompany_id());
                                String mentor_email = p.getMentor_email();
                                Mentor m = mentorController.getMentor(mentor_email);

                            %>
                            <tbody>
                                <tr>
                                    <td><%=c.getName()%></td>
                                    <td><%= m.getName()%></td>
                                    <td><button type="button" class="btn-xs btn-success" data-toggle="modal" data-target="#approve">Approve</a></td>
                                    <td><button type="button" class="btn-xs btn-primary" data-toggle="modal" data-target="#edit">Edit</a></td>
                                    <td><button type="button" class="bt-xs btn-danger" name="rejectBtn">Reject</a></td>
                                    <td><input type="hidden" name="company_id" value="<%= p.getCompany_id()%>"/></td>
                                    <td><input type="hidden" name="mentor_email" value="<%= p.getMentor_email()%>"/></td>
                                </tr>
                            </tbody>

                            <%
                                }
                            %>
                        </table>
                        <!-- Modal -->
                        <div id="approve" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Approve Mentor Assignment</h4>
                                    </div>

                                    <div class="modal-body">
                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">Start Date</label>
                                            <input class="form-control" id="start_date" name="start_date" type="text" placeholder="Enter Start Date DD/MM/YYYY" class="form-control" required>
                                        </div>
                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">End Date</label>
                                            <input class="form-control" id="end_date" name="end_date" type="text" placeholder="Enter End Date DD/MM/YYYY" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" name="approve" class="btn btn-xs btn-default">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal -->
                        <div id="edit" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Edit Mentor Assignment</h4>
                                    </div>

                                    <div class="modal-body">
                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">Start Date</label>
                                            <input class="form-control" id="start_date" name="start_date" type="text" placeholder="Enter Start Date DD/MM/YYYY" class="form-control" required>
                                        </div>
                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">End Date</label>
                                            <input class="form-control" id="end_date" name="end_date" type="text" placeholder="Enter End Date DD/MM/YYYY" class="form-control" required>
                                        </div>
                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">Mentor</label>
                                            <select class="form-control" id="mentor" name="mentor" required>
                                                <%
                                                    ArrayList<Mentor> mentors = mentorController.getMentors();

                                                    for (Mentor mentor : mentors) {
                                                %>
                                                <option value="<%= mentor.getEmail()%>"><%= mentor.getName()%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">Reason for Request</label>
                                            <textarea rows="3" class="form-control" name="need" placeholder="Enter Reason Here.." required></textarea>
                                        </div> 
                                    </div>
                                        
                                        <div class="modal-footer">
                                            <button type="submit" name="edit" class="btn btn-xs btn-default">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </form>
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
