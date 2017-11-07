<%-- 
    Document   : viewMeetingMinutes
    Created on : Aug 5, 2017, 6:08:23 PM
    Author     : JJAY
--%>

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
            <h2 class="page-header col-lg-9  col-sm-offset-2">View Meeting Minutes</h2>
            <div class="col-lg-9 well col-sm-offset-2">

                <%           ArrayList<ArrayList<MeetingMinutes>> minutes = minutesController.getAllMeetingMinutes();

                    for (ArrayList<MeetingMinutes> mm : minutes) {
                        for (MeetingMinutes each : mm) {
                            System.out.println(each.getMinutesID());
                %>
                <!--EACH = <%=each.getMinutesID()%> DELETE -->
                <%      }
                    }
                %>

                
                    <div class="row">
                        
                        <%
                        ArrayList<ArrayList<MeetingMinutes>> minutesArray = minutesController.getMeetingMinutesOfCompany(user.getCompanyid());
                        for (ArrayList<MeetingMinutes> min : minutesArray){
                            if(min!=null&&!min.isEmpty()){
                                MeetingMinutes mm = min.get(0);
//                                ArrayList<String> taskList = new ArrayList<String>();
//                                for(MeetingMinutes m:min){
//                                    if(m!=null&&m.getTask_id()!=0){
//                                    taskList.add(taskController.displayTask(m.getTask_id()).getName());
//                                    }
//                                }
                            String date = new SimpleDateFormat("dd-MM-yyyy").format(meetingController.getMeetingByMeetingID(mm.getMeeting_id()).getStartTime());
                           %>
                           <li><button type="submit" class="btn-xs btn-success" data-toggle="modal" data-target="#view<%=mm.getMinutesID()%>"><%=date%></button></li>
                           <!-- Modal -->
                        <div id="view<%=mm.getMinutesID()%>" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title"><%=date%></h4>
                                    </div>
                                    <div class="modal-body">
                                        Title : <%=mm.getTitle()%><br>
                                        Mentor : <%=mentorController.getMentor(mm.getMentor_email()).getName()%><br>
                                      Comments : <%=mm.getComments()%><br>
<!--                                        Tasks : -->
                                        <%
                                       // for (String t: taskList){
                                       //    out.println("<li>"+t+"</li>");
                                        //}
                                        %>
                                        
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }else{
                                out.println("No meeting minutes detected!");
                            }
                            
                        }
                        %>
                    
                    </div>

                    
                </div>
            </div>
        </div>
</body>
</html>
