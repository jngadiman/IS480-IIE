<%-- 
    Document   : confirmCompany
    Created on : Sep 1, 2017, 2:18:57 AM
    Author     : JJAY
--%>

<%@page import="CONTROLLER.companyController"%>
<%@page import="MODELS.Company"%>
<%@page import="CONTROLLER.registrationController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MODELS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Company</title>
        <%@include file="navbar.jsp" %>
    </head>
    <body>
        <div class="container">
            
            <h2>Pending Companies</h2>
            <%            ArrayList<String> status = (ArrayList<String>) request.getAttribute("status");
                if (status != null && status.size() != 0) {
                    out.print(status.get(0));

                }

                ArrayList<Company> pendingCompanies = companyController.getCompaniesInStage(0);

                if (pendingCompanies != null && pendingCompanies.size() != 0) {
                    
            %>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Company Logo</th>
                        <th>Company Name</th>
                        <th>Requirements</th>
                        <th>Differentiation of Product</th>
                        <th>Revenue Model</th>
                        <th>Traction</th>
                        <th>Deployment of Funds</th>
                        <th>Accept/Reject</th>
                    </tr>
                </thead>
                <%
                for(Company company: pendingCompanies){
                    String founders = "";
                    String [] stakeholders = company.getStakeholders();
                    for(int x = 0; x<stakeholders.length; x++ ){
                        String s = stakeholders[x];
                        if (x == (stakeholders.length - 1) ){
                            founders+=s;
                        }else{
                            founders = s+",";
                        }
                        
                    }
                    
                    %>
                
                <tbody>
                    <tr>
                       <td><%=company.getCompanyLogo()%></td>
                        <td><%=company.getName()%></td>
                        <td><%=company.getAcraFile()%><%=company.getAgreementForm()%></td>
                        <td><%= company.getProductDiff()%></td>
                        <td><%=company.getRevenueModel()%></td>
                        <td><%=company.getTraction()%></td>
                        <td><%=company.getDeployOfFunds()%></td>
                        <td>
                            <form action = "confirmCompanyServlet" method="post">
                                
                                <input type ="hidden" name ="stakeholders" value ="<%=founders%>">
                                <input type ="hidden" name ="company" value ="<%=company.getName()%>">
                                <input type ="hidden" name ="company_id" value ="<%=company.getId()%>">
                                <div class="panel-body">
                                <button type="submit" class="btn btn-success btn-xs" value="shortlist" name="shortListBtn"/>Shortlist</button>
                                <button type="submit" class="btn btn-success btn-xs" value="activated" name="activateBtn"/>Activate</button>
                                <button type="submit" class="btn btn-danger btn-xs"  value="declined" name="rejectBtn"/>Reject</button>
                                </div>
                                
                            </form>
                        </td>
                        <!--<a href="#" class="btn btn-success btn-xs">Accept</a><a href="#" class="btn btn-danger btn-xs">Reject</a></td>-->
                    </tr>
                </tbody>
                <%}%>
            </table>
            <%
                }
            %>



        </div>

        

    </body>
</html>
