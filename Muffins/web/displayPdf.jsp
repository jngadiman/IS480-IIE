<%-- 
    Document   : displayPdf
    Created on : Oct 6, 2017, 5:25:11 PM
    Author     : Jennefer Ngadiman
--%>

<%@page import="CONTROLLER.companyController"%>
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Slides</title>
    </head>
    <body>
                                
         <%  // display the image
             
                                int companyId = Integer.parseInt(request.getParameter("companyId"));
                                byte[] companySlides = companyController.getCompany(companyId).getBizFile();
                                if (companySlides != null) {
                                    String imgDataBase64 = new String(Base64.getEncoder().encode(companySlides));
                            %>
                            <object data="data:application/pdf;base64,<%=imgDataBase64%>" style="height:800px;width:100%" type="application/pdf"></object>
                            <%
                            } 
                            %>
       
    </body>
</html>
