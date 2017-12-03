<%-- 
    Document   : IMUploadContract
    Created on : Oct 6, 2017, 11:00:44 PM
    Author     : Jennefer Ngadiman
--%>

<%@page import="MODELS.Contract"%>
<%@page import="CONTROLLER.contractController"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="CONTROLLER.menteeController"%>
<%@page import="CONTROLLER.mentorController"%>
<%@page import="MODELS.Relationship"%>
<%@page import="java.util.ArrayList"%>
<%@page import="CONTROLLER.relationshipController"%>
<%@include file="protect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IM Contract Upload</title>
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <div class="container">
            
                <div class="col-sm-9 col-sm-offset-2">
                    <div class="row">
                    <%                        if (request.getAttribute("uploadStatus") != null) {
                            String status = (String) request.getAttribute("uploadStatus");
                            out.println(status);
                        }
                    %>
                    <h1 class="page-header">Contract Upload</h1>
                    <div class="col-lg-12 well">

                        <div class ="row">
                            <%      ArrayList<Relationship> pendingRelationship = relationshipController.getAllRelationshipByStatus("requesting");
                                    ArrayList<Relationship> assignedRelationship = relationshipController.getAllRelationshipByStatus("assigned");
//                                out.println("No of Pending Relationship <span class='badge'>" + pendingRelationship.size() + "</span>");
                                if (pendingRelationship != null && pendingRelationship.size() != 0 || assignedRelationship != null && assignedRelationship.size() != 0) {
                                    pendingRelationship.addAll(assignedRelationship);
                            %>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Company Name</th>
                                        <th>Mentor Name</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>Upload</th>
                                        <th>View</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%                            
                                        byte[] contract = null;
                                        for (Relationship rs : pendingRelationship) {
                                            String mentorName = mentorController.getMentor(rs.getMentorEmail()).getName();
                                            String companyName = companyController.getCompany(rs.getCompanyID()).getName();
                                            try{
                                            contract = contractController.getContract(rs.getRelationshipID()).getContractFile();
                                            } catch (Exception E){
                                                //do nothing
                                            }
                                    %>
                                    <tr>
                                        <td><%=companyName%></td>
                                        <td><%=mentorName%></td>
                                        <td><%=new SimpleDateFormat("dd-MM-yyyy").format(rs.getStartDate())%></td>
                                        <td><%=new SimpleDateFormat("dd-MM-yyyy").format(rs.getEndDate())%></td>
                                        <td><button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#uploadModal<%=rs.getRelationshipID()%>"/>Upload</button></td>
                                        <%
                                            if (contract != null) {%>
                                        <td><a href="displayContract.jsp?rsId=<%=rs.getRelationshipID()%>" target="blank" />PDF</a></td>
                                        <%} else {%>
                                        <td>None</td>
                                        <% }%>
                                <div class="modal fade" id="uploadModal<%=rs.getRelationshipID()%>" role="dialog">
                                    <form action="imUploadContractServlet" method="post" enctype="multipart/form-data">
                                        <div class="modal-dialog">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">Upload Contract</h4>

                                                    <div class="modal-body">
                                                        <div class="col-sm-10 col-lg-offset-1">
                                                            <div class="row">
                                                                <input type = "hidden" name ="relationship_id" value="<%=rs.getRelationshipID()%>"/>
                                                                <div class="col-sm-10 form-group required">
                                                                    <label class="control-label">Select Contract to Upload</label> 
                                                                    <input class="form-control" type="file" name="contract" required>
                                                                    *Please upload contract in the form of <strong>PDF</strong> only
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">

                                                        <button type="submit" class="btn-default btn-xs" name="eventSubmit" value="yes">Submit</button>
                                                        <!--<button type="submit" class="btn btn-default" data-dismiss="modal">Close</button>-->
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </form>
                                </div>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                            <%}else{
                                    out.println("No relationship found!");
                                }%>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
