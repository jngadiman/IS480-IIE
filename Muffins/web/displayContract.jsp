<%-- 
    Document   : displayContract
    Created on : Oct 11, 2017, 2:47:52 AM
    Author     : Jennefer Ngadiman
--%>

<%@page import="java.util.Base64"%>
<%@page import="CONTROLLER.contractController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Contract</title>
    </head>
    <body>
       <%  // display the image
             
                                int rsId = Integer.parseInt(request.getParameter("rsId"));
                                byte[] contractByte = contractController.getContract(rsId).getContractFile();
                                if (contractByte != null) {
                                    String imgDataBase64 = new String(Base64.getEncoder().encode(contractByte));
                            %>
                            <object data="data:application/pdf;base64,<%=imgDataBase64%>" style="height:800px;width:100%" type="application/pdf"></object>
                            <%
                            } 
                            %>
       
    </body>
</html>
