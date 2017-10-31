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
    <script>
        $(document).ready(function () {
            var heights = $(".well").map(function () {
                return $(this).height();
            }).get(),
                    maxHeight = Math.max.apply(null, heights);

            $(".well").height(maxHeight);
        });

    </script>
    <body>
        <div class="col-lg-8 col-lg-offset-3">
            <h1 class="page-header">Assign Mentor to Company</h1>
            <div class="row">
            <%                if (request.getAttribute("status") != null) {
                    String status = (String) request.getAttribute("status");
                    out.println("<h2>" + status + "</h2>");
                }
            %>
                <% int i = 0;
                    ArrayList<Company> companyWoMentor = assignmentController.getCompaniesWNoMentorNPref();
                    for (Company company : companyWoMentor) {
                %>
                <div class="col-lg-3 well fixed">
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
                    <h4><%=company.getName()%></h4>
                    <form method="post" action="EIRAssignment.jsp">
                    
                        <input type="hidden" name="companyWNoMentor" value="<%= company.getId()%>"/>
                        <button type="submit" class="pull-right btn-xs btn-primary" name="setMentorBtn">Assign</button>
                    
                    </form>
                </div>
                        
                    <div class="col-lg-1"></div>
                <%
                            i++;
                            if (i % 3 == 0) {
                                out.println("</div><div class='row'>");
                            }
                    }
                %>
            
        </div>
    </body>
</html>
