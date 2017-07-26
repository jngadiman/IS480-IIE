<%-- 
    Document   : logout
    Created on : Jul 25, 2017, 9:14:13 PM
    Author     : JJAY
--%>

<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>