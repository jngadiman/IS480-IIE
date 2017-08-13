<%-- 
    Document   : applicationForm
    Created on : Aug 13, 2017, 12:30:04 PM
    Author     : Xinyao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="navbar.jsp" %>
        <link href="css/stages.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/npm.js" type="text/javascript"></script>
        <link href="css/bootstrap-datepicker.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Application Form</title>
    </head>
    <body>
        <h1 align="center"> Application Form </h1>
        <form action="upload.php" method="post" enctype="multipart/form-data">
            <h2 align="center">Upload Company Idea (.ppt format, 10 pages max):</h2>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4"> <h4 align="center"><input align="center" type="file" name="companyIdea" required id="companyIdea">
                        <input align="center" type="submit" value="Upload" name="submit"></div></h4>
                <div class="col-sm-4"></div>
            </div> 
            <br>

            <h2 align="center">Upload Team Information:</h2>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4"> <h4 align="center"><input align="center" type="file" name="companyIdea" required id="companyIdea">
                        <input align="center" type="submit" value="Upload" name="submit"></div></h4>
                <div class="col-sm-4"></div>
            </div> 

            <h2 align="center">Requirements to IIE:</h2>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4"> <h4 align="center"><input align="center" type="file" name="companyIdea" required id="companyIdea">
                        <input align="center" type="submit" value="Upload" name="submit"></div></h4>
                <div class="col-sm-4"></div>
            </div> 
        </form>

        
        <p align="center"> <button type="reset" class="btn btn-primary">Submit</button> </p>

    </body>
</html>
