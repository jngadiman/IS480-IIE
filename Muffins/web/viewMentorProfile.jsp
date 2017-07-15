<%-- 
    Document   : viewMentorProfile
    Created on : Jul 15, 2017, 4:30:40 PM
    Author     : Xinyao
--%>

<%@page import="DAO.UserDAO"%>
<%@page import="MODELS.User"%>
<%@page import="MODELS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor Profile</title>
        <%@include file="navbar.jsp" %>
        <link href="css/stages.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/npm.js" type="text/javascript"></script>
        <link href="css/bootstrap-datepicker.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            try {
                String username = "aaa";
                User mentor = UserDAO.getUserByUsername(username);
                //need to add in method to get company id of mentor
                
            }catch (NullPointerException nullPointer){
                out.println("No such mentor");//error message
            }

        %>
        <h1>Mentor Name: Song Jung Ki</h1>
        <body>
            <div>
                <b>General Information</b>
                <br>
                Lorem ipsum dolor sit amet, his ea mollis fabellas principes. Quo mazim facilis tincidunt ut, utinam saperet facilisi an vim.
                <br>
                <b>Company Information</b>
                <br>
                Lorem ipsum dolor sit amet, his ea mollis fabellas principes. Quo mazim facilis tincidunt ut, utinam saperet facilisi an vim.
            </div>
        </body>
        
        <a href="editMentorProfile.jsp" class="btn btn-success btn-outline-rounded green"> Edit Profile</a>
        

</html>
