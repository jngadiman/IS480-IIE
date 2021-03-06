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
        <div class="container">
                <div class="col-lg-8 col-sm-offset-2">
                <h1 class="page-header">View All Companies</h1>
                <div class ='row'>
                    <%  int i = 0;
                        ArrayList<Company> allCompanies = CompanyDAO.getAllCompanies();
                        for (Company c : allCompanies) {
                            //Company c = allCompanies.get(i);
                            int company_id = c.getId();
                            if(company_id==0){
                                continue;
                            }

                    %>
                    
                    <div class="col-lg-1"></div>
                    <div class="col-lg-3 well" ailgn="center">
                        <%  // display the image
                            byte[] imgDataComp = c.getCompanyLogo();
                            if (imgDataComp != null) {
                                String imgDataBase64 = new String(Base64.getEncoder().encode(imgDataComp));
                        %>
                        <div align="center"><img width="120" height="120" src="data:image/gif;base64,<%= imgDataBase64%>"  alt="Profile Picture" /></div>
                            <%
                            } else {
                            %>
                        <div align="center"><img width="120" height="120" src="img/building.png"  alt="Profile Picture" /></div>
                            <%
                                }
                            %>
                        <h4><center><%=c.getName()%></center></h4>
                        <form action='displayEachCompanyProfile.jsp' method='post'>
                            <input type='hidden' name='company_id' value=<%=company_id%>>
                            <button type='submit' class='btn btn-success btn-xs center-block' name="company_id" value="<%=company_id%>">View Profile</button>
                        </form>
                    </div>
                    <%      i++;
                            if (i % 3 == 0) {
                                out.println("</div><div class='row'>");
                            }

                        }
                    %>
               
            </div>
        </div>

    </body>
</html>
