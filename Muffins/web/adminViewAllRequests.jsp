<%-- 
    Document   : adminViewAllPendingRequests
    Created on : 12 Aug, 2017, 6:32:14 PM
    Author     : Hui Min
--%>

<%@page import="MODELS.Request"%>
<%@page import="java.util.ArrayList"%>
<%@page import="CONTROLLER.requestController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        Select Filter
        <form method="post" action ="adminDisplayRequestsServlet">
            <select name = "requestStatus">

                <option value = "all">All</option>
                <option value = "requesting">Requested</option>
                <option value = "approved">Approved</option>
                <option value = "declined">Declined</option>
                <option value = "over">Over</option>
            </select>
            
            <input type ="submit" value ="submit"> 
        </form>
        
        <%  ArrayList<Request> requests = (ArrayList<Request>)session.getAttribute("requests");
            if(requests==null){
                ArrayList<Request> allRequests = requestController.getAllRequests();
                for(Request r: allRequests){
                    //print all requests by default
                    out.println("WE ARE PRINTING ALL REQUESTS");
                }
            }else{
                //print requests that are passed back from servlet
                for(Request r: requests){
                    out.println("WE ARE PRINTING REQUESTS BY STATUS");
                }
            }
        %>

    </body>
</html>
