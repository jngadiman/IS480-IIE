<%-- 
    Document   : browserCloseEvent
    Created on : Aug 15, 2017, 1:25:17 AM
    Author     : JJAY
--%>
<%
    if (session != null) {
        session.invalidate();
    }
%>
