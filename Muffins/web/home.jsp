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
        <title>Homepage</title>
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
               
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                     <img src="img/smutrial.jpg" alt="" width="100%" class="rounded"/>
                     <h1 class="page-header">Institute of Innovation & Entrepreneurship</h1>
<!--                    <h1 class="page-header" style="font-family: serif; font-style: italic">Institute of Innovation & Entrepreneurship</h1>-->

                    <div class="row placeholders">
                        <div class="col-xs-6 col-sm-3">
                            <span class="glyphicon glyphicon-signal" style="font-size: 80px"></span>
                            <h4>Current Stage</h4>
                            
                            <span class="text-muted"><%=companyStage%></span>
                        </div>
                        <div class="col-xs-6 col-sm-3 ">
                            <%
                             Company userComp = companyController.getCompany(m.getCompanyid());
                            %>
                            
                           <span class="glyphicon glyphicon-list" style="font-size: 80px"></span>
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
                            <span class="glyphicon glyphicon-calendar" style="font-size: 80px"></span>
                            <h4>Next Scheduled Meeting</h4>
                            <span class="text-muted">Thursday, 14th November 2017</span>
                        </div>
                        <div class="col-xs-6 col-sm-3 placeholder">
                            <%session.setAttribute("mentor_email", mentorEmail);%>
                            
                            <span class="glyphicon glyphicon-apple" style="font-size: 80px"></span>
                            
                            
                            <h4>Assigned Mentor</h4>
                            <%if (mentorName == null || mentorName.isEmpty()){
                                %>
                            <span class="text-muted">Currently No Mentor</span>
                            <%
                            } else{%>
                            <span class="text-muted"><%=mentorName%></span>
                            <%}%>
                        </div>

                    </div>
<!--
                    <h2 class="sub-header">Section title</h2>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Header</th>
                                    <th>Header</th>
                                    <th>Header</th>
                                    <th>Header</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1,001</td>
                                    <td>Lorem</td>
                                    <td>ipsum</td>
                                    <td>dolor</td>
                                    <td>sit</td>
                                </tr>
                                <tr>
                                    <td>1,002</td>
                                    <td>amet</td>
                                    <td>consectetur</td>
                                    <td>adipiscing</td>
                                    <td>elit</td>
                                </tr>
                                <tr>
                                    <td>1,003</td>
                                    <td>Integer</td>
                                    <td>nec</td>
                                    <td>odio</td>
                                    <td>Praesent</td>
                                </tr>
                                <tr>
                                    <td>1,003</td>
                                    <td>libero</td>
                                    <td>Sed</td>
                                    <td>cursus</td>
                                    <td>ante</td>
                                </tr>
                                <tr>
                                    <td>1,004</td>
                                    <td>dapibus</td>
                                    <td>diam</td>
                                    <td>Sed</td>
                                    <td>nisi</td>
                                </tr>
                                <tr>
                                    <td>1,005</td>
                                    <td>Nulla</td>
                                    <td>quis</td>
                                    <td>sem</td>
                                    <td>at</td>
                                </tr>
                                <tr>
                                    <td>1,006</td>
                                    <td>nibh</td>
                                    <td>elementum</td>
                                    <td>imperdiet</td>
                                    <td>Duis</td>
                                </tr>
                                <tr>
                                    <td>1,007</td>
                                    <td>sagittis</td>
                                    <td>ipsum</td>
                                    <td>Praesent</td>
                                    <td>mauris</td>
                                </tr>
                                <tr>
                                    <td>1,008</td>
                                    <td>Fusce</td>
                                    <td>nec</td>
                                    <td>tellus</td>
                                    <td>sed</td>
                                </tr>
                                <tr>
                                    <td>1,009</td>
                                    <td>augue</td>
                                    <td>semper</td>
                                    <td>porta</td>
                                    <td>Mauris</td>
                                </tr>
                                <tr>
                                    <td>1,010</td>
                                    <td>massa</td>
                                    <td>Vestibulum</td>
                                    <td>lacinia</td>
                                    <td>arcu</td>
                                </tr>
                                <tr>
                                    <td>1,011</td>
                                    <td>eget</td>
                                    <td>nulla</td>
                                    <td>Class</td>
                                    <td>aptent</td>
                                </tr>
                                <tr>
                                    <td>1,012</td>
                                    <td>taciti</td>
                                    <td>sociosqu</td>
                                    <td>ad</td>
                                    <td>litora</td>
                                </tr>
                                <tr>
                                    <td>1,013</td>
                                    <td>torquent</td>
                                    <td>per</td>
                                    <td>conubia</td>
                                    <td>nostra</td>
                                </tr>
                                <tr>
                                    <td>1,014</td>
                                    <td>per</td>
                                    <td>inceptos</td>
                                    <td>himenaeos</td>
                                    <td>Curabitur</td>
                                </tr>
                                <tr>
                                    <td>1,015</td>
                                    <td>sodales</td>
                                    <td>ligula</td>
                                    <td>in</td>
                                    <td>libero</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    -->
                </div>
            </div>
        </div>
    </body>
</html>
