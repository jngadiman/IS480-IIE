<%-- 
    Document   : EIRHomepage
    Created on : Oct 25, 2017, 11:54:42 AM
    Author     : Xinyao
--%>

<%@page import="java.util.HashMap"%>
<%@page import="MODELS.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="DAO.ProgramStageDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title> 
        <!--<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>-->
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <%@include file="sidenav.jsp" %>
        <link href="css/dashboard.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <!-- <img src="img/smu.jpg" alt="" width="70%"/> -->
                    <h1 class="page-header" style="font-family: serif; font-style: italic">Institute of Innovation & Entrepreneurship</h1>

                    <div class="row placeholders">
                        <%                            
                            int numStages = 4;
                            for (int i = 1; i <= numStages; i++) {
                                ArrayList<Company> companies = new ArrayList<Company>();
                                companies = companyController.getCompaniesInStage(i);
                                String stageName = ProgramStageDAO.getStage(i);
                        %>
                        <div class="col-xs-6 col-sm-3 placeholder">
                            <h1><u><%="Stage " + i%></u></h1>
                            <h4><%=stageName%></h4>
                            <br>
                            <button href="#<%=i%>" class="btn btn-default btn-s" data-toggle="collapse"><%=companies.size()%></button>
                            <div id="<%=i%>" class="collapse">

                                <%
                                    out.println("<br>");
                                    if (companies != null && companies.size() != 0) {
                                        for (Company c : companies) {
                                            //out.println("<ul>" + c.getName() + "</ul>");
                                            out.println(c.getName());
                                            out.println("<br>");
                                        }
                                    } else {

                                    }
                                %>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <br>
                    <div class="row placeholders">
                        <div class="col-xs-3 col-sm-3">
                            <a href="adminViewAllRequests.jsp">
                                <img src="img/manager.png" width="100"/></a>
                            <h4>Pending Mentor Requests</h4>
                        </div>
                        
                        <div class="col-xs-3 col-sm-3">
                            <a href="EIRAssignMentor.jsp"><img src="img/link.png" width="100"/></a>
                            <h4>Assign Mentor</h4>
                        </div>
                        <div class="col-xs-3 col-sm-3">
                            <a href="adminShowRelationships.jsp"><img src="img/relationship.png" width="100"/></a>
                            <h4>View Relationships</h4>
                        </div>
                        
                        <div class="col-xs-3 col-sm-3">
                            <a href="viewAllMeetings.jsp"><img src="img/calendar.png" width="100"/></a>
                            <h4>Upcoming Meetings</h4>
                        </div>
                    </div>
                        
                    
                </div>
            </div>
        </div>
    </body>
</html>

