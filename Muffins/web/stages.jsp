<%-- 
    Document   : stages
    Created on : Jun 25, 2017, 10:41:17 PM
    Author     : JEN
--%>

<%@page import="DAO.ProgramStageDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="MODELS.User"%>
<%@page import="CONTROLLER.taskController"%>
<%@page import="DAO.TaskDAO"%>
<%@page import="MODELS.Task"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Company"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stages</title>
        <link href="css/stages.css" rel="stylesheet" type="text/css"/>
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <section style="background:#efefe9;">
            <div class="container col-lg-offset-1">
                <div class="row">
                    <div class="board">
                        <div class="board-inner">
                            <ul class="nav nav-tabs" id="myTab">
                                <div class="liner"></div>
                                <li class="active">
                                    <a href="#one" data-toggle="tab" title="one">
                                        <span class="round-tabs one">
                                            H
                                        </span> 
                                    </a></li>

                                <li><a href="#two" data-toggle="tab" title="two">
                                        <span class="round-tabs two">
                                            1
                                        </span> 
                                    </a>
                                </li>
                                <li><a href="#three" data-toggle="tab" title="three">
                                        <span class="round-tabs three">
                                            2
                                        </span> </a>
                                </li>

                                <li><a href="#four" data-toggle="tab" title="four">
                                        <span class="round-tabs four">
                                            3
                                        </span> 
                                    </a></li>

                                <li><a href="#five" data-toggle="tab" title="five">
                                        <span class="round-tabs five">
                                            4
                                        </span> </a>
                                </li>

                            </ul></div>


                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="one">

                                <h3 class="head text-center">HOME<span style="color:#f48260;">♥</span></h3>
                                <p class="narrow text-center">
                                    Welcome!<br/>
                                    <%                                         int stage = 0;
                                        user = (User) session.getAttribute("user");
                                        Company c = CompanyDAO.getCompany(user.getCompanyid());
                                        if (c != null) {
                                            stage = c.getCurrentStage();%>
                                    You are currently at Stage <%=stage%>
                                    <%
                                        }
                                        if (stage == 1) {
                                    %>

                                <div class="progress ">
                                    <div class="progress-bar progress-bar-striped active" role="progressbar"
                                         aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%">
                                        0%
                                    </div>
                                </div>
                                <%} else if (stage == 2) {%>

                                <div class="progress ">
                                    <div class="progress-bar progress-bar-striped active" role="progressbar"
                                         aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width:25%">
                                        25%
                                    </div>
                                </div>

                                <%
                                } else if (stage == 3) {%>
                                <div class="progress-bar progress-bar-striped active" role="progressbar"
                                     aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:50%">
                                    50%
                                </div>

                                <%
                                } else if (stage == 4) {%>
                                <div class="progress-bar progress-bar-striped active" role="progressbar"
                                     aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width:75%">
                                    75%
                                </div>
                                <%}
                                %> 

                                <p class="text-center">
                                    <a href="viewTasks.jsp?id=<%=stage%>" class="btn btn-success btn-outline-rounded green">View tasks at current stage<span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                                </p>
                            </div>
                                <%                            
                                HashMap<Integer, String> numbers = new HashMap<>();
                                numbers.put(1, "one");
                                numbers.put(2, "two");
                                numbers.put(3, "three");
                                numbers.put(4, "four");
                                numbers.put(5, "five");
                                int numStages = 4;
                                for (int i = 1; i <= numStages; i++) {
                                    ArrayList<Company> companies = new ArrayList<Company>();
                                    companies = companyController.getCompaniesInStage(i);
                                    String stageName = ProgramStageDAO.getStage(i);
                                    String id = numbers.get(i+1);
                            %>
                                    <div class="tab-pane fade" id="<%=id%>">
                                        <h3 class="head text-center">Stage <%=i%></h3>
                                        <p class="narrow text-center">
                                            <b><%=stageName%></b><br/>
                                        </p>
                                        <p class="text-center">
                                            <a href="viewTasks.jsp?id=<%=i%>" class="btn btn-success btn-outline-rounded green">  Stage <%=i%> Tasks <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                                        </p>
                                    </div>
                            <%
                                }
                            %>
                            <!--  
                            <div class="tab-pane fade" id="two">
                                <h3 class="head text-center">Stage 1<sup>™</sup> Profile</h3>
                                <p class="narrow text-center">
                                    <b>Business model validation stage</b><br/>
                                </p>

                                <p class="text-center">
                                    <a href="viewTasks.jsp?id=1" class="btn btn-success btn-outline-rounded green">  Stage 1 Tasks <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                                </p>

                            </div>
                            <div class="tab-pane fade" id="three">
                                <h3 class="head text-center">Stage 2</h3>
                                <p class="narrow text-center">
                                    <b>Innovation Development stage</b> ​<br/>
                                </p>

                                <p class="text-center">
                                    <a href="viewTasks.jsp?id=2" class="btn btn-success btn-outline-rounded green">  Stage 2 Tasks  <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                                </p>

                            </div>
                            <div class="tab-pane fade" id="four">
                                <h3 class="head text-center">Stage 3</h3>
                                <p class="narrow text-center">
                                    <b>Go-To-Market & early customer acquisition stage</b> ​<br/>
                                </p>

                                <p class="text-center">
                                    <a href="viewTasks.jsp?id=3" class="btn btn-success btn-outline-rounded green">  Stage 3 Tasks <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                                </p>
                            </div>

                            <div class="tab-pane fade" id="five">
                                <div class="text-center">
                                    <i class="img-intro icon-checkmark-circle"></i>
                                </div>
                                <h3 class="head text-center">Stage 4</h3>
                                <p class="narrow text-center">
                                    <b>Business Plan/Financial Modelling stage</b> ​<br/>
                                </p>

                                <p class="text-center">
                                    <a href="viewTasks.jsp?id=4" class="btn btn-success btn-outline-rounded green">  Stage 4 Tasks <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                                </p>


                            </div> -->

                        </div>
                    </div>
                </div>
        </section>

    </body>
</html>
