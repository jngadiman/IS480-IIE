<%-- 
    Document   : editMeetingMinutes
    Created on : Aug 15, 2017, 12:37:06 PM
    Author     : JJAY
--%>


<%@page import="java.util.Date"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="CONTROLLER.mentorController"%>
<%@page import="MODELS.Mentor"%>
<%@page import="DAO.MenteeDAO"%>
<%@page import="MODELS.Company"%>
<%@page import="MODELS.Task"%>
<%@page import="java.util.ArrayList"%>
<%@page import="CONTROLLER.taskController"%>
<%@page import="MODELS.Meeting"%>
<%@page import="CONTROLLER.meetingController"%>
<%@page import="MODELS.User"%>
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

        <div class="container">
            <h1 class="well">Meeting Minutes & Ratings</h1>

            <%                User currentUser = (User) session.getAttribute("user");
                int meeting_id = 1;
                Meeting currentMeeting = meetingController.getMeetingByMeetingID(meeting_id);
                int currentStageForCompany = currentMeeting.getMenteeCompany().getCurrentStage();


            %>

            <div class="col-lg-12 well">
                <!-- meeting id to be retrieved from previous page
                  <input type ="hidden" name ="meeting_id">-->

                <div class="row">
                    <form method ="post" action ="addMeetingMinutesServlet">
                        <div class="col-sm-12">

                            <div class="row">
                                <!-- FOR NOW -->
                                <input value = "<%=meeting_id%>" name ="meeting_id">
                                <div class="col-sm-6 form-group">

                                    <%String type = user.getUser_type(); %>
                                    <% if (type.equals("regular_mentee") || type.equals("light_mentee")) {
                                            Mentee mentee = MenteeDAO.getMenteeByEmail(user.getEmail());
                                            String mentor_name = "";
                                            if (mentee.getMentor_email() != null && !mentee.getMentor_email().isEmpty()) {
                                                Mentor myMentor = mentorController.getMentor(mentee.getMentor_email());
                                                mentor_name = myMentor.getName();
                                    %>
                                    <p><strong>Mentor Name: </strong><%=mentor_name%><p>
                                        <%
                                                } else {
                                                    out.println("");
                                                }
                                            } else {
                                                out.println("");
                                            }
                                        %>
                                    <p><strong>Mentee Name: </strong><%=currentUser.getName()%></p>
                                    <%
                                        Date startTime = currentMeeting.getStartTime();
                                        Date endTime = currentMeeting.getEndTime();

                                    %>
                                    <p><strong>Meeting Start Time: </strong><%=currentMeeting.getStartTime()%></p>
                                    <p><strong>Meeting End Time: </strong><%=currentMeeting.getEndTime()%></p>
                                    <p><strong>Company Current Stage: </strong><%=currentStageForCompany%></p>

                                </div>
                            </div>
                            <!--                                    to insert current stage for company
                            <input id="stage" name="stage" type="text" placeholder="Enter Company Name Here.." class="form-control">-->
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Title</label>
                                    <input class="col-sm-6 form-control" type ="text" name ="title"> getMeetingMinutes<br/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 ">
                                    <label>Tasks Completed</label><br>

                                    <%
                                        ArrayList<Task> tasks = taskController.displayTasksByStageAndCompany(currentStageForCompany, currentMeeting.getMenteeCompany().getId());

                                        for (Task t : tasks) {
                                            if (!t.isIsCompleted()){
                                    %>
                                    <p><input class type="checkbox" name="tasks_completed" value="<%=t.getTaskId()%>"></p>
                                        <%
                                            } else {
                                                }
}

                                        %>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Comment</label>
                                    <textarea class="form-control" rows="3" id="comment" name="notes" placeholder="Enter Comment"></textarea>
                                </div>
                            </div>

                            <!--                            <div class="row">
                                                            <div class="col-sm-6 form-group">
                                                                <label>Date</label>
                                                                <input id="date" name="date" type="text" placeholder="Enter Date" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-6 form-group">
                                                                <label>Purpose</label>
                                                                <select class="form-control" id="industry" name="industry">
                                                                    <option value="validateModel">Validate Business Model Canvas</option>
                                                                    <option value="compAnalysis">Competitor Analysis</option>
                                                                    <option value="marketSizing">Market Sizing</option>
                                                                    <option value="defineTargetAudience">Define Target Audience</option>
                                                                    <option value="ensureProductMarketFit">Ensure Product-market-fit(Value proposition for identified target audience)</option>
                                                                    <option value="defineRevenueModel">Define Revenue model</option>
                                                                    <option value="defineDistributionChannel">Define Distribution Channels</option>
                                                                    <option value="others">Others</option>
                                                                </select>
                                                            </div>
                                                        </div>
                            
                                                        <div class="row">
                                                            <div class="col-sm-6 form-group">
                                                                <label>Comment</label>
                                                                <textarea class="form-control" rows="3" id="comment" name="notes" placeholder="Enter Comment"></textarea>
                                                            </div>
                                                        </div>
                            
                                                        <div class="row">
                                                            <div class="col-sm-6 form-group">
                                                                <label>Deliverables</label> *to be retrieve from database
                                                                 <select class="form-control" id="deliverables" name="deliverables">
                                                                    <option value="1">1</option>
                                                                    <option value="2">2</option>
                                                                </select>
                                                                
                                                            </div>
                                                        </div>
                            
                                                        <div class="row">
                                                            <div class="col-sm-6 form-group">
                                                                <label>Dateline</label>
                                                                <input id="date" name="date" type="text" placeholder="Enter Dateline" class="form-control">
                                                            </div>
                                                        </div>-->


                            <input type="submit" class="btn btn-lg btn-info" value="Submit">					
                        </div>
                    </form> 
                </div>
            </div>
        </div>
    </body>
</html>
<%@include file="browserCloseEvent.jsp" %>
