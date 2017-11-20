<%-- 
    Document   : addMeetingMinutes
    Created on : Aug 4, 2017, 2:18:24 PM
    Author     : jiatung.lim
--%>

<%@page import="DAO.CompanyDAO"%>
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
        <title>Add Meeting Minutes</title>
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        <%@include file="sidenav.jsp" %>
        <script>
            $(document).ready(function () {
                var date_input = $('input[name="date"]'); //our date input has the name "date"
                var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
                var options = {
                    format: 'yyyy-mm-dd',
                    container: container,
                    todayHighlight: true,
                    autoclose: true,
                };
                date_input.datepicker(options);
            })
        </script>
    </head>
    <body>
        <style>

            div.stars {
                width: 270px;
                display: inline-block;
            }

            input.star { display: none; }

            label.star {
                float: right;
                padding: 10px;
                font-size: 36px;
                color: #444;
                transition: all .2s;
            }

            input.star:checked ~ label.star:before {
                content: '\f005';
                color: #FD4;
                transition: all .25s;
            }

            input.star-5:checked ~ label.star:before {
                color: #FE7;
                text-shadow: 0 0 20px #952;
            }

            input.star-1:checked ~ label.star:before { color: #F62; }

            label.star:hover { transform: rotate(-15deg) scale(1.3); }

            label.star:before {
                content: '\f006';
                font-family: FontAwesome;
            }

        </style>


        <div class="container">
            <div class="col-sm-9 col-sm-offset-4">
                <h2 class="page-header col-lg-9 ">Add Meeting Minutes</h2>
                <div class="col-lg-10">
                    <%                        String status = (String) request.getAttribute("status");
                        if (status != null) {%>
                    <font color="red"> <%=status%> </font>
                    <%}

                        String id = request.getParameter("id");
                        if (id == null) {

                    %>
                    <!--<div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Choose the Meeting Title
                            <span class="caret"></span></button>
                        <ul class="dropdown-menu"> -->

                    <%                
                        
                        User currentUser = (User) session.getAttribute("user");
                        //System.out.println("CURRENT USER IN ADDMEETINGJSP -----"+ currentUser.getName());
                        ArrayList<Meeting> meetingWithoutMinutes = meetingController.getMeetingsWithoutMinutes(currentUser.getEmail());
                        if (meetingWithoutMinutes != null && meetingWithoutMinutes.size() != 0) {
                            for (Meeting m : meetingWithoutMinutes) {
                    %>



                    <p>
                    <li><a href="addMeetingMinutes.jsp?id=<%=m.getMeetingID()%>"><%=m.getMeetingName()%> (<%=m.getStartTime()%>)</a></li>
                    </p>

                    <%
                            }
                        }

                    %>
                    <!--</ul>
                </div>-->
                    <%} else {%>

                    <!-- meeting id to be retrieved from previous page
                      <input type ="hidden" name ="meeting_id">-->

                    <form method ="post" action ="addMeetingMinutesServlet">
                        <%

                            int meeting_id = Integer.parseInt(id);
                            Meeting currentMeeting = meetingController.getMeetingByMeetingID(meeting_id);
                            int menteeCompany = currentMeeting.getMenteeCompany();
                            Company comp = CompanyDAO.getCompany(menteeCompany);
                            int currentStageOfCompany = comp.getCurrentStage();

                            String type = user.getUser_type();%>

                        <div class="row">
                            <!-- FOR NOW -->
                            <input type="hidden" value = "<%=meeting_id%>" name ="meeting_id">
                            <div class="col-sm-12 form-group">


                                <%
                                    String mentor_name = "";
                                    if (type.equals("regular_mentee") || type.equals("light_mentee")) {
                                        Mentee mentee = MenteeDAO.getMenteeByEmail(user.getEmail());

                                        if (mentee.getMentor_email() != null && !mentee.getMentor_email().isEmpty()) {
                                            Mentor myMentor = mentorController.getMentor(mentee.getMentor_email());
                                            mentor_name = myMentor.getName();
                                %>


                                <%
                                        } else {
                                            out.println("");
                                        }
                                    } else if (userType.contains("mentor")) {
                                        mentor_name = user.getName();
                                    }
                                    
                                    
                                %>
                                <div class="row">
                                    <p><strong>Mentor Name: </strong><%=mentor_name%></p>
                                    <p>
                                        <strong>Company Name: </strong><%=comp.getName()%>
                                    </p>


                                    <%
                                        Date startTime = currentMeeting.getStartTime();
                                        Date endTime = currentMeeting.getEndTime();

                                    %>
                                    <p><strong>Meeting Start Time: </strong><%=currentMeeting.getStartTime()%></p>
                                    <p><strong>Meeting End Time: </strong><%=currentMeeting.getEndTime()%></p>
                                    <p><strong>Company Current Stage: </strong><%=currentStageOfCompany%></p>
                                </div>
                            </div>

                            <!--                                    to insert current stage for company
                            <input id="stage" name="stage" type="text" placeholder="Enter Company Name Here.." class="form-control">-->
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label class="control-label">Title</label>
                                    <input class="col-sm-6 form-control" type ="text" name ="title" value="<%=currentMeeting.getMeetingName()%>"> <br/>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-sm-10 form-group">

                                    <label class="control-label">Tasks Completed (Please tick beside the tasks)</label><br>

                                    <%
                                        int uncompleteTask = 0;
                                        ArrayList<Task> tasks = taskController.displayTasksByStageAndCompany(currentStageOfCompany, menteeCompany);
                                        if (tasks == null || tasks.size() == 0) {
                                            out.println("No task assigned!");
                                        } else {
                                            for (Task t : tasks) {
                                                if (!t.isIsCompleted()) {
                                    %>
                                    <p><%=t.getName()%> <input class type="checkbox" name="tasks_completed" value="<%=t.getTaskId()%>"></p>
                                        <%
                                                        uncompleteTask++;
                                                    }

                                                }
                                                if (uncompleteTask == 0) {
                                                    out.println("No uncomplete task!");
                                                }
                                            }

                                        %>

                                </div>

                                <div class="col-sm-10 form-group">
                                    <label class="control-label">Comment(s)</label>
                                    <textarea class="form-control" rows="3" id="comment" name="notes" placeholder="Enter Comment"></textarea>
                                </div>
                                        
                                <div class="col-sm-10">
                                    <label class="control-label">Mentor Rating</label><br>
                                    <div class="stars">
                                        <div class="row">
                                            <input class="star star-5" id="star-5" type="radio" name="mentor_rating" value = "5"/>
                                            <label class="star star-5" for="star-5"></label>
                                            <input class="star star-4" id="star-4" type="radio" name="mentor_rating" value = "4"/>
                                            <label class="star star-4" for="star-4"></label>
                                            <input class="star star-3" id="star-3" type="radio" name="mentor_rating" value = "3"/>
                                            <label class="star star-3" for="star-3"></label>
                                            <input class="star star-2" id="star-2" type="radio" name="mentor_rating" value = "2"/>
                                            <label class="star star-2" for="star-2"></label>
                                            <input class="star star-1" id="star-1" type="radio" name="mentor_rating" value = "1"/>
                                            <label class="star star-1" for="star-1"></label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-10 form-group">
                                        <label class="control-label">Comments for your Mentor</label>
                                        <textarea class="form-control" rows="3" id="rating_comments" name="rating_comments" placeholder="How do you feel about the mentoring session?"></textarea>
                                    </div>
                                    
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

                            <button type="submit" value="Submit" class="btn btn-xs btn-default" >Submit</button>
                            <!---input type="submit" class="btn btn-lg btn-info" onclick ="rating()" value="Submit">-->
                    </form> 
                    <%}%>
                </div>
            </div>

        </div>
    </div>
</body>
</html>
<%@include file="browserCloseEvent.jsp" %>
