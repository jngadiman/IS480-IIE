<%-- 
    Document   : RequestForMentor
    Created on : Aug 1, 2017, 11:50:25 AM
    Author     : Xinyao
--%>

<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Mentor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.MentorDAO"%>
<%@include file="protect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor List</title>
        <%@include file="navbar.jsp" %>
        
    </head>
    <body>
        <div class="container">
        <div class="col-lg-8 col-lg-offset-2">
             <h1>List of Mentors</h1>
            <%
                String type = request.getParameter("type");
                session.setAttribute("requestType", type);
                ArrayList<Mentor> mentors = MentorDAO.getMentors();
                for(Mentor m: mentors){    
            %>       
 
            <form action="requestForMentorViewServlet" method="post">
                   <div class="col-lg-4 well">
                   <%= m.getProfile_pic()%>
                   <br/>
                   <h2><%= m.getName()%></h2>
                   //add company name later
                   <br/>
                   
                    <input type="hidden" value="<%= m.getEmail()%>" name="mentorEmail">
                    <input type="submit" value="View Profile" class="btn btn-sm btn-success" name="submitBtn">
                    </div>
            </form>
            <%
                }
            %>
        </div>
</div>     
                     
    </body>
</html>
