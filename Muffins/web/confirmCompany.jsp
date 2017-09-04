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
                                    
                    %>
                
                <tbody>
                    <tr>
                       <td><%=company.getCompanyLogo()%></td>
                        <td><%=company.getName()%></td>
                        <td><%=company.getAcraFile()%><%=company.getAppForm()%></td>
                        <td><%= company.getProductDiff()%></td>
                        <td><%=company.getRevenueModel()%></td>
                        <td><%=company.getTraction()%></td>
                        <td><%=company.getDeployOfFunds()%></td>
                        <td><a href="#" class="btn btn-success btn-xs">Accept</a><a href="#" class="btn btn-danger btn-xs">Reject</a></td>
                    </tr>
                </tbody>
                <%}%>
            </table>
            <%
                }
            %>



        </div>

        Have a table or something that has all the registration request

        <form action = "confirmCompanyServlet" method="post">

            <%                ArrayList<User> users = registrationController.getAllUsers();
                for (User u : users) {
                    if (u.getPassword() == null || u.getPassword().equals("")) {

                        //display all fields related to company and mentee applying with a button to activate/ deactivate user.
            %>
            User Name is <%=u.getName()%>
            User Email is <%=u.getEmail()%>
            User Company is <%=u.getCompanyid()%>
            ect ect
            <input type ="hidden" value ="<%=u.getEmail()%>" name = "mentee_email">
            <div class="panel-body">
                <button type="submit" class="btn btn-success btn-xs" value="activated" name="activateBtn"/>Activate</button>
                <button type="submit" class="btn btn-danger btn-xs"  value="declined" name="rejectBtn"/>Reject</button>
            </div>
            <%
                    }
                }

            %>
        </form>

    </body>
</html>
