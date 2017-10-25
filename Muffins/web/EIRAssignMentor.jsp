<%-- 
    Document   : EIRAssignMentor
    Created on : Oct 25, 2017, 10:12:40 AM
    Author     : Xinyao
--%>

<%@page import="CONTROLLER.assignmentController"%>
<%@page import="MODELS.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Mentor</title>
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <div class="col-md-8 well col-md-offset-3">
            <h3 class="page-header"><strong>Assign Mentor to Company</strong></h3>
            <%                if (request.getAttribute("status") != null) {
                    String status = (String) request.getAttribute("status");
                    out.println("<h2>" + status + "</h2>");
                }
            %>
            <form name="form1" method="post" action="EIRAssignment.jsp">
                <% int i = 0;
                    ArrayList<Company> companyWoMentor = assignmentController.getCompaniesWNoMentorNPref();
                    for (Company company : companyWoMentor) {
                %>
                <div class="col-lg-4 well">
                    <%  // display the image
                        byte[] imgDataComp = company.getCompanyLogo();
                        if (imgDataComp != null) {
                            String imgDataBase64 = new String(Base64.getEncoder().encode(imgDataComp));
                    %>
                    <div align="center"><img width="120" height="120" src="data:image/gif;base64,<%= imgDataBase64%>"  alt="Profile Picture" /></div>
                        <%
                        } else {
                        %>
                    <div align="center"><img width="120" height="120" src="img/factory.png"  alt="Profile Picture" /></div>
                        <%
                            }
                        %>
                    <h2><center><%=company.getName()%></center></h2>
                    <div class="col-md-4 col-md-offset-4">
                        <button type="submit" class="btn-sm btn-primary" name="setMentorBtn">Assign</button>
                    </div>
                </div>
                <%
                    }
                %>
            </form>
        </div>
    </body>
</html>
