<%-- 
    Document   : home
    Created on : Aug 5, 2017, 9:35:50 AM
    Author     : JEN
--%>

<%@page import="MODELS.Task"%>
<%@page import="CONTROLLER.taskController"%>
<%@page import="MODELS.Company"%>
<%@page import="CONTROLLER.mentorController"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="MODELS.Mentee"%>
<%@include file="protect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <%@include file="sidenav.jsp" %>
        <link href="css/dashboard.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            
            Mentee m = (Mentee) session.getAttribute("mentee");
            int menteeCompany = 0;
            String mentorEmail= "";
            if(m!=null){
                menteeCompany = m.getCompanyid();
                mentorEmail = m.getMentor_email();
            }
            
            String mentorName = "";
            if(mentorEmail != null && !mentorEmail.isEmpty()){
                mentorName = mentorController.getMentor(mentorEmail).getName();
            }
            
            Company company = companyController.getCompany(menteeCompany);
            int companyStage = 0;
            if(company!=null){
                companyStage = company.getCurrentStage();
            }
            
            
        %>

        <div class="container-fluid">
            <div class="row">
                <!-- <img src="img/smu.jpg" alt="" width="70%"/> -->
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h1 class="page-header" style="font-family: serif; font-style: italic">Institute of Innovation & Entrepreneurship</h1>

                    <div class="row placeholders">
                        <div class="col-xs-6 col-sm-3">
                            <a href="stages.jsp"><img src="img/line-chart.png" width="100"/></a>
                            <h4>Current Stage</h4>
                            
                            <span class="text-muted"><%=companyStage%></span>
                        </div>
                        <div class="col-xs-6 col-sm-3 ">
                            <%
                             Company userComp = companyController.getCompany(m.getCompanyid());
                            %>
                            
                            <a href="viewTasks.jsp?id=<%=userComp.getCurrentStage()%>"><img src="img/test.png" width="100" height="100"/></a>
                            <h4>Current Task(s)</h4>
                            <%
                            ArrayList<Task> taskList= taskController.displayTasksByStageAndCompany(userComp.getCurrentStage(), userComp.getId());
                            if (taskList!=null && taskList.size()!=0){
                                out.println("<ul>");
                                for(Task t:taskList){
                                    if(t.getDeadline()!=null && !t.isIsCompleted())
                                    out.println("<li><span class='text-muted'>"+t.getName()+"</span></li>");
                                }
                                 out.println("</ul>");
                            }else{
                                out.println("<span class='text-muted'>No task found!</span>");
                            }
                            %>
                        </div>
                        <div class="col-xs-6 col-sm-3 placeholder">
                            <img src="img/calendar.png" width="100"  alt=""/>
                            <h4>Next Scheduled Meeting</h4>
                            <span class="text-muted">Thursday, 14th November 2017</span>
                        </div>
                        <div class="col-xs-6 col-sm-3 placeholder">
                            <%session.setAttribute("mentor_email", mentorEmail);%>
                            <a href="displayMentorProfile.jsp">
                                <img src="img/manager.png" width="100"   alt=""/>
                            </a>
                            
                            <h4>Assigned Mentor</h4>
                            <span class="text-muted"><%=mentorName%></span>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
