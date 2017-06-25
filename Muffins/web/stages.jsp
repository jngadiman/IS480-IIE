<%-- 
    Document   : stages
    Created on : Jun 25, 2017, 10:41:17 PM
    Author     : JEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="navbar.jsp" %>
        <link href="css/stages.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/npm.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <section style="background:#efefe9;">
            <div class="container">
                <div class="row">
                    <div class="board">
                        <div class="board-inner">
                            <ul class="nav nav-tabs" id="myTab">
                                <div class="liner"></div>
                                <li class="active">
                                    <a href="#one" data-toggle="tab" title="one">
                                        <span class="round-tabs one">
                                            1
                                        </span> 
                                    </a></li>

                                <li><a href="#two" data-toggle="tab" title="two">
                                        <span class="round-tabs two">
                                            2
                                        </span> 
                                    </a>
                                </li>
                                <li><a href="#three" data-toggle="tab" title="three">
                                        <span class="round-tabs three">
                                            3
                                        </span> </a>
                                </li>

                                <li><a href="#four" data-toggle="tab" title="four">
                                        <span class="round-tabs four">
                                            4
                                        </span> 
                                    </a></li>

                                <li><a href="#five" data-toggle="tab" title="five">
                                        <span class="round-tabs five">
                                            5
                                        </span> </a>
                                </li>

                            </ul></div>

                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="one">

                                <h3 class="head text-center">HOME<span style="color:#f48260;">♥</span></h3>
                                <p class="narrow text-center">
                                    Welcome!<br/>
                                    You are currently at Stage 1
                                <div class="progress ">
                                    <div class="progress-bar progress-bar-striped active" role="progressbar"
                                         aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
                                        40%
                                    </div>
                                </div>
                                </p>

                                <p class="text-center">
                                    <a href="" class="btn btn-success btn-outline-rounded green"> read more on what are the steps to do here <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                                </p>
                            </div>
                            <div class="tab-pane fade" id="two">
                                <h3 class="head text-center">Stage 1<sup>™</sup> Profile</h3>
                                <p class="narrow text-center">
                                    <b>Business model validation stage</b><br/>
                                    Lorem ipsum dolor sit amet, his ea mollis fabellas principes. Quo mazim facilis tincidunt ut, utinam saperet facilisi an vim.
                                </p>

                                <p class="text-center">
                                    <a href="" class="btn btn-success btn-outline-rounded green">  read more on what are the steps to do here <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                                </p>

                            </div>
                            <div class="tab-pane fade" id="three">
                                <h3 class="head text-center">Stage 2</h3>
                                <p class="narrow text-center">
                                    <b>Innovation Development stage</b> ​<br/>
                                    Lorem ipsum dolor sit amet, his ea mollis fabellas principes. Quo mazim facilis tincidunt ut, utinam saperet facilisi an vim.
                                </p>

                                <p class="text-center">
                                    <a href="" class="btn btn-success btn-outline-rounded green">  read more on what are the steps to do here  <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                                </p>
                            </div>
                            <div class="tab-pane fade" id="four">
                                <h3 class="head text-center">Stage 3</h3>
                                <p class="narrow text-center">
                                    <b>Go-To-Market & early customer acquisition stage</b> ​<br/>
                                    Lorem ipsum dolor sit amet, his ea mollis fabellas principes. Quo mazim facilis tincidunt ut, utinam saperet facilisi an vim.
                                </p>

                                <p class="text-center">
                                    <a href="" class="btn btn-success btn-outline-rounded green">  read more on what are the steps to do here <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                                </p>
                            </div>
                            <div class="tab-pane fade" id="five">
                                <div class="text-center">
                                    <i class="img-intro icon-checkmark-circle"></i>
                                </div>
                                <h3 class="head text-center">Stage 4<span style="color:#f48260;">♥</span></h3>
                                <p class="narrow text-center">
                                    <b>Business Plan/Financial Modelling stage</b> ​<br/>
                                    Lorem ipsum dolor sit amet, his ea mollis fabellas principes. Quo mazim facilis tincidunt ut, utinam saperet facilisi an vim.
                                </p>

                                <p class="text-center">
                                    <a href="" class="btn btn-success btn-outline-rounded green">  read more on what are the steps to do here <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                                </p>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

    </body>
</html>
