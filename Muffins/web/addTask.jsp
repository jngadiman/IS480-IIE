<%-- 
    Document   : addStages
    Created on : Jul 5, 2017, 9:06:58 PM
    Author     : JEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="browserCloseEvent.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Task</title>
        <%@include file="navbar.jsp" %>
        <link href="css/stages.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-datepicker.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                var date_input = $('input[name="date"]'); //our date input has the name "date"
                var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
                var options = {
                    format: 'yyyy-mm-dd',
                    container: container,
                    todayHighlight: true,
                    autoclose: true,
                };
                date_input.datepicker(options);
            })
        </script>
    </head>
    <body>
        <section style="background:#efefe9;">
            <div class="container">
                    <div class="board">
                        <%                            String msg = "";
                            if (request.getAttribute("status") != null) {
                                msg = (String) request.getAttribute("status");
                                out.println(msg);
                            }
                        %>
                        <form class="form-horizontal" method="post" action="addTaskServlet">
                            <fieldset>
                                

                                <div class="col-sm-8 col-sm-offset-2">
                                    <h2>Add Task</h2>

                                    <div class="form-group">
                                        
                                            <label for="inputTaskName" class="col-lg-4 control-label">Task Name</label>
                                            <div class="col-lg-7">
                                                <input type="text" class="form-control" id="taskName" placeholder="Task Name" name="taskName">
                                            </div>
                                       
                                    </div>
                                    <div class="form-group">
                                        <label for="inputTaskStage" class="col-lg-4 control-label">Stage</label>
                                        <div class="col-lg-7">
                                            <select class="form-control" id="select" name="taskStage">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                        </div>	
                                    </div>
<div class="form-group">
                                        <label for="inputTaskDescription" class="col-lg-4 control-label" name = "taskDescription">Task Description</label>
                                        <div class="col-lg-7">
                                             <textarea class="form-control" rows="3" id="inputTaskDescription" name="taskDescription" placeholder="Enter your description here"></textarea>
                                            <span class="help-block">Go into details on what are the task's information. </span>
                                        </div>
</div>
<div class="form-group">
                                        <!-- Date input -->
                                        <label for="inputDate" class="col-lg-4 control-label">Deadline</label>
                                         <div class="col-lg-7">
                                        <input class="form-control"  name="date" placeholder="yyyy-MM-dd" type="text"/>
                                         </div>
</div>
                                        <div class="form-group">
                                        <div class="col-lg-8 col-lg-offset-4">
                                            <br/><br/>
                                            <button type="reset" class="btn btn-default">Reset</button>
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                    <div align="right"><a href="stages.jsp">Go Back to Stages</a></div>
                                </div>
                                <div class="col-sm-2"></div>

                            </fieldset>
                        </form>
                    </div>
        </section>

    </body>
</html>
