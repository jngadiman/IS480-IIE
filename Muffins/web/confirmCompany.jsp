<%-- 
    Document   : confirmCompany
    Created on : Sep 1, 2017, 2:18:57 AM
    Author     : JJAY
--%>

<%@page import="CONTROLLER.companyController"%>
<%@page import="MODELS.Company"%>
<%@page import="CONTROLLER.registrationController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MODELS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Company</title>
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">Pending Companies</h1>
                <%            ArrayList<String> status = (ArrayList<String>) request.getAttribute("status");
                    if (status != null && status.size() != 0) {
                        out.print("<div align='center'>" + status.get(0) + "</div><br><br>");
                    }
                    ArrayList<Company> pendingCompanies = companyController.getCompaniesInStage(0);
                    out.println("No of Pending Companies <span class='badge'>" + pendingCompanies.size() + "</span>");
                    if (pendingCompanies != null && pendingCompanies.size() != 0) {

                %>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Company Name</th>
                            <th>Pitch Slides</th>
                            <th>Differentiation of Product</th>
                            <th>Shortlist</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            for (Company company : pendingCompanies) {
                        %>
                        <tr>
                    <form action = "confirmCompanyServlet" method="post">
                        <%
                            String founders = "";
                            String[] stakeholders = company.getStakeholders();
                            for (int x = 0; x < stakeholders.length; x++) {
                                String s = stakeholders[x];
                                if (x == (stakeholders.length - 1)) {
                                    founders += s;
                                } else {
                                    founders += s + ",";
                                }

                            }

                        %>

                        <td><%=company.getName()%></td>
                        <td><a href="displayPdf.jsp?companyId=<%=company.getId()%>" target="blank" />PDF</a></td>
                        <td><%= company.getProductDiff()%></td>
                        <td>

                            <input type ="hidden" name ="stakeholders" value ="<%=founders%>">
                            <input type ="hidden" name ="company" value ="<%=company.getName()%>">
                            <input type ="hidden" name ="company_id" value ="<%=company.getId()%>">
                            <button type="button" class="btn btn-warning btn-xs" value="shortlist" data-toggle="modal" data-target="#shortlistModal<%=company.getId()%>" name="shortListBtn"/>Shortlist</button>
                            <!-- Modal -->
                            <div class="modal fade" id="shortlistModal<%= company.getId()%>" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Shortlist Panel Info</h4>

                                            <div class="modal-body">
                                                <div class="col-sm-10 col-lg-offset-1">
                                                    <div class="row">
                                                        <input type = "hidden" name ="modalCompanyId" value="<%=company.getId()%>"/>

                                                        <div class="col-sm-6 form-group required">
                                                            <label class="control-label">Venue</label>
                                                            <input id="email" type="text" name="eventVenue" placeholder="Enter Venue Here.." class="form-control" required>
                                                        </div>
                                                        <div class="col-sm-6 form-group">
                                                            <label class="control-label">Date</label> 
                                                            <input id="eventDate" type="text" name="eventDate" placeholder="Enter Date yyyy-mm-dd" class="form-control" required>
                                                        </div>
                                                        <div class="col-sm-6 form-group ">
                                                            <label  class="control-label">Start Time</label>
                                                            <select class="form-control" name="start_time" id="eventTime">

                                                                <option value="00:00">00:00</option>
                                                                <option value="01:00">01:00</option>
                                                                <option value="02:00">02:00</option>
                                                                <option value="03:00">03:00</option>
                                                                <option value="04:00">04:00</option>
                                                                <option value="05:00">05:00</option>
                                                                <option value="06:00">06:00</option>
                                                                <option value="07:00">07:00</option>
                                                                <option value="08:00">08:00</option>
                                                                <option value="09:00">09:00</option>
                                                                <option value="10:00">10:00</option>
                                                                <option value="11:00">11:00</option>
                                                                <option value="12:00">12:00</option>
                                                                <option value="12:00">13:00</option>
                                                                <option value="12:00">14:00</option>
                                                                <option value="12:00">15:00</option>
                                                                <option value="12:00">16:00</option>
                                                                <option value="12:00">17:00</option>
                                                                <option value="12:00">18:00</option>
                                                                <option value="12:00">19:00</option>
                                                                <option value="12:00">20:00</option>
                                                                <option value="12:00">21:00</option>
                                                                <option value="12:00">22:00</option>
                                                                <option value="12:00">23:00</option>
                                                                <option value="12:00">24:00</option>
                                                            </select>
                                                        </div>

                                                        <div class="col-sm-6 form-group ">
                                                            <label  class="control-label">End Time</label>
                                                            <select class="form-control" name="end_time" id="eventTime">

                                                                <option value="00:00">00:00</option>
                                                                <option value="01:00">01:00</option>
                                                                <option value="02:00">02:00</option>
                                                                <option value="03:00">03:00</option>
                                                                <option value="04:00">04:00</option>
                                                                <option value="05:00">05:00</option>
                                                                <option value="06:00">06:00</option>
                                                                <option value="07:00">07:00</option>
                                                                <option value="08:00">08:00</option>
                                                                <option value="09:00">09:00</option>
                                                                <option value="10:00">10:00</option>
                                                                <option value="11:00">11:00</option>
                                                                <option value="12:00">12:00</option>
                                                                <option value="12:00">13:00</option>
                                                                <option value="12:00">14:00</option>
                                                                <option value="12:00">15:00</option>
                                                                <option value="12:00">16:00</option>
                                                                <option value="12:00">17:00</option>
                                                                <option value="12:00">18:00</option>
                                                                <option value="12:00">19:00</option>
                                                                <option value="12:00">20:00</option>
                                                                <option value="12:00">21:00</option>
                                                                <option value="12:00">22:00</option>
                                                                <option value="12:00">23:00</option>
                                                                <option value="12:00">24:00</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-default" name="eventSubmit" value="yes">Submit</button>
                                                <!--<button type="submit" class="btn btn-default" data-dismiss="modal">Close</button>-->
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </td>
                    </form>
                    <!--<a href="#" class="btn btn-success btn-xs">Accept</a><a href="#" class="btn btn-danger btn-xs">Reject</a></td>-->
                    </tr>
                    <%}%>
                    </tbody>
                </table>
                <%
                    }
                %>
            </div>

            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">Shortlisted Companies</h1>
                <%
                    if (status != null && status.size() != 0) {
                        //out.print(status.get(0));

                    }

                    ArrayList<Company> shortlistedComp = companyController.getCompaniesInStage(5);

                    out.println("No of Shortlisted Companies <span class='badge'>" + shortlistedComp.size() + "</span>");
                    if (shortlistedComp != null && shortlistedComp.size() != 0) {

                %>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Company Name</th>
                            <th>Pitch Slides</th>
                            <th>Differentiation of Product</th>
                            <th>Accept</th>
                            <th>Reject</th>
                        </tr>
                    </thead>
                    <%      for (Company company : shortlistedComp) {
                            String founders = "";
                            String[] stakeholders = company.getStakeholders();
                            for (int x = 0; x < stakeholders.length; x++) {
                                String s = stakeholders[x];
                                if (x == (stakeholders.length - 1)) {
                                    founders += s;
                                } else {
                                    founders += s + ",";
                                }

                            }

                    %>

                    <tbody>
                        <tr>
                            <td><%=company.getName()%></td>
                            <td><a href="displayPdf.jsp?companyId=<%=company.getId()%>" target="blank" />PDF</a></td>
                            <td><%= company.getProductDiff()%></td>
                            <td>
                                <form action = "confirmCompanyServlet" method="post">

                                    <input type ="hidden" name ="stakeholders" value ="<%=founders%>">
                                    <input type ="hidden" name ="company" value ="<%=company.getName()%>">
                                    <input type ="hidden" name ="company_id" value ="<%=company.getId()%>">
                                    <button type="submit" class="btn btn-success btn-xs" value="activated" name="activateBtn"/>Activate</button>
                                </form> 


                            </td>
                            <td>
                                <form action = "confirmCompanyServlet" method="post">

                                    <input type ="hidden" name ="stakeholders" value ="<%=founders%>">
                                    <input type ="hidden" name ="company" value ="<%=company.getName()%>">
                                    <input type ="hidden" name ="company_id" value ="<%=company.getId()%>">
                                    <button type="submit" class="btn btn-danger btn-xs"  value="declined" name="rejectBtn"/>Reject</button>
                                </form></td>
                            <!--<a href="#" class="btn btn-success btn-xs">Accept</a><a href="#" class="btn btn-danger btn-xs">Reject</a></td>-->
                        </tr>
                    </tbody>
                    <%}%>
                </table>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
