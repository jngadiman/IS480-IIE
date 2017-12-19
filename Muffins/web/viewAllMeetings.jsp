<%-- 
    Document   : viewMeetings
    Created on : Nov 6, 2017, 6:08:23 PM
    Author     : JJAY
--%>

<%@page import="CONTROLLER.profileController"%>
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
            <div class="col-lg-10 col-sm-offset-1">
                <h2 class="col-lg-12 page-header">View Meetings </h2>
                <div class="col-lg-12 well">
                    <%                        String currentUser = user.getEmail();
                        System.out.println("CURRENT USER IN THIS JSP " + currentUser);
                        ArrayList<Meeting> userMeetings = new ArrayList<Meeting>();
                        userMeetings = meetingController.getMeetingsOfAttendees(currentUser);
                    %>

                    <h2>Meeting with Minutes</h2>
                    <%
                        if (userMeetings != null) {
                            for (Meeting m : userMeetings) {
                                if (m.getStatus().equals("minuted")) {
                                    System.out.println("MEETING NAME IN USERMEETINGS -----" + m.getMeetingName());

                                    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
                                    Date startDate = m.getStartTime();
                                    Date endDate = m.getStartTime();
                                    String starttime = df.format(startDate);
                                    String endtime = df.format(startDate);
                                    int meetingID = m.getMeetingID();


                    %>

                    <p><strong>Meeting Name: </strong><%=m.getMeetingName()%></p>
                    <p><strong>Meeting Start Time: </strong><%=starttime%></p>
                    <p><strong>Meeting End Time: </strong><%=endtime%></p>  
                    <p><strong>Attendees: </strong>
                        <%  
                            String attendeesStr = m.getAttendees();
                            String[] attendeesArr= attendeesStr.split(", ");
                            for(int i = 0; i < attendeesArr.length; i++){
                                String attendee = attendeesArr[i];
                                if(!attendee.equals("incogiieportal@gmail.com")){
                                    User guest = profileController.getUser(attendee);
                                    out.println(guest.getName());
                                    if(i != attendeesArr.length-1){
                                        out.println(" ");
                                    }
                                }
                            }
                        %>
                    </p>
                    <button type="submit" class="btn-xs btn-success" data-toggle="modal" data-target="#view<%=meetingID%>">View Meeting Minutes</button>

                    <%

                        //only prints when the meeting has ended
                        System.out.println("MEETING STATUS IN VIEW ALL MEETING JSP ----- " + m.getStatus());

                    %>



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

                                            int company = meeting.getMenteeCompany();
                                            //one sheet of meeting minutes
                                            ArrayList<MeetingMinutes> minutes = minutesController.getMeetingMinutesByMeeting(meetingID);

                                            if (minutes == null || minutes.size() == 0) {
                                                out.println("No meeting minutes found!");
                                            } else {

                                                //to get the fixed values 
                                                MeetingMinutes first = minutes.get(0);
                                                String mName = "";
                                                if (first != null) {
                                                    String email = first.getMentorEmail();
                                                    if (email != null && !email.equals("")) {
                                                        Mentor mentor = mentorController.getMentor(email);
                                                        if (mentor != null) {
                                                            mName = mentor.getName();
                                                        }
                                                        
                                                    }

                                                } 


                                        %>
                                        <div class="col-lg-6 well">
                                            Title : <%=first.getTitle()%><br>
                                            Mentor : <%= mName%><br>
                                            Comments : <%=first.getComments()%><br>
                                            Completed Tasks :
                                            <%
                                                // to get the completed tasks
                                                for (MeetingMinutes temp : minutes) {

                                                    Task current = taskController.displayTask(temp.getTaskID(), company);
                                                    if (current != null) {


                                            %>
                                            <%= current.getName()%>
                                            <%
                                                        }
                                                    }
                                                }
                                            %>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <form action = "editMeetingMinutes.jsp" method ="post">
                                            <input type ="hidden" name ="mid" value ="<%=meetingID%>">
                                            <button type="submit" class="btn btn-default">Edit</button>
                                        </form>

                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>  
                    <%
                            }

                        }
                    %>
                    <h2 class="col-lg-12 page-header"></h2>
                    <h2>Meeting without minutes</h2>
                    <%
                        for (Meeting m : userMeetings) {

                            if (m.getStatus().equals("confirmed")) {
                                System.out.println("MEETING NAME IN USERMEETINGS -----" + m.getMeetingName());
                                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
                                Date startDate = m.getStartTime();
                                Date endDate = m.getStartTime();
                                String starttime = df.format(startDate);
                                String endtime = df.format(startDate);
                                int meetingID = m.getMeetingID();
                    %>
                    <div class="col-lg-6 well">
                        <p><strong>Meeting Name: </strong><%=m.getMeetingName()%></p>
                        <p><strong>Meeting Start Time: </strong><%=starttime%></p>
                        <p><strong>Meeting End Time: </strong><%=endtime%></p>  
                        <a href = "addMeetingMinutes.jsp?id=<%=meetingID%>"> <button type="submit" class="btn-xs btn-success" data-toggle="modal" data-target="#view<%=meetingID%>">Add Meeting Minutes</button></a>
                    </div>


                    <%

                        }

                    %>


                    <%                        }
                    %>

                    <%
                        } 

                    %>



                </div>
            </div>
        </div>
    </body>
</html>
