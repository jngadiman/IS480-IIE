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
        <%@include file="navbar.jsp" %>
    </head>
    <body>
        <div class="container">

            <h2>Pending Companies</h2>
            <%            ArrayList<String> status = (ArrayList<String>) request.getAttribute("status");
                if (status != null && status.size() != 0) {
                    out.print(status.get(0));

                }

                ArrayList<Company> pendingCompanies = companyController.getCompaniesInStage(0);
                out.println("Pending companies - " + pendingCompanies.size());

                if (pendingCompanies != null && pendingCompanies.size() != 0) {

            %>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Company Logo</th>
                        <th>Company Name</th>
                        <th>Requirements</th>
                        <th>Differentiation of Product</th>
                        <th>Revenue Model</th>
                        <th>Traction</th>
                        <th>Deployment of Funds</th>
                        <th>Accept/Reject</th>
                    </tr>
                </thead>
                <%                    for (Company company : pendingCompanies) {
                        String founders = "";
                        String[] stakeholders = company.getStakeholders();
                        for (int x = 0; x < stakeholders.length; x++) {
                            String s = stakeholders[x];
                            if (x == (stakeholders.length - 1)) {
                                founders += s;
                            } else {
                                founders = s + ",";
                            }

                        }

                %>

                <tbody>
                    <tr>
                        <td><%=company.getCompanyLogo()%></td>
                        <td><%=company.getName()%></td>
                        <td><%=company.getAcraFile()%><%=company.getBizFile()%></td>
                        <td><%= company.getProductDiff()%></td>
                        <td>
                            <form action = "confirmCompanyServlet" method="post">

                                <input type ="hidden" name ="stakeholders" value ="<%=founders%>">
                                <input type ="hidden" name ="company" value ="<%=company.getName()%>">
                                <input type ="hidden" name ="company_id" value ="<%=company.getId()%>">
                                <div class="panel-body">
                                    <button type="button" class="btn btn-warning btn-xs" value="shortlist" data-toggle="modal" data-target="#shortlistModal" name="shortListBtn"/>Shortlist</button>
                                    <div class="container">

                                        <!-- Modal -->
                                        <div class="modal fade" id="shortlistModal" role="dialog">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Event Info</h4>

                                                        <div class="modal-body">
                                                            <div class="col-sm-10 col-lg-offset-1">
                                                                <div class="row">
                                                                    <input type = "hidden" name ="user_type" value =<%=company.getId()%>/>
                                                                    <div class="col-sm-6 form-group">
                                                                        <label class="control-label">Event Name</label> 
                                                                        <input id="eventName" type="text" name="eventName" placeholder="Enter Event Name Here.." class="form-control" required>
                                                                    </div>
                                                                    <div class="col-sm-6 form-group required">
                                                                        <label class="control-label">Venue</label>
                                                                        <input id="email" type="text" name="eventVenue" placeholder="Enter Venue Here.." class="form-control" required>
                                                                    </div>

                                                                    <div class="col-sm-6 form-group ">
                                                                        <label  class="control-label">Time</label>
                                                                        <select class="form-control" name="eventTime" id="eventTime">

                                                                            <option value="00:00">00:00</option>
                                                                            <option value="00:00">01:00</option>
                                                                            <option value="00:00">02:00</option>
                                                                            <option value="00:00">03:00</option>
                                                                            <option value="00:00">04:00</option>
                                                                            <option value="00:00">05:00</option>
                                                                            <option value="00:00">06:00</option>
                                                                            <option value="00:00">07:00</option>
                                                                            <option value="00:00">08:00</option>
                                                                            <option value="00:00">09:00</option>
                                                                            <option value="00:00">10:00</option>
                                                                            <option value="00:00">11:00</option>
                                                                            <option value="00:00">12:00</option>
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
                                        <button type="submit" class="btn btn-success btn-xs" value="activated" name="activateBtn"/>Activate</button>
                                        <button type="submit" class="btn btn-danger btn-xs"  value="declined" name="rejectBtn"/>Reject</button>
                                    </div>
                            </form>
                        </td>
                        <!--<a href="#" class="btn btn-success btn-xs">Accept</a><a href="#" class="btn btn-danger btn-xs">Reject</a></td>-->
                    </tr>
                </tbody>
                <%}%>
            </table>
            <%
                }
            %>



        </div>



    </body>
</html>
