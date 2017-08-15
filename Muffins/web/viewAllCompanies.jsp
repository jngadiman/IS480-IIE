<%-- 
    Document   : viewAllCompanies
    Created on : Aug 8, 2017, 5:21:54 PM
    Author     : Xinyao
--%>

<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Company"%>
<%@page import="java.util.ArrayList"%>
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
        <title>All Companies</title>
    </head>
    <body>
        <%
            ArrayList<Company> allCompanies = CompanyDAO.getAllCompanies();
            for (int i = 0; i < allCompanies.size(); i++){
                Company c = allCompanies.get(i);
                out.print("<p align='center'>" + c.getName() +"</p>    ");
                out.print("<p class='text-center'><a href='viewCompanyProfile.jsp' class='btn btn-success btn-outline-rounded green'>View Detailed Company Profile</a></p>");
                
            }
        %>
        
        
    </body>
</html>
