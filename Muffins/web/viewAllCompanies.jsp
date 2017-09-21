<%-- 
    Document   : viewAllCompanies
    Created on : Aug 8, 2017, 5:21:54 PM
    Author     : Xinyao
--%>

<%@page import="java.util.Base64"%>
<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sidenav.jsp" %>
<%@include file="protect.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Companies</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-8 col-lg-offset-3">
                <h1 class="page-header">View All Companies</h1>
                <div class ='row'>
                    <%  int i = 0;
                        ArrayList<Company> allCompanies = CompanyDAO.getAllCompanies();
                        for (Company c : allCompanies) {
                            //Company c = allCompanies.get(i);
                            int company_id = c.getId();

                    %>
                    <div class="col-lg-4 well">
                        <%  // display the image
                            byte[] imgDataComp = c.getCompanyLogo();
                            if (imgData != null) {
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
                        <h2><%=c.getName()%></h2>
                        <a href="displayEachCompanyProfile.jsp?company_id=<%=company_id%>" class='btn btn-success btn-xs'>View Profile</a>
                    </div>
                    <%      i++;
                            if (i % 3 == 0) {
                                out.println("</div><div class='row'>");
                            }

                        }
                    %>
                </div>
            </div>
        </div>

    </body>
</html>
