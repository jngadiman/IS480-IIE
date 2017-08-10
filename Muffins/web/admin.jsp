
<%--
    Document   : admin
    Created on : Aug 1, 2017, 3:04:54 PM
    Author     : jiatung.lim
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="MODELS.MeetingMinutes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>TRACK MEETING MINUTES BY MENTOR</h1>
        
        <form action ="displayMeetingMinutesServletByMentor" method ="post">
            SELECT MENTOR (HAVE A DROP DOWN OF MENTORS AVAILABLE)
        
        <input type ="text" name ="mentor_email"> </BR>
        <input type ="submit" value ="submit"> 
        </form>
        
        <h1>TRACK MEETING MINUTES BY COMPANY </h1>
        
        <form action ="displayMeetingMinutesServletByCompany" method ="post">
            SELECT COMPANY (HAVE A DROP DOWN OF COMPANY AVAILABLE with value = company_id)
        
        <input type ="text" name ="company_id"> </BR>
        <input type ="submit" value ="submit"> 
        </form>
        <%
//            ArrayList<MeetingMinutes> minutes = (ArrayList<MeetingMinutes>)request.getAttribute("mentorMeetingMinutes");
//            
//            for(MeetingMinutes m:minutes){
//            System.out.println (m.getM().getMeetingName());
//            print all the minutes details
//        }
        %>
        
    </body>
</html>
