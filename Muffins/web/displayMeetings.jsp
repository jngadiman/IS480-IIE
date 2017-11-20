<%-- 
    Document   : displayMeetings
    Created on : Nov 21, 2017, 4:32:35 AM
    Author     : Jennefer Ngadiman
--%>

<%@page import="CONTROLLER.mentorController"%>
<%@page import="CONTROLLER.minutesController"%>
<%@page import="MODELS.MeetingMinutes"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="MODELS.Meeting"%>
<%@page import="java.util.HashMap"%>
<%@page import="CONTROLLER.meetingController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Meetings</title>
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="col-sm-8 col-sm-offset-3">
                <h1 class="page-header">View Meeting</h1>

                <div>

                    <button type="submit" class="btn btn-xs btn-info center-block" data-toggle="modal" data-target="#addMeeting">Add a Meeting</button>
                    <br>
                    <div id="addMeeting" class="modal fade" role="dialog">

                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">

                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Create Meeting</h4>
                                </div>
                                <form role="form" method="POST" action="meetingServlet">
                                    <div class="modal-body">

                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">Meeting Name</label>
                                            <input class="form-control" id="meetingName" name="meetingName" type="text" placeholder="Enter Meeting Name" class="form-control" required>
                                        </div>
                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">Location</label>
                                            <input class="form-control" id="location" name="location" type="text" placeholder="Enter Meeting Venue" class="form-control"  required>
                                        </div>
                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">Start Date</label>
                                            <input class="form-control" id="start_date" name="start_date" type="datetime-local" placeholder="Enter Start Date DD/MM/YYYY" class="form-control" required>
                                        </div>
                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">End Date</label>
                                            <input class="form-control" id="end_date" name= "end_date" type="datetime-local" placeholder="Enter End Date DD/MM/YYYY" class="form-control" required>
                                        </div>
                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">Attendees</label>
                                            <input class="form-control" id="attendees" name="attendees" type="text" placeholder="Enter The Emails of the Attendees" class="form-control" required>
                                        </div>
                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">Status</label>
                                            <select class="form-control" id="status" name="status" class="form-control" required>
                                                <option value="confirmed">confirmed</option>
                                                <option value="tentative">tentative</option>
                                                <option value="cancelled">cancelled</option>
                                            </select>
                                        </div>


                                    </div>

                                    <div class="modal-footer">
                                        <button type="submit" value="Add Meeting" class="btn btn-xs btn-default">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <%//                        HashMap<Company, ArrayList<Meeting>> hash = new HashMap<>();
//                        ArrayList<Company> companies = companyController.getAllCompanies();
//                        for (Company c : companies) {
//                            ArrayList<Meeting> meetings = meetingController.getMeetingsOfCompany(c.getId());
//                            hash.put(c, meetings);
//                        }
                        ArrayList<Meeting> meetings = meetingController.getMeetingsOfCompany(user.getCompanyid());


                    %>

                    <%                                if (meetings != null && !meetings.isEmpty()) {
                    %>
                    <table class="table table-hover table-striped table-bordered ">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Location</th>
                                <th>Time</th>
                                <th>Attendees</th>
                                <th>Status</th>
                                <th>Edit</th>
                                <th>Meeting Minutes</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Meeting m : meetings) {

                                    out.println("<tr>");
                                    out.println("<td>" + m.getMeetingName() + "</td>");
                                    out.println("<td>" + m.getLocation() + "</td>");
                                    out.println("<td>" + new SimpleDateFormat("dd-MM-yyyy hh:mm").format(m.getStartTime()) + " - " + new SimpleDateFormat("hh:mm a").format(m.getEndTime()) + "</td>");
                                    out.println("<td>" + m.getAttendees() + "</td>");
                                    out.println("<td>" + m.getStatus() + "</td>");
                                    out.println("<td><button type='submit' class='btn btn-xs btn-warning center-block' data-toggle='modal' data-target='#editMeeting" + m.getMeetingID() + "'>Edit</button></td>");
                                    if (m.getStatus().equals("minuted")) {
                                        int company = m.getMenteeCompany();
                                        //one sheet of meeting minutes
                                        ArrayList<MeetingMinutes> minutes = minutesController.getMeetingMinutesByMeeting(m.getMeetingID());
                                        //to get the fixed values of meeting minutes
                                        MeetingMinutes first = minutes.get(0);
                                        String mName = "";
                                        if (first != null) {
                                            String email = first.getMentor_email();
                                            if (email != null && !email.equals("")) {
                                                Mentor mentor = mentorController.getMentor(email);
                                                if (mentor != null) {
                                                    mName = mentor.getName();
                                                }

                                            }

                                        }
                                        out.println("<td><button type='submit' class='btn btn-xs btn-warning center-block' data-toggle='modal' data-target='#viewMeetingMinutes" + m.getMeetingID() + "'>View </button></td>");
                                        %>
                            <!--MODAL TO VIEW MEETING MINUTES -->
                        <div id="viewMeetingMinutes<%=m.getMeetingID()%>" class="modal fade" role="dialog">

                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Meeting Minutes <%=m.getMeetingID()%></h4>
                                    </div>

                                    <div class="modal-body">

                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">Title of Meeting Minutes</label>
                                            <%=first.getTitle()%>

                                        </div>
                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">Mentor Name</label>
                                            <%= mName%>
                                        </div>
                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">Comments</label>
                                            Comments : <%=first.getComments()%><br>
                                        </div>
                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">Mentor Rating</label>
                                            <%=first.getMentorRating()%><br>
                                        </div>
                                        <div class="col-sm-6 form-group required">
                                            <label class="control-label">Mentor Rating Comments</label>
                                            <%=first.getMentorRatingComment()%><br>
                                        </div>


                                    </div>

                                    <div class="modal-footer">
                                        <form action = "editMeetingMinutes.jsp" method ="post">
                                            <input type ="hidden" name ="mid" value ="<%=m.getMeetingID()%>">
                                            <button type="submit" class="btn btn-default">Edit</button>
                                        </form>

                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                                    </div>

                                </div>
                            </div>
                        </div>

                            
                            
                            <%
                                    } else {
                                        
                                        out.println("<td><a href = 'addMeetingMinutes.jsp?id=" + m.getMeetingID() + "'><button type='submit' class='btn btn-xs btn-warning center-block'>Add </button></a></td>");
                                    }

                                    out.println("</tr>");

                            %>
                        <div id="editMeeting<%=m.getMeetingID()%>" class="modal fade" role="dialog">

                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Edit Meeting <%=m.getMeetingID()%></h4>
                                    </div>
                                    <form role="form" method="POST" action="editMeetingDetailsServlet">
                                        <div class="modal-body">

                                            <div class="col-sm-6 form-group required">
                                                <label class="control-label">Meeting Name</label>
                                                <input class="form-control" id="meetingName" name="meetingName" type="text" value=<%=m.getMeetingName()%>class="form-control" required>
                                            </div>
                                            <div class="col-sm-6 form-group required">
                                                <label class="control-label">Location</label>
                                                <input class="form-control" id="location" name="location" type="text" value=<%=m.getLocation()%> class="form-control" required>
                                            </div>
                                            <div class="col-sm-6 form-group required">
                                                <label class="control-label">Start Date</label>
                                                <input class="form-control" id="start_date" name="start_date" type="datetime-local" value=<%=m.getStartTime()%> class="form-control" required>
                                            </div>
                                            <div class="col-sm-6 form-group required">
                                                <label class="control-label">End Date</label>
                                                <input class="form-control" id="end_date" name= "end_date" type="datetime-local" value=<%=m.getEndTime()%> class="form-control" required>
                                            </div>
                                            <div class="col-sm-6 form-group required">
                                                <label class="control-label">Attendees</label>
                                                <input class="form-control" id="attendees" name="attendees" type="text" value=<%=m.getAttendees()%> class="form-control" required>
                                            </div>
                                            <div class="col-sm-6 form-group required">
                                                <label class="control-label">Status</label>
                                                <select class="form-control" id="status" name="status" class="form-control" required>
                                                    <option value="confirmed">confirmed</option>
                                                    <option value="tentative">tentative</option>
                                                    <option value="cancelled">cancelled</option>
                                                </select>
                                            </div>
                                            <input type="hidden" id="meeting_id" name="meeting_id" value=<%=m.getMeetingID()%>>


                                        </div>

                                        <div class="modal-footer">
                                            <button type="submit" value="Book Timeslot" class="btn btn-xs btn-default" onclick="bookMeeting()">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                                                <%
                                }
                            } else {
                                out.println("No Meeting Found");
                            }


                        %>



                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </body>
</html>
