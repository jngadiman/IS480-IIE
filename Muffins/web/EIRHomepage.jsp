<%-- 
    Document   : EIRHomepage
    Created on : Oct 25, 2017, 11:54:42 AM
    Author     : Xinyao
--%>

<%@page import="java.util.HashMap"%>
<%@page import="MODELS.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="DAO.ProgramStageDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title> 
        <%@include file="sidenav.jsp" %>        
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <img src="img/smu.jpg" alt="" width="70%"/>
                    <h1 class="page-header" style="font-family: serif; font-style: italic">Institute of Innovation & Entrepreneurship</h1>

                    <div class="row placeholders">
                        <%                            
                            int numStages = 4;
                            for (int i = 1; i <= numStages; i++) {
                                ArrayList<Company> companies = new ArrayList<Company>();
                                companies = companyController.getCompaniesInStage(i);
                                String stageName = ProgramStageDAO.getStage(i);
                        %>
                                <div class="col-xs-6 col-sm-3 placeholder">
                                    <h1 style="font-style: italic;"><%=i%></h1>
                                    <%=stageName%><br/><br/>
                                    <button href="#<%=i%>" class="btn btn-default btn-xs" data-toggle="collapse"><%=companies.size()%></button>
                                    <div id="<%=i%>" class="collapse">

                                        <%
                                            out.println("<br>");
                                            if (companies != null && companies.size() != 0) {
                                                for (Company c : companies) {
                                                    //out.println("<ul>" + c.getName() + "</ul>");
                                                    out.println(c.getName());
                                                    out.println("<br>");
                                                }
                                            } else {

                                            }
                                        %>
                                    </div>
                                </div>
                        <%
                            }
                        %>
                    </div>


                    <!-- <div class="row placeholders">
                        <div class="col-xs-6 col-sm-3 placeholder">
                            <h1>1</h1>
                            Business model validation stage<br/><br/>
                            <%
                                ArrayList<Company> companies1 = companyController.getCompaniesInStage(1);
                            %>
                            <button href="#1" class="btn btn-default btn-xs" data-toggle="collapse"><%=companies1.size()%></button>
                            <div id="1" class="collapse">

                                <%

                                    if (companies1 != null && companies1.size() != 0) {
                                        for (Company c : companies1) {
                                            out.println("<li>" + c.getName() + "</li>");
                                        }
                                    } else {

                                    }
                                %>
                            </div>
                        </div>
                        
                        <div class="col-xs-6 col-sm-3 placeholder">
                            <h1>3</h1>
                            Go-To-Market & early customer acquisition stage<br/>
                            <%
                                ArrayList<Company> companies3 = companyController.getCompaniesInStage(3);
                            %>
                            <button href="#3" class="btn btn-success btn-xs" data-toggle="collapse"><%=companies3.size()%></button>
                            <div id="3" class="collapse">

                                <%

                                    if (companies3 != null && companies3.size() != 0) {
                                        for (Company c : companies3) {
                                            out.println("<li>" + c.getName() + "</li>");
                                        }
                                    }
                                %>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-3 placeholder">
                            <h1>4</h1>
                            Business Plan/Financial Modelling stage<br/>
                            <%
                                ArrayList<Company> companies4 = companyController.getCompaniesInStage(4);

                            %>
                            <button href="#4" class="btn btn-warning btn-xs" data-toggle="collapse"><%=companies4.size()%></button>
                            <div id="4" class="collapse">

                                <%
                                    if (companies4 != null && companies4.size() != 0) {
                                        for (Company c : companies4) {
                                            out.println("<li>" + c.getName() + "</li>");
                                        }
                                    }
                                %>
                            </div>
                        </div>


                    </div> -->
                    <!--
                                        <h2 class="sub-header">Section title</h2>
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Header</th>
                                                        <th>Header</th>
                                                        <th>Header</th>
                                                        <th>Header</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>1,001</td>
                                                        <td>Lorem</td>
                                                        <td>ipsum</td>
                                                        <td>dolor</td>
                                                        <td>sit</td>
                                                    </tr>
                                                    <tr>
                                                        <td>1,002</td>
                                                        <td>amet</td>
                                                        <td>consectetur</td>
                                                        <td>adipiscing</td>
                                                        <td>elit</td>
                                                    </tr>
                                                    <tr>
                                                        <td>1,003</td>
                                                        <td>Integer</td>
                                                        <td>nec</td>
                                                        <td>odio</td>
                                                        <td>Praesent</td>
                                                    </tr>
                                                    <tr>
                                                        <td>1,003</td>
                                                        <td>libero</td>
                                                        <td>Sed</td>
                                                        <td>cursus</td>
                                                        <td>ante</td>
                                                    </tr>
                                                    <tr>
                                                        <td>1,004</td>
                                                        <td>dapibus</td>
                                                        <td>diam</td>
                                                        <td>Sed</td>
                                                        <td>nisi</td>
                                                    </tr>
                                                    <tr>
                                                        <td>1,005</td>
                                                        <td>Nulla</td>
                                                        <td>quis</td>
                                                        <td>sem</td>
                                                        <td>at</td>
                                                    </tr>
                                                    <tr>
                                                        <td>1,006</td>
                                                        <td>nibh</td>
                                                        <td>elementum</td>
                                                        <td>imperdiet</td>
                                                        <td>Duis</td>
                                                    </tr>
                                                    <tr>
                                                        <td>1,007</td>
                                                        <td>sagittis</td>
                                                        <td>ipsum</td>
                                                        <td>Praesent</td>
                                                        <td>mauris</td>
                                                    </tr>
                                                    <tr>
                                                        <td>1,008</td>
                                                        <td>Fusce</td>
                                                        <td>nec</td>
                                                        <td>tellus</td>
                                                        <td>sed</td>
                                                    </tr>
                                                    <tr>
                                                        <td>1,009</td>
                                                        <td>augue</td>
                                                        <td>semper</td>
                                                        <td>porta</td>
                                                        <td>Mauris</td>
                                                    </tr>
                                                    <tr>
                                                        <td>1,010</td>
                                                        <td>massa</td>
                                                        <td>Vestibulum</td>
                                                        <td>lacinia</td>
                                                        <td>arcu</td>
                                                    </tr>
                                                    <tr>
                                                        <td>1,011</td>
                                                        <td>eget</td>
                                                        <td>nulla</td>
                                                        <td>Class</td>
                                                        <td>aptent</td>
                                                    </tr>
                                                    <tr>
                                                        <td>1,012</td>
                                                        <td>taciti</td>
                                                        <td>sociosqu</td>
                                                        <td>ad</td>
                                                        <td>litora</td>
                                                    </tr>
                                                    <tr>
                                                        <td>1,013</td>
                                                        <td>torquent</td>
                                                        <td>per</td>
                                                        <td>conubia</td>
                                                        <td>nostra</td>
                                                    </tr>
                                                    <tr>
                                                        <td>1,014</td>
                                                        <td>per</td>
                                                        <td>inceptos</td>
                                                        <td>himenaeos</td>
                                                        <td>Curabitur</td>
                                                    </tr>
                                                    <tr>
                                                        <td>1,015</td>
                                                        <td>sodales</td>
                                                        <td>ligula</td>
                                                        <td>in</td>
                                                        <td>libero</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                    -->
                </div>
            </div>
        </div>
    </body>
</html>

