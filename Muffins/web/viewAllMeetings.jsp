<%-- 
    Document   : viewMeetings
    Created on : Nov 6, 2017, 6:08:23 PM
    Author     : JJAY
--%>

<%@page import="java.util.Date"%>
<%@page import="MODELS.Meeting"%>
<%@page import="CONTROLLER.taskController"%>
<%@page import="MODELS.Task"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="CONTROLLER.meetingController"%>
<%@page import="MODELS.Mentor"%>
<%@page import="CONTROLLER.mentorController"%>
<%@page import="CONTROLLER.minutesController"%>
<%@page import="MODELS.MeetingMinutes"%>
<%@page import="java.util.ArrayList"%>
<%@include file="protect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="sidenav.jsp" %>
    </head>

    <body>
        <div class="container">
            <div class="col-sm-9 col-sm-offset-2">
                <h2 class="page-header col-lg-9  col-sm-offset-2">View Meetings </h2>
                <div class="col-lg-9 well col-sm-offset-2">
                    <%  user = (User) session.getAttribute("user");
                        String currentUser = user.getEmail();
                        System.out.println("CURRENT USER IN THIS JSP " + currentUser);
                        ArrayList<Meeting> userMeetings = new ArrayList<Meeting>();
                        userMeetings = meetingController.getMeetingsOfAttendees(currentUser);
                        if (userMeetings != null) {
                            for (Meeting m : userMeetings) {
                                System.out.println("MEETING OBJECT IN VIEW ALL MEETING JSP ----- " + m);
                                System.out.println("MEETING NAME IN USERMEETINGS -----" + m.getMeetingName());
                    %>

                                Meeting Name: <!--EACH = <%=m.getMeetingName()%> DELETE --></br>
                                Meeting Date & Time: <!--EACH = <%=m.getMeetingName()%> DELETE --></br>
                    <%
                        int meetingID = m.getMeetingID();
                        //only prints when the meeting has ended
                        System.out.println("MEETING STATUS IN VIEW ALL MEETING JSP ----- " + m.getStatus());
                        if (m.getStatus().equals("confirmed")) {
                    %>
                                  
                    <!---<form action ="testing.jsp" method = "post">
                        <input type ="hidden" value ="<%=meetingID%>" name ="meetingID">
                        <button type="submit" value="View Meeting Minutes" class="btn btn-xs btn-default" >View Meeting Minutes </button>
                    </form>-->

                    <li><button type="submit" class="btn-xs btn-success" data-toggle="modal" data-target="#view<%=meetingID%>">View meeting Mins 2</button></li>
                    <div class="row">
                        <!-- Modal -->
                        <div id="view<%=meetingID%>" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">test <%//date%> </h4>
                                    </div>
                                    <div class="modal-body">
                                        <%                    

                                            Meeting meeting = meetingController.getMeetingByMeetingID(meetingID);
                                            Date startdate = meeting.getStartTime();
                                            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                                            String date = df.format(startdate);
                                            int company = meeting.getMenteeCompany();
                                            //one sheet of meeting minutes
                                            ArrayList<MeetingMinutes> minutes = minutesController.getMeetingMinutesByMeeting(meetingID);

                                            if (minutes == null || minutes.size() == 0) {
                                                out.println("No meeting minutes found!");
                                            } else {

                                                //to get the fixed values 
                                                MeetingMinutes first = minutes.get(0);


                                        %>
                                        Title : <%=first.getTitle()%><br>
                                        Mentor : <%=mentorController.getMentor(first.getMentor_email()).getName()%><br>
                                        Comments : <%=first.getComments()%><br>
                                        Completed Tasks :
                                        <%
                                            // to get the completed tasks
                                            for (MeetingMinutes temp : minutes) {

                                                Task current = taskController.displayTask(temp.getTask_id(), company);
                                                if (current != null) {


                                        %>
                                        <%= current.getName()%>
                                        <%
                                                    }
                                                }
                                            }
                                        %>

                                    </div>
                                    <div class="modal-footer">
                                         <form action = "editMeetingMinutes.jsp" method ="post">
                                            <input type ="hidden" name ="meetingIDPassedToEdit" value ="<%=meetingID%>">
                                            <button type="submit" class="btn btn-default">Edit</button>
                                        </form>
                                        <a href="editMeetingMinutes.jsp?id=<%=meetingID%>">
                                            <button type="button" class="btn btn-default">Edit</button>
                                        </a>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>  
                    <%
                        }

                    %>


                    <%                        }
                    %>

                    <%
                        }

                    %>


                    <div class="row">


                    </div>


                </div>
            </div>
        </div>
    </body>
</html>
