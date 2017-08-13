<%-- 
    Document   : applicationForm
    Created on : Aug 8, 2017, 5:18:52 PM
    Author     : Xinyao
--%>

<%@page import="MODELS.Mentor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="requestMentorServlet" method="post">
        <%
            Mentor m = (Mentor) session.getAttribute("requestedMentor");
        %>
        <div style="align-items: center">
           <h4 style="text-align: center">Are you sure you want to request for this mentor?</h4>
           <p style="text-align: center"><%= m.getProfile_pic()%></p>
           <br/>
           <p style="text-align: center"><%= m.getName()%></p>
           <br/>
           <div class="text-center"><input type="submit" value="Yes" name="yesBtn"></div>
           <div class="text-center"><input type="submit" value="No" name="noBtn"></div>
        </div>
        </form>
    </body>
</html>
