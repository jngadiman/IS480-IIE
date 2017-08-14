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
        <%@include file="navbar.jsp" %>
    </head>
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
            
            <div class="col-md-8 well col-md-offset-2">
            <div class="row col-md-offset-1">
                Mentor <select name = "mentor">
                    <option value = "1">mentor 1</option>
                    <option value = "2">mentor 2</option>
                    <option value = "3">mentor 3</option>
                    <option value = "4">mentor 4</option>  
                </select><input class="btn btn-primary btn-xs"type ="submit" value =" Choose "> 
                
                Student <select name = "student">
                    <option value = "1">student 1</option>
                    <option value = "2">student 2</option>
                    <option value = "3">student 3</option>
                    <option value = "4">student 4</option>  
                </select><input class="btn btn-primary btn-xs"type ="submit" value =" Choose "> 
            </div>
            
            <div class="row col-md-offset-1">
                
               
                
                    Meetings
                    <li><button type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#modal1">Meeting 1</button></li>
                    <li><button type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#modal2">Meeting 2</button></li>
                    <!-- Modal -->
                    <div id="modal1" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Meeting 1</h4>
                                </div>
                                <div class="modal-body">
                                    GET ALL THE FIELDS FROM MEETINGS
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Validate</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div id="modal2" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Meeting 2</h4>
                                </div>
                                <div class="modal-body">
                                    GET ALL THE FIELDS FROM MEETINGS
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Validate</button>
                                </div>
                            </div>
                        </div>
                    </div>
                
            </div>
        </div>
    </body>
</html>
