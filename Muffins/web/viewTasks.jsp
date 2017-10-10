<%-- 
    Document   : viewTasks
    Created on : Aug 15, 2017, 3:14:04 PM
    Author     : Jennefer Ngadiman
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="MODELS.User"%>
<%@page import="CONTROLLER.taskController"%>
<%@page import="DAO.TaskDAO"%>
<%@page import="MODELS.Task"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Company"%>
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

            <div class ="col-lg-8 col-lg-offset-3">
                <%                    int stage = 0;
                    String stageStr = request.getParameter("id");
                    if (stageStr != null && !stageStr.equals("")) {
                        stage = Integer.parseInt(stageStr);
                    }


                %>
                <h1 class='page-header'>Task List Stage <%=stage%></h1>
                <p>The tasks for the current stage are shown below:</p>            

                <%                    out.println("<tr>");

                    if (stage >= 1) {
                        ArrayList<Task> tasks = taskController.displayTasksByStageAndCompany(stage, user.getCompanyid());

                        if (tasks != null) {
                            if (tasks.isEmpty()) {
                                out.println("<h4>No tasks found</h4>");
                            } else {
                %>
                <table class="table table-hover table-striped table-bordered ">
                    <thead>
                        <tr>
                            <th>Task Name</th>
                            <th>Deadline</th>
                            <th>Status</th>
                            <th>Edit</th>
                            <th>Delete</th>
<!--                            <th>Meeting Minutes</th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <%
                                        for (Task t : tasks) {
                                            out.println("<tr>");
                                            out.println("<td>" + t.getName() + "</td>");
                                            if(t.getDeadline()!=null){
                                            out.println("<td>" + new SimpleDateFormat("dd-MM-yyyy").format(t.getDeadline()) + "</td>");
                                            }else{
                                                out.println("<td>Not set</td>");
                                            }
                                            if (t.isIsCompleted() == true) {
                                                out.println("<td>Completed</td>");
                                                //out.println("<td><button class='btn btn-success disabled btn-xs center-block'>completed</p></td>");

                                            } else {
                                                out.println("<td>Incomplete</td>");
                                                //out.println("<td><a href='completeTaskServlet?taskID=" + t.getTaskId() + "&stageID=" + stage + "' class='btn btn-warning btn-xs center-block'>incomplete</a></td>");

                                            }
                                            out.println("<input type='hidden' id=" + t.getTaskId() + "/>");
                                            out.println("<td><a href='displayTaskServlet?taskID=" + t.getTaskId() + " 'class ='btn btn-success btn-xs center-block'>Edit</a></td>");
                                            out.println("<td><a href='deleteTaskServlet?taskID=" + t.getTaskId() + "&stageID=" + stage + " ' class ='btn btn-xs btn-danger center-block'>Delete</a></td>");
                                            //out.println("<td><a href='meetingMinutesTasksServlet?taskID=" + t.getTaskId() + "&stageID=" + stage + " ' class ='btn btn-sccess btn-outline-rounded green'>Delete</a></td>");
                                            out.println("</tr>");
                                        }
                                    }

                                } else {
                                    out.println("no tasks found");
                                }
                            } else {
                                out.println("You company is at stage 0");
                            }


                        %>



                    </tbody>
                </table>
                *click on the button to change status<br><br>
                
                </div>
                      <p class="text-center">
                <a href="stages.jsp" class="btn btn-primary btn-xs ">Back to Stages</a>
                <a href="addTask.jsp" class="btn btn-success btn-xs "> Add Task</a>

            </p>
                
            
        </div>
    </div>
</body>
</html>
