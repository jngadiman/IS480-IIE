<%-- 
    Document   : addMeetingMinutes
    Created on : Aug 4, 2017, 2:18:24 PM
    Author     : jiatung.lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form method ="post" action ="addMeetingMinutesServlet">
            MEETING MINUTE FORM  the meeting should have a add new meeting minute button that 
            when clicked on it it passes a hidden meeting_id and pass to this form
            to replace the one below<br/>
            <input type ="text" name ="meeting_id"> <br/>
            TITLE
            <input type ="text" name ="title"> <br/>
            
            mentor will be identified at the back end using session get user get mentor SO NO NEED INPUT
            
            Checkboxes of the list of tasks that are not completed for that stage to replace the one below
            TASKS COMPLETED
            <input type="checkbox" name="tasks_completed" value="1">task 1<br>
            <input type="checkbox" name="tasks_completed" value="2">task 2 <br/>
            
            <input type ="text" name ="comments"> <br/>
            
            submitted user will be identified using session SO NO NEED INPUT also
            
            <input type ="submit" value ="submit"> 
        </form>
    </body>
</html>
