<%-- 
    Document   : home
    Created on : Aug 5, 2017, 9:35:50 AM
    Author     : JEN
--%>

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
        <%@include file="navbar.jsp" %>
        <link href="css/dashboard.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            Mentee m = (Mentee) session.getAttribute("mentee");
            int menteeCompany = m.getCompanyid();
            String mentorEmail = m.getMentor_email();
            String mentorName = "";
            if(mentorEmail != null && !mentorEmail.isEmpty()){
                mentorName = mentorController.getMentor(mentorEmail).getName();
            }
            int companyStage = companyController.getCompany(menteeCompany).getCurrentStage();
            
        %>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="#">Home <span class="sr-only">(current)</span></a></li>
                        <li><a href="stages.jsp">Progress</a></li>
                        <li><a href="#">Meetings</a></li>
                        <li><a href="#">Calendar</a></li>
                        <li><a href="viewCompanyProfile.jsp">View Company Profile</a></li>
                        <li><a href="viewAllCompanies.jsp">View All Companies</a></li>
                        <li><a href="viewAllMentors.jsp">View All Mentors</a></li>
                        <%
                            if(m != null){
                                if(m.getMentee_type().equals("regular")){
                        %>
                                <li><a href="requestForMentor.jsp?type=incubator">Request For Mentor</a></li>
                        <%
                                }
                        %>
                                <li><a href="requestForMentor.jsp?type=open">Open Mentorship Request</a></li>
                        <%
                            }
                        %>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li><a href="">Nav item</a></li>
                        <li><a href="">Nav item again</a></li>
                        <li><a href="">One more nav</a></li>
                        <li><a href="">Another nav item</a></li>
                        <li><a href="">More navigation</a></li>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li><a href="">Nav item again</a></li>
                        <li><a href="">One more nav</a></li>
                        <li><a href="">Another nav item</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h1 class="page-header">Dashboard</h1>

                    <div class="row placeholders">
                        <div class="col-xs-6 col-sm-3">
                            <img src="img/statistics.png" width="100"/>
                            <h4>Current Stage</h4>
                            
                            <span class="text-muted"><%=companyStage%></span>
                        </div>
                        <div class="col-xs-6 col-sm-3 ">
                            <img src="img/clipboard.png" width="100" height="100" alt=""/>
                            <h4>Current Task </h4>
                            <span class="text-muted">Prototype</span>
                        </div>
                        <div class="col-xs-6 col-sm-3 placeholder">
                            <img src="img/interview.png" width="100"  alt=""/>
                            <h4>Next Scheduled Meeting</h4>
                            <span class="text-muted">Thursday, 14th November 2017</span>
                        </div>
                        <div class="col-xs-6 col-sm-3 placeholder">
                            <img src="img/educator (1).png" width="100"   alt=""/>
                            <img src="img/educator.png" width="100"   alt=""/>
                            <h4>Assigned Mentor</h4>
                            <span class="text-muted"><%=mentorName%></span>
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
