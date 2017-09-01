<%-- 
    Document   : adminViewAllPendingRequests
    Created on : 12 Aug, 2017, 6:32:14 PM
    Author     : Hui Min
--%>

<%@page import="MODELS.Company"%>
<%@page import="MODELS.Mentor"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="CONTROLLER.mentorController"%>
<%@page import="MODELS.Request"%>
<%@page import="java.util.ArrayList"%>
<%@page import="CONTROLLER.requestController"%>
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
        <div class="col-md-9  col-md-offset-2">
            <!--            <ul class="nav nav-tabs">
                            <li class="active"><a href="#incubation" data-toggle="tab" aria-expanded="true">Incubation <span class="badge">10</span></a></li>
                            <li class=""><a href="#openmentor" data-toggle="tab" aria-expanded="false">Open Mentor <span class="badge">5</span></a></li>
                            </li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane fade" id="incubation">-->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8  col-md-offset-2"><ul class="nav nav-pills pull-right">
                            <form method="post" action ="adminDisplayRequestsServlet">
                                <li class="active"> Select Filter  <select name = "requestStatus">
                                        <option value = "all">All</option>
                                        <option value = "requesting">Requested</option>
                                        <option value = "approved">Approved</option>
                                        <option value = "declined">Declined</option>
                                        <option value = "terminated">Terminated</option>
                                    </select><input class="btn btn-primary btn-xs"type ="submit" value =" Choose "> 
                                </li>
                            </form>
                        </ul>

                    </div>
                </div>
                <%  ArrayList<Request> requests = (ArrayList<Request>) session.getAttribute("requests");
                    String requestStatus = (String) session.getAttribute("requestStatus");
                    if (requests == null || requestStatus.equals("all")) {
                %>
                <div class="row">
                    <div class="col-md-8 well col-md-offset-2">
                        <%
                            //print all requesting requests
                            ArrayList<Request> pendingRequests = requestController.getAllRequestsByStatus("requesting");
                        %>
                        <ul class="nav nav-pills ">
                            <li class=""><a href="#">Pending <span class="badge"><%=pendingRequests.size()%></span></a></li>
                        </ul>
                        <%  for (Request r : pendingRequests) {
                                String mentor_email = r.getMentorEmail();
                                int companyID = r.getCompanyID();

                                Mentor m = mentorController.getMentor(mentor_email);
                                Company c = companyController.getCompany(companyID);
                        %>            
                        <form action="adminPendingRequestServlet" method="post">
                            <div class="col-md-4"><div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><%= c.getName()%> has requested for <%= m.getName()%></h3>
                                        <input type="hidden" name="rlsID" value=<%= r.getRequestID()%>>
                                    </div>
                                    <div class="panel-body">
                                        <button type="submit" class="btn btn-success btn-xs" value="approved" name="approveBtn"/>Approve</button>
                                        <button type="submit" class="btn btn-danger btn-xs"  value="declined" name="rejectBtn"/>Reject</button>
                                    </div>
                                </div></div>
                        </form>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="row">

                    <div class="col-md-8 well col-md-offset-2">
                        <%
                            //print all approved requests
                            ArrayList<Request> approvedRequests = requestController.getAllRequestsByStatus("approved");
                        %>
                        <ul class="nav nav-pills ">
                            <li class=""><a href="#">Approved <span class="badge"><%=approvedRequests.size()%></span></a></li>
                        </ul>
                        <%

                            //print for pending
                            for (Request r : approvedRequests) {
                                //print all requests by default
                                String mentor_email = r.getMentorEmail();
                                int companyID = r.getCompanyID();

                                Mentor m = mentorController.getMentor(mentor_email);
                                Company c = companyController.getCompany(companyID);
                        %>
                        <form action="adminPendingRequestServlet" method="post">
                            <div class="col-md-4"><div class="panel panel-success">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><%= m.getName()%> - <%= c.getName()%></h3>
                                        <input type="hidden" name="rlsID" value=<%= r.getRequestID()%>>
                                    </div>
                                    <div class="panel-body">
                                        <button type="submit" class="btn btn-warning btn-xs" name="overBtn">Over</button>
                                    </div>
                                </div></div>
                        </form>
                        <%
                            }
                        %>
                    </div>
                </div>

                <div class="row">

                    <div class="col-md-8 well col-md-offset-2">
                        <ul class="nav nav-pills ">
                            <%
                                //print all declined requests
                                ArrayList<Request> rejectedRequests = requestController.getAllRequestsByStatus("declined");
                            %>
                            <li class=""><a href="#">Declined <span class="badge"><%=rejectedRequests.size()%></span></a></li>
                        </ul>
                        <%
                            //print for pending
                            for (Request r : rejectedRequests) {
                                //print all requests by default
                                String mentor_email = r.getMentorEmail();
                                int companyID = r.getCompanyID();

                                Mentor m = mentorController.getMentor(mentor_email);
                                Company c = companyController.getCompany(companyID);
                        %>
                        <div class="col-md-4"><div class="panel panel-danger">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><%= m.getName()%> - <%= c.getName()%></h3>
                                </div>

                            </div></div>
                            <%
                                }
                            %>




                    </div>
                </div>

                <div class="row">

                    <div class="col-md-8 well col-md-offset-2">
                        <ul class="nav nav-pills ">
                            <%
                                //print all over requests
                                ArrayList<Request> overRequests = requestController.getAllRequestsByStatus("over");

                            %>
                            <li class=""><a href="#">Over <span class="badge"><%=overRequests.size()%></span></a></li>
                        </ul>
                        <%                                     //print for pending
                            for (Request r : overRequests) {
                                String mentor_email = r.getMentorEmail();
                                int companyID = r.getCompanyID();

                                Mentor m = mentorController.getMentor(mentor_email);
                                Company c = companyController.getCompany(companyID);

                                                            //print all requests by default%>


                        <div class="col-md-4"><div class="panel panel-warning">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><%=m.getName()%> - <%=c.getName()%></h3>
                                </div>

                            </div></div>
                            <%
                                }

                            %>



                    </div>
                </div>

                <%} else{
                        //print requests that are passed back from servlet
                        if (requestStatus.equals("approved")) {%>
                    <div class="row">
                    <div class="col-md-8 well col-md-offset-2">
                        <ul class="nav nav-pills ">
                            <li class=""><a href="#">Approved <span class="badge"><%=requests.size()%></span></a></li>
                        </ul>
                        <%for (Request r : requests) {
                                String mentor_email = r.getMentorEmail();
                                int companyID = r.getCompanyID();

                                Mentor m = mentorController.getMentor(mentor_email);
                                Company c = companyController.getCompany(companyID);%>

                        <form action="adminPendingRequestServlet" method="post">
                            <div class="col-md-4"><div class="panel panel-success">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><%= m.getName()%> - <%= c.getName()%></h3>
                                        <input type="hidden" name="rlsID" value=<%= r.getRequestID()%>>
                                    </div>
                                    <div class="panel-body">
                                        <button type="submit" class="btn btn-warning btn-xs" name="overBtn">Over</button>
                                    </div>
                                </div></div>
                        </form>
                        <%}
                            }else if(requestStatus.equals("requesting")){%>
                            <div class="row">
                            <div class="col-md-8 well col-md-offset-2">
                            <ul class="nav nav-pills ">
                            <li class=""><a href="#">Pending <span class="badge"><%=requests.size()%></span></a></li>
                            </ul>
                        <%  for (Request r : requests) {
                                String mentor_email = r.getMentorEmail();
                                int companyID = r.getCompanyID();

                                Mentor m = mentorController.getMentor(mentor_email);
                                Company c = companyController.getCompany(companyID);
                        %>            
                        <form action="adminPendingRequestServlet" method="post">
                            <div class="col-md-4"><div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><%= c.getName()%> has requested for <%= m.getName()%></h3>
                                        <input type="hidden" name="rlsID" value=<%= r.getRequestID()%>>
                                    </div>
                                    <div class="panel-body">
                                        <button type="submit" class="btn btn-success btn-xs" value="approved" name="approveBtn"/>Approve</button>
                                        <button type="submit" class="btn btn-danger btn-xs"  value="declined" name="rejectBtn"/>Reject</button>
                                    </div>
                                </div></div>
                        </form>
                        <%
                            }
                        }else if(requestStatus.equals("declined")){%>
                        <div class="row">

                    <div class="col-md-8 well col-md-offset-2">
                        <ul class="nav nav-pills ">
                            <li class=""><a href="#">Declined <span class="badge"><%=requests.size()%></span></a></li>
                        </ul>
                        <%
                            //print for pending
                            for (Request r : requests) {
                                //print all requests by default
                                String mentor_email = r.getMentorEmail();
                                int companyID = r.getCompanyID();

                                Mentor m = mentorController.getMentor(mentor_email);
                                Company c = companyController.getCompany(companyID);
                        %>
                        <div class="col-md-4"><div class="panel panel-danger">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><%= m.getName()%> - <%= c.getName()%></h3>
                                </div>

                            </div></div>
                    </div></div>
                            <%
                                }
}else{%>
                            <div class="row">

                    <div class="col-md-8 well col-md-offset-2">
                        <ul class="nav nav-pills ">
                            <li class=""><a href="#">Over <span class="badge"><%=requests.size()%></span></a></li>
                        </ul>
                        <%
                            //print for pending
                            for (Request r : requests) {
                                //print all requests by default
                                String mentor_email = r.getMentorEmail();
                                int companyID = r.getCompanyID();

                                Mentor m = mentorController.getMentor(mentor_email);
                                Company c = companyController.getCompany(companyID);
                        %>
                        <div class="col-md-4"><div class="panel panel-danger">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><%= m.getName()%> - <%= c.getName()%></h3>
                                </div>

                            </div></div>
            <%}
}
}%>


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
