<%-- 
    Document   : protect
    Created on : Jul 25, 2017, 3:32:34 PM
    Author     : JJAY
--%>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>