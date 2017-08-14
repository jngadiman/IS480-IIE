<%-- 
    Document   : addMeetingMinutes
    Created on : Aug 4, 2017, 2:18:24 PM
    Author     : jiatung.lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="navbar.jsp" %>
    </head>
    <body>

        <div class="container">
            <h1 class="well">Meeting Minutes & Ratings</h1>

            <div class="col-lg-12 well">
                meeting id to be retrieved from previous page
                <input type ="hidden" name ="meeting_id"> 
                <div class="row">
                    <form method ="post" action ="addMeetingMinutesServlet">
                        <div class="col-sm-12">

                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Mentor</label> to be retrieved
                                    <!--                                    to insert mentor name from database
                                    <input id="mentor" name="mentor" type="text" placeholder="Enter Company Name Here.." class="form-control">-->
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Stage</label> to be retrieved
                                </div>

                                <!--                                    to insert current stage for company
                                <input id="stage" name="stage" type="text" placeholder="Enter Company Name Here.." class="form-control">-->
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Title</label>
                                    <input class="form-control" type ="text" name ="title" placeholder="Enter Title"> <br/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Tasks</label><br/>
                                    <input class type="checkbox" name="tasks_completed" value="1"> task 1<br>
                                    <input type="checkbox" name="tasks_completed" value="2"> task 2 <br/></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label>Comment</label>
                                    <textarea class="form-control" rows="3" id="comment" name="notes" placeholder="Enter Comment"></textarea>
                                </div>
                            </div>

                            <!--                            <div class="row">
                                                            <div class="col-sm-6 form-group">
                                                                <label>Date</label>
                                                                <input id="date" name="date" type="text" placeholder="Enter Date" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-6 form-group">
                                                                <label>Purpose</label>
                                                                <select class="form-control" id="industry" name="industry">
                                                                    <option value="validateModel">Validate Business Model Canvas</option>
                                                                    <option value="compAnalysis">Competitor Analysis</option>
                                                                    <option value="marketSizing">Market Sizing</option>
                                                                    <option value="defineTargetAudience">Define Target Audience</option>
                                                                    <option value="ensureProductMarketFit">Ensure Product-market-fit(Value proposition for identified target audience)</option>
                                                                    <option value="defineRevenueModel">Define Revenue model</option>
                                                                    <option value="defineDistributionChannel">Define Distribution Channels</option>
                                                                    <option value="others">Others</option>
                                                                </select>
                                                            </div>
                                                        </div>
                            
                                                        <div class="row">
                                                            <div class="col-sm-6 form-group">
                                                                <label>Comment</label>
                                                                <textarea class="form-control" rows="3" id="comment" name="notes" placeholder="Enter Comment"></textarea>
                                                            </div>
                                                        </div>
                            
                                                        <div class="row">
                                                            <div class="col-sm-6 form-group">
                                                                <label>Deliverables</label> *to be retrieve from database
                                                                 <select class="form-control" id="deliverables" name="deliverables">
                                                                    <option value="1">1</option>
                                                                    <option value="2">2</option>
                                                                </select>
                                                                
                                                            </div>
                                                        </div>
                            
                                                        <div class="row">
                                                            <div class="col-sm-6 form-group">
                                                                <label>Dateline</label>
                                                                <input id="date" name="date" type="text" placeholder="Enter Dateline" class="form-control">
                                                            </div>
                                                        </div>-->


                            <input type="submit" class="btn btn-lg btn-info" value="Submit">					
                        </div>
                    </form> 
                </div>
            </div>
        </div>
    </body>
</html>
