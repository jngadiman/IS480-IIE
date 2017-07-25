<%-- 
    Document   : upload
    Created on : Jun 24, 2017, 10:26:10 AM
    Author     : JEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="protect.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <h1>Upload your documents</h1>
        <label class="btn btn-primary btn-xs" for="my-file-selector">
            <input id="my-file-selector" type="file" style="display:none;">
            Select
        </label>
         <label class="btn btn-primary btn-xs">
            <input id="file" type="submit" style="display:none;">
            Submit
        </label>
    </body>
</html>
