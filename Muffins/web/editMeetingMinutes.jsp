<%-- 
    Document   : editMeetingMinutes
    Created on : Aug 15, 2017, 12:37:06 PM
    Author     : JJAY
--%>


<%@page import="DAO.CompanyDAO"%>
<%@page import="CONTROLLER.minutesController"%>
<%@page import="MODELS.MeetingMinutes"%>
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
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <% 
            String meeting = request.getParameter("mid");
                System.out.print("EDIT MM ID IS ----- "+meeting);%>

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


            <%                
               
                
                if (meeting != null) {
                    int meeting_id = Integer.parseInt(meeting);

                    ArrayList<MeetingMinutes> minutes = minutesController.getMeetingMinutesByMeeting(meeting_id);
                    //get fixed values
                    MeetingMinutes first = minutes.get(0);
                    int minutes_id = first.getMinutesID();
                    String minutesTitle = first.getTitle();
                    String comments = first.getComments();
                    int rating = first.getMentorRating();

                    Meeting currentMeeting = meetingController.getMeetingByMeetingID(meeting_id);
                    int menteeCompany = currentMeeting.getMenteeCompany();
                    Company comp = CompanyDAO.getCompany(menteeCompany);
                    int currentStageOfCompany = comp.getCurrentStage();

                    String type = user.getUser_type();


            %>

            <div class="col-sm-9 col-sm-offset-2">
                <h2 class="page-header col-lg-9  col-sm-offset-2">Meeting Minutes & Ratings</h2>
                <div class="col-lg-9 well col-sm-offset-2">
                    <%                        String status = (String) request.getAttribute("status");
                        if (status != null) {%>
                    <font color="red"> <%=status%> </font>
                    <%}%>


                    <form method ="post" action ="editMeetingMinutesServlet">

                        <div class="row">
                            <!-- FOR NOW -->
                            <input type="hidden" value = "<%=meeting_id%>" name ="meeting_id">
                            <input type="hidden" value = "<%=minutes_id%>" name ="minutes_id">
                            <div class="col-sm-12 form-group">


                                <% if (type.contains("mentee")) {
                                        Mentee mentee = MenteeDAO.getMenteeByEmail(user.getEmail());
                                        String mentor_name = "";
                                        if (mentee.getMentor_email() != null && !mentee.getMentor_email().isEmpty()) {
                                            Mentor myMentor = mentorController.getMentor(mentee.getMentor_email());
                                            mentor_name = myMentor.getName();
                                %>
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <b>Mentor Name: </b><%=mentor_name%>
                                    </div>


                                    <%
                                            } else {
                                                out.println("");
                                            }
                                        } else {
                                            out.println("");
                                        }
                                    %>

                                    <div class="col-lg-6 form-group">
                                        <strong>Mentee Name: </strong><%=user.getName()%>
                                    </div>
                                </div>
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
                                <input class="col-sm-6 form-control" type ="text" value = "<%=minutesTitle%>" name ="title" placeholder="Enter Title"> <br/>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">

                                <label class="control-label">Tasks Completed (Please tick beside the tasks)</label><br>

                                <%
                                    for (MeetingMinutes temp : minutes) {
                                                int currentID = temp.getTask_id();
                                                Task current = taskController.displayTask(currentID, menteeCompany);
                                                if (current != null) {
                                                    %>
                                                    <%= current.getName()%> <input class type="checkbox"  name="tasks_completed" value="<%=currentID%>" checked> </br>
                                <%
                                                }
}
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
                            <div class="col-sm-6 form-group">
                                <label class="control-label">Comment(s)</label>
                                
                                <textarea class="form-control" rows="3" id="comment" name="notes" placeholder=""><%=comments%></textarea>
                            </div>
                        </div>

                        <div class="row">
                            <label class="control-label">Mentor Rating</label><br>
                            <div class="stars">
                                <%  
                                    String htmlPart = "";
                                    
                                    for(int x = 1; x<=5; x++){
                                        if(rating==x){
                                            htmlPart = "value = '"+rating+ "' checked";
                                           %>
                                <input class="star star-<%=rating%>" id="star-<%=rating%>" type="radio" name="mentor_rating" value = "<%=x%>" />
                                <label class="star star-<%=rating%>" for="star-<%=rating%>"></label>
                                <% 
                                        }else{
                                            %>
                                <input class="star star-<%=x%>" id="star-<%=x%>" type="radio" name="mentor_rating" value = "<%=x%>" />
                                <label class="star star-<%=x%>" for="star-<%=x%>"></label>
                                <%
                                        }
                                    }
                                %>
                                <!---<input class="star star-5" id="star-5" type="radio" name="mentor_rating" value = "1" />
                                <label class="star star-5" for="star-5"></label>
                                <input class="star star-4" id="star-4" type="radio" name="mentor_rating" value = "2"/>
                                <label class="star star-4" for="star-4"></label>
                                <input class="star star-3" id="star-3" type="radio" name="mentor_rating" value = "3"/>
                                <label class="star star-3" for="star-3"></label>
                                <input class="star star-2" id="star-2" type="radio" name="mentor_rating" value = "4"/>
                                <label class="star star-2" for="star-2"></label>
                                <input class="star star-1" id="star-1" type="radio" name="mentor_rating" value = "5"/>
                                <label class="star star-1" for="star-1"></label>--->

                            </div>


                        </div>

                        <button type="submit" value="Submit" class="btn btn-xs btn-default" >Submit</button>
                        <!---input type="submit" class="btn btn-lg btn-info" onclick ="rating()" value="Submit">-->
                    </form> 
                    <%}%>
                </div>

            </div>


        </div>
    </body>
</html>
<%@include file="browserCloseEvent.jsp" %>
