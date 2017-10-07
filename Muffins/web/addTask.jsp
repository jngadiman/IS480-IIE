<%-- 
    Document   : addStages
    Created on : Jul 5, 2017, 9:06:58 PM
    Author     : JEN
--%>

<%@page import="CONTROLLER.companyController"%>
<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Company"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Task</title>
        <%@include file="sidenav.jsp" %>
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
        <div class="container">
            <form class="form-horizontal" method="post" action="addTaskServlet">
                <fieldset>
                    <%  String msg = "";
                        if (request.getAttribute("status") != null) {
                            msg = (String) request.getAttribute("status");
                            out.println("<h4 class='alert col-sm-7 col-sm-offset-3'>");
                            out.println("<button type='button' data-dismiss='alert'>&times;</button>");
                            out.println(msg);
                            out.println("</h4>");
                        }
                    %>
                    <h2 class='page-header col-sm-7 col-sm-offset-3'>Add Task</h2>
                    <div class="col-sm-7 well col-sm-offset-3">


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
                                </select>
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

                                <button type="reset" class="btn btn-default">Reset</button>
                                <button type="submit" class="btn btn-primary">Submit</button>

                            </div>

                            <%
                                int stage = 0;
                                user = (User) session.getAttribute("user");
                                Company c = companyController.getCompany(user.getCompanyid());
                                if (c != null) {
                                    stage = c.getCurrentStage();
                            %>    


                            <div class="col-lg-8 col-lg-offset-9">
                                <br>
                                <a href="viewTasks.jsp?id=<%=stage%>">View Tasks</a>
                                <%
                                    }
                                %>
                                <br><a href="stages.jsp">Go Back to Stages</a>
                            </div>

                        </div>
                    </div>
                    </div>

                </fieldset>
            </form>
        </div>
    </div>
</section>

</body>
</html>
