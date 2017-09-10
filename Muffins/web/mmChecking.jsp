<%-- 
    Document   : mmChecking
    Created on : Sep 10, 2017, 5:23:04 PM
    Author     : Xinyao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meeting Details</title>
        <%@include file="navbar.jsp" %>
        <link href="css/dashboard.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1 style="text-align:center">Mentor's name</h1>
        <div class='containter'>
            <div class="row col-lg-10 well col-md-offset-1">

                <h2>All Meeting Minutes</h2>

                <div class='row'>
                    <div class='col-lg-12'>
                        <li><button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#modal1" style='border-radius: 12px'>Meeting 1 on 8 Sept 2017</button></li>
                    </div>
                </div>
                <br>

                <div class='row'>
                    <div class='col-lg-12'>
                        <li><button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#modal2" style='border-radius: 12px'>Meeting 2 on 10 Sept 2017</button></li>
                    </div>
                </div>

                <!-- Modal -->
                <div id="modal1" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">Meeting 1</h4>
                            </div>
                            <div class="modal-body">
                                <div class='containter'>
                                    <div class='col-lg-10 well'>
                                        <div class='row'>
                                            <p>Meeting Minutes ID: <strong></strong>1</p>
                                            <p>Meeting Minutes Title: <strong></strong>Meeting #1</p>
                                            <p>Meeting ID: <strong></strong>1</p>
                                            <p>Mentor Name: <strong></strong>Meeting #1</p>
                                            <p>Meeting ID: <strong></strong>Meeting #1</p>
                                        </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                        <div id="modal2" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">Meeting 2</h4>
                                    </div>
                                    <div class="modal-body">
                                        GET ALL THE FIELDS FROM MEETINGS
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <div style='text-align:center'>
                    <a href='' class='btn btn-success btn-dm'>Generate Payment Voucher</a>
                </div>
            </div>
        </div>


    </body>
</html>
