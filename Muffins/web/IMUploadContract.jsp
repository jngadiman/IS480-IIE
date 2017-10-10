<%-- 
    Document   : IMUploadContract
    Created on : Oct 6, 2017, 11:00:44 PM
    Author     : Jennefer Ngadiman
--%>

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
            <div class="row">
                <div class="col-sm-9 col-sm-offset-2">
                    <% 
                        if(request.getAttribute("uploadStatus") != null){
                            String status = (String) request.getAttribute("uploadStatus");
                            out.println(status);
                        }
                    %>
                    <h2 class="page-header col-lg-9  col-sm-offset-2">Contract Upload</h2>
                    <div class="col-lg-9 well col-sm-offset-2">
                        
                        <div class ="row">
                            <%      ArrayList<Relationship> pendingRelationship = relationshipController.getAllRelationshipByStatus("requesting");
                                out.println("No of Pending Relationship <span class='badge'>" + pendingRelationship.size() + "</span>");
                                if (pendingRelationship != null && pendingRelationship.size() != 0) {

                            %>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Company Name</th>
                                        <th>Mentor Name</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>Upload</th>
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
                                        <td><button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#uploadModal<%=rs.getRelationshipID()%>"/>Upload</button></td>
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
