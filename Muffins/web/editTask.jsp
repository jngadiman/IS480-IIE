<%-- 
    Document   : editTask
    Created on : Jul 5, 2017, 11:16:02 PM
    Author     : JEN
--%>

<%@page import="DAO.TaskDAO"%>
<%@page import="MODELS.Task"%>
<%@page import="java.util.Optional"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Stages</title>
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
</script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <section style="background:#efefe9;">
            <div class="container">
                <div class="row">
                    <div class="board">
                        <form class="form-horizontal" method="post" action="/action_page.php">
                            <fieldset>
                                <legend>Edit Task</legend>
                                <%int taskID = 1;
                                Task task = TaskDAO.getTask(taskID);
                                %>
                                
                                <div class="col-sm-2">Task Name</div>
                                <div class="col-sm-8">
                                    <div class="form-group">
                                        <label for="inputTaskName" class="col-lg-4 control-label">Task Name</label>
                                        <div class="col-lg-5">
                                            <% 
                                                try{
                                                   if(task.getName()== null){
                                                        String taskName = task.getName();
                                                        out.println("<input type='text' class='form-control' id='inputTaskName' placeholder=" + taskName +">");
                                                    }
                                                }
                                                catch (NullPointerException nullPointer){
                                                   out.println("<input type='text' class='form-control' id='inputTaskName' placeholder= taskName>");
                                                }
                                                
                                            %>
                                            
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputTaskStage" class="col-lg-4 control-label">Stage</label>
                                        <div class="col-lg-5">
                                            <% 
                                                try{
                                                   if(task.getStage() != 0){
                                                    int taskStage = task.getStage();
                                                    out.println("<input type='text' class='form-control' id='inputTaskStage' placeholder=" + taskStage + ">");
                                                    }
                                                }
                                                catch (NullPointerException nullPointer){
                                                   out.println("<input type='text' class='form-control' id='inputTaskStage' placeholder=taskStage>");
                                                }
                                                
                                            %>
                                           
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputTaskDescription" class="col-lg-4 control-label">Task Description</label>
                                        <div class="col-lg-8">
                                            
                                            <span class="help-block">Go into details on what are the task's information. </span>
                                            <% 
                                                try{
                                                   if(task.getDescription() != ""){
                                                        String taskDes = task.getDescription();
                                                        out.println("<textarea class='form-control' rows='3' id='inputTaskDescription' placeholder=" + taskDes + "><textarea>");
                                                    }
                                                }
                                                catch (NullPointerException nullPointer){
                                                   out.println("<input type='text' class='form-control' id='inputTaskStage' placeholder=taskDescription>");
                                                }
                                            %>
                                        </div>
                                    </div>

                                    <div class="form-group"> <!-- Date input -->
                                        <label for="inputDate" class="col-lg-4 control-label">Date</label>
                                        <input class="col-lg-5 col-lg-offset-0" id="inputDate" name="date" placeholder="MM/DD/YYY" type="text"/>
                                    </div>
                                    
                                    <div class="form-group">
                                        <div class="col-lg-8 col-lg-offset-2">
                                            <button type="reset" class="btn btn-default">Cancel</button>
                                            <button type="submit" class="btn btn-primary">Submit</button>
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
