<%-- 
    Document   : applicationForm
    Created on : Aug 8, 2017, 5:18:52 PM
    Author     : Xinyao
--%>

<%@page import="MODELS.Mentor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<%@include file="protect.jsp" %>
<link href="css/stages.css" rel="stylesheet" type="text/css"/>
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/npm.js" type="text/javascript"></script>
<link href="css/bootstrap-datepicker.css" rel="stylesheet" type="text/css"/>
<script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request for A Mentor</title>
    </head>
    <body>
        <form action="requestMentorServlet" method="post">
            <%            Mentor m = (Mentor) session.getAttribute("requestedMentor");
            %>
            <div style="align-items: center">
                <br>
                <br>
                <br>
                <div class="container">
                    <div class="col-sm-10 col-sm-offset-1">
                        <div class="row">
                            <div class="col-sm-12 form-group">
                                <h3 style="text-align: center">A request of this mentor will be sent to administrator together with your preferred mentor period</h3>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6 form-group col-sm-offset-3">
                                    <p><strong>Mentor's Name</strong> : <%=m.getName()%></p>
                                </div>
                            
                        </div>
                            


                        <p align="center"><button type="reset" class="btn btn-default">Cancel</button><button style="align-items: center" type="submit" class="btn btn-primary" name="yesBtn">Yes</button></p>
                    </div>
                </div>
        </form>
    </body>
</html>
