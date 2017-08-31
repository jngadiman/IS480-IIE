<%-- 
    Document   : confirmUserAsMentee
    Created on : Sep 1, 2017, 2:18:57 AM
    Author     : JJAY
--%>

<%@page import="CONTROLLER.registrationController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MODELS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            ArrayList<String> status = (ArrayList<String>)request.getAttribute("status");
            if(status.size()!=0){
                out.println ("An error has occured!");
            }
            else{
                out.println (status.get(0));
            }
            
        %>
        Have a table or something that has all the registration request
        <form action = "confirmUserAsMenteeServlet" method="post">
            
            <%
                ArrayList<User> users = registrationController.getAllUsers();
                for (User u: users){
                    if(u.getPassword()== null || u.getPassword().equals("")){
                       
                        //display all fields related to company and mentee applying with a button to activate/ deactivate user.
                        %>
                            User Name is <%=u.getName()%>
                            User Email is <%=u.getEmail()%>
                            User Company is <%=u.getCompanyid()%>
                            ect ect
                            <input type ="hidden" value ="<%=u.getEmail()%>" name = "mentee_email">
                        <div class="panel-body">
                                        <button type="submit" class="btn btn-success btn-xs" value="activated" name="activateBtn"/>Activate</button>
                                        <button type="submit" class="btn btn-danger btn-xs"  value="declined" name="rejectBtn"/>Reject</button>
                            </div>
                        <%
                    }
                }
                
            %>
        </form>
        
    </body>
</html>
