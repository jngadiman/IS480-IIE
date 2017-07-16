<%-- 
    Document   : addStages
    Created on : Jul 5, 2017, 9:06:58 PM
    Author     : JEN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="MODELS.Task"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Task</title>
        <%@include file="navbar.jsp" %>
        <link href="css/stages.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/npm.js" type="text/javascript"></script>
        <link href="css/bootstrap-datepicker.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <script>
    $(document).ready(function(){
      var date_input=$('input[name="date"]'); //our date input has the name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'mm/dd/yyyy',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
    })
    
    
/*    function validateForm() {
        var taskName = document.forms["editTask"]["taskName"].value;
        if (taskName == "") {
            alert("Task name must be filled out!");
            return false;
        }
        
        var stage = document.forms["editTask"]["stage"].value;
        if (stage == "") {
            alert("Stage number must be filled out!");
            return false;
        }
        
        var deadline = document.forms["editTask"]["deadline"].value;
        if (deadline == "") {
            alert("Deadline must be filled out!");
            return false;
        }
    } */
    </script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <section style="background:#efefe9;">
            <div class="container">
                <div class="row">
                    <div class="board">
                        <%
                            ArrayList<String> errorList = (ArrayList<String>)request.getAttribute("errorMessage");
                            if(errorList != null && errorList.size() > 0){
                                for(String s: errorList){
                                    out.println("<h4>"+ s + "</h4>");
                                }
                            }
                        %>
                        <form class="form-horizontal" method="post" action="editTaskServlet" name="editTask" onsubmit="return validateForm()">
                            <fieldset>
                                <legend>Edit Task</legend>
                                <%
                                    Task task = (Task) request.getAttribute("taskToBeDisplayed");
                                    String name = task.getName();
                                    int stage = task.getStage();
                                    String description = task.getDescription();
                                    Date deadline = task.getDeadline();
                                %>
                                <div class="col-sm-2">blank</div>
                                <div class="col-sm-8">
                                    <div class="form-group">
                                        <label for="inputTaskName" class="col-lg-4 control-label">Task Name</label>
                                        <div class="col-lg-5">
                                            <input type="text" class="form-control" id="inputTaskName" name="taskName" value="<%= name%>" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputTaskDescription" class="col-lg-4 control-label">Task Description</label>
                                        <div class="col-lg-8">
                                            <textarea class="form-control" rows="3" id="inputTaskDescription" name="taskDesc"><%= description%></textarea>
                                            <span class="help-block">Go into details on what are the task's information. </span>
                                        </div>
                                    </div>
                                    <div class="form-group"> <!-- Date input -->
                                        <label for="inputDate" class="col-lg-4 control-label">Deadline</label>
                                        <input class="col-lg-5 col-lg-offset-0" id="inputDate" name="deadline" value="<%= new SimpleDateFormat("dd-MM-yyyy").format(deadline)%>" type="text" required/>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputTaskStage" class="col-lg-4 control-label">Stage</label>
                                        <div class="col-lg-5">
                                            <input type="text" class="form-control" id="inputTaskStage" name="stage" value="<%= stage%>" required>
                                        </div>
                                    </div>
                                        <input type="hidden" name="taskId" value="<%= task.getTaskId()%>">
                                        <input type="hidden" name="companyId" value="<%= task.getCompanyID()%>">
                                        <input type="hidden" name="isCompleted" value="<%= task.isIsCompleted()%>">
                                    <div class="form-group">
                                        <div class="col-lg-8 col-lg-offset-2">
                                            <button type="reset" class="btn btn-default" value="cancel" name="Cancel">Cancel</button>
                                            <button type="submit" class="btn btn-primary" value="submit" name="Submit">Submit</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2"></div>

                            </fieldset>
                        </form>
                    </div>
                </div>
        </section>

    </body>
</html>