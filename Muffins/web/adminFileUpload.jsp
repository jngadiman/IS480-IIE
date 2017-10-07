<%-- 
    Document   : fileUpload
    Created on : 23 Sep, 2016, 9:30:42 AM
    Author     : Hui Min
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<!--<%@include file = "protect.jsp" %> -->
<%@include file = "adminCheck.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File Upload</title>
    </head>
    <body>
        <div class = "container">
            <%--form to allow user to select file for upload--%>
            <form action = "UploadController" method = "post" enctype = "multipart/form-data">
                Upload file here: <input type = "file" name="file-upload" accept=".zip" /> <br>
                <font color = "red"> Note: File should only be in zip format </font>
                
                <br><br>

                <input type = "submit" value = "Upload" />
                <font color = "red"> ${fileUploadError} </font> 

            </form>
        </div>

    </body>
</html>
