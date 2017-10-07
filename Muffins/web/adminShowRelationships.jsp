<%-- 
    Document   : adminShowRelationships
    Created on : Oct 8, 2017, 5:30:17 AM
    Author     : Jennefer Ngadiman
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="CONTROLLER.mentorController"%>
<%@include file="protect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Relationships</title>
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-sm-offset-2">
                    <h2 class="page-header col-lg-9  col-sm-offset-2">Mentor-Mentee Relationships</h2>
                    need to show filter!!!!!!
                    <%      ArrayList<Relationship> pendingRelationship = relationshipController.getAllRelationshipByStatus("requesting");
                        out.println("<h3 class='page-header col-lg-9 col-sm-offset-2'>Pending Relationship(s) <span class='badge'>" + pendingRelationship.size() + "</span></h3>");

                        if (pendingRelationship != null && pendingRelationship.size() != 0) {

                    %>
                    <div class="col-lg-9 well col-sm-offset-2">
                        <div class ="row">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Company Name</th>
                                        <th>Mentor Name</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%                            for (Relationship rs : pendingRelationship) {
                                            String mentorName = mentorController.getMentor(rs.getMentorEmail()).getName();
                                            String companyName = companyController.getCompany(rs.getCompanyID()).getName();
                                    %>
                                    <tr>
                                        <td><%=companyName%></td>
                                        <td><%=mentorName%></td>
                                        <td><%=new SimpleDateFormat("dd-MM-yyyy").format(rs.getStart_date())%></td>
                                        <td><%=new SimpleDateFormat("dd-MM-yyyy").format(rs.getEnd_date())%></td>
                                    </tr>
                                    <%
                                        }
                                    %>

                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-9 col-sm-offset-2">
                    <%      ArrayList<Relationship> assignedRelationship = relationshipController.getAllRelationshipByStatus("assigned");
                        out.println("<h3 class='page-header col-lg-9 col-sm-offset-2'>Assigned Relationship(s) <span class='badge'>" + assignedRelationship.size() + "</span></h3>");

                        if (assignedRelationship != null && assignedRelationship.size() != 0) {

                    %>
                    <div class="col-lg-9 well col-sm-offset-2">
                        <div class ="row">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Company Name</th>
                                        <th>Mentor Name</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%                            for (Relationship rs : assignedRelationship) {
                                            String mentorName = mentorController.getMentor(rs.getMentorEmail()).getName();
                                            String companyName = companyController.getCompany(rs.getCompanyID()).getName();
                                    %>
                                    <tr>
                                        <td><%=companyName%></td>
                                        <td><%=mentorName%></td>
                                        <td><%=new SimpleDateFormat("dd-MM-yyyy").format(rs.getStart_date())%></td>
                                        <td><%=new SimpleDateFormat("dd-MM-yyyy").format(rs.getEnd_date())%></td>
                                    </tr>
                                    <%
                                        }
                                    %>

                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-9 col-sm-offset-2">
                    <%      ArrayList<Relationship> overRelationship = relationshipController.getAllRelationshipByStatus("over");
                        out.println("<h3 class='page-header col-lg-9 col-sm-offset-2'>Over Relationship(s) <span class='badge'>" + overRelationship.size() + "</span></h3>");

                        if (overRelationship != null && overRelationship.size() != 0) {

                    %>
                    <div class="col-lg-9 well col-sm-offset-2">
                        <div class ="row">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Company Name</th>
                                        <th>Mentor Name</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%                            for (Relationship rs : overRelationship) {
                                            String mentorName = mentorController.getMentor(rs.getMentorEmail()).getName();
                                            String companyName = companyController.getCompany(rs.getCompanyID()).getName();
                                    %>
                                    <tr>
                                        <td><%=companyName%></td>
                                        <td><%=mentorName%></td>
                                        <td><%=new SimpleDateFormat("dd-MM-yyyy").format(rs.getStart_date())%></td>
                                        <td><%=new SimpleDateFormat("dd-MM-yyyy").format(rs.getEnd_date())%></td>
                                    </tr>
                                    <%
                                        }
                                    %>

                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
