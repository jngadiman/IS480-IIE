<%-- 
    Document   : EIRAssignment
    Created on : Sep 10, 2017, 5:22:43 PM
    Author     : Jennefer Ngadiman
--%>

<%@page import="CONTROLLER.mentorController"%>
<%@page import="CONTROLLER.assignmentController"%>
<%@page import="CONTROLLER.industryController"%>
<%@page import="DAO.MentorDAO"%>
<%@page import="MODELS.Mentor"%>
<%@page import="java.util.Base64"%>
<%@page import="CONTROLLER.profileController"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="MODELS.Company"%>
<%@page import="MODELS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <%            
            String compID = request.getParameter("companyWNoMentor");
            int companyId = Integer.parseInt(compID);
            Company c = companyController.getCompany(companyId);
        %>

        <div class="col-lg-9 col-lg-offset-2">
            <h1 class="page-header col-lg-9 col-lg-offset-2">EIR Mentor Assignment</h1>
            <div class="col-lg-9 well col-lg-offset-2">
                <div class ="row">
                    <div class="col-lg-4 col-lg-offset-4">
                        <%  // display the image
                            byte[] imgDataComp = c.getCompanyLogo();
                            if (imgDataComp == null) {
                        %>
                        <img src="img/factory.png" width="150px" alt=""/>
                        <%
                        } else {
                            String imgDataBase64 = new String(Base64.getEncoder().encode(imgDataComp));

                        %>
                        <img src="data:image/gif;base64,<%= imgDataBase64%>" width="150px" alt="Profile Picture" />
                        <%}%>
                    </div>

                    <div class="col-lg-4 col-lg-offset-4 ">
                        <font size="+3"><%= c.getName()%></font><br>
                        Industry : <%=industryController.getIndustry(c.getIndustry()).getIndustryName()%><br>
                        Current Stage : <%= c.getCurrentStage()%><br>
                        Pitch Slides : <a href="displayPdf.jsp?companyId=<%=c.getId()%>" target="blank" />PDF</a>
                        <br><br>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-lg-offset-3">
                        <br>
                        Select Mentor Assigned to This Company
                        <form action="adminPendingRequestServlet" method="post">
                            <input type ="hidden" name ="company_id" value ="<%=c.getId()%>">
                            <div class="col-lg-3 form-group" required>
                                <select  id="mentor" name="mentor_email" required>
                                    <%  ArrayList<Mentor> allMentor = mentorController.getMentors();
                                        for (Mentor mentor : allMentor) {

                                    %>
                                    <option value="<%=mentor.getEmail()%>"><%= mentor.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <button type="button" class="btn-xs btn-success" data-toggle="modal" data-target="#approve">Assign</button>
                                <div id="approve" class="modal fade" role="dialog">
                                    <div class="modal-dialog">

                                        Modal content
                                        <div class="modal-content">

                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Add Mentor Assignment</h4>
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
                                                    <button class="btn-primary btn-xs" type="submit" name="approve" class="btn btn-xs btn-default">Submit</button>
                                                </div> 
                                            </div>

                                            <div class="modal-footer">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
            <!--                            
            
            <%
                ArrayList<Mentor> recMentors = assignmentController.getRecommendedMentorsByStartupIndustry(c.getIndustry());
            %>
            

            <table class="table table-striped col-lg-9 well">
                <thead>
                    <tr>
                        <th>Mentor Name</th>
                        <th>Mentor Company</th>
                        <th>Mentor Skill</th>
                        <th>Assign</th>
                    </tr>
                </thead>
            <%
                for (Mentor m : recMentors) {


            %>

            <tbody>
                <tr>
                    <td><%=m.getName()%></td>
                    <td><%=companyController.getCompany(m.getCompanyid()).getName()%></td>
                    <td><%=m.getSkills()%></td>
                    <td><button type="button" class="btn-xs btn-success" data-toggle="modal" data-target="#edit">Assign</a></td>
                    <td><input type="hidden" name="company_id" value="<%=companyId%>"/></td>
                </tr>
            </tbody>

            <%
                }
            %>
        </table>
        <form action="adminPendingRequestServlet" method="post">
             Modal 
            <div id="edit" class="modal fade" role="dialog">
                <div class="modal-dialog">

                     Modal content
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
                                <label class="control-label">Reason for Request</label>
                                <textarea rows="3" class="form-control" name="need" placeholder="Enter Reason Here.." required></textarea>
                                </textarea>
                            </div> 
                        </div>

                        <div class="modal-footer">
                            <button type="submit" name="edit" class="btn btn-xs btn-default">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>-->
        </div>
    </div> 

</div>



</body>
</html>
