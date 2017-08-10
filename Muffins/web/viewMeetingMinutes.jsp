<%-- 
    Document   : viewMeetingMinutes
    Created on : Aug 5, 2017, 6:08:23 PM
    Author     : JJAY
--%>

<%@page import="MODELS.MeetingMinutes"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>TO VIEW ALL THE MEETING MINUTES</h1>
        <%
            
            ArrayList<MeetingMinutes> minutes = (ArrayList<MeetingMinutes>)request.getAttribute("mentorMeetingMinutes");
            
            for(MeetingMinutes each:minutes){
                System.out.println(each.getMinutesID());%>
                EACH = <%=each.getMinutesID()%> DELETE 
            <%}

            %>
    </body>
</html>
