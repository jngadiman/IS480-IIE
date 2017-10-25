<%-- 
    Document   : registerCompany
    Created on : Jul 15, 2017, 12:25:35 AM
    Author     : JEN
--%>

<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="MODELS.Industry"%>
<%@page import="MODELS.Industry"%>
<%@page import="CONTROLLER.industryController"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Company"%>
<%@page import="MODELS.Company"%>
<%@page import="DAO.UserDAO"%>
<%@page import="DAO.UserDAO"%>
<%@page import="MODELS.User"%>
<%@include file="protect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Company Profile</title>
        <%@include file="sidenav.jsp" %>

    </head>

    <%        user = (User) session.getAttribute("user");
        int companyID = user.getCompanyid();
        Company company = CompanyDAO.getCompany(companyID);
        
        ArrayList<Integer> stages = new ArrayList<Integer>();
        stages.add(1);
        stages.add(2);
        stages.add(3);
        stages.add(4);
    %>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-sm-offset-2">
                    <h1 class="page-header col-lg-9 col-sm-offset-2">Edit Company Profile</h1>
                    <%                String status = (String) request.getAttribute("updateStatus");
                        if (status != null && !status.isEmpty()) {
                    %>

                    <div class="alert alert-dismissible alert-success col-lg-5">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <%=status%>
                    </div>
                <%
                    }
                %>
               
                <form action="editCompanyServlet" method="post" enctype="multipart/form-data">
                    <div class="col-sm-9 well col-sm-offset-2">
                        <div class="row">
                            
                                <input type="hidden" name="companyID" value="<%= company.getId()%>">
                                <br/>
                                <div class="col-sm-12 form-group required">
                                    <%
                                        // display the image
                                        byte[] imgDataComp = company.getCompanyLogo();
                                        if (imgDataComp != null) {
                                            String imgDataBase64 = new String(Base64.getEncoder().encode(imgDataComp));
                                    %>
                                    <img width="200" src="data:image/gif;base64,<%= imgDataBase64%>" class="img-responsive center-block" alt="images Here"/></div>
                                        <%
                                        } else {
                                        %>
                                    <img width="200" src="img/factory.png"  class="img-responsive center-block"  alt="images Here" /><%
                                        }
                                        
                                        out.println("<h3 class='text-center'>"+company.getName()+"</h3>");
                                    %>
                                    <br/>
                                     <div class="col-sm-6 form-group required">
                                    Change company logo:
                                    <input type="file" name="companyLogo">
                                     </div>
                            </div>
                        

                        <div class="row">
                            <div class="col-sm-6 form-group required">
                                <label class="control-label">Company Name</label>
                                <input name="companyName" type="text" placeholder="Enter Company Name Here.." class="form-control" value="<%= company.getName()%>" required>
                            </div>
                        
                            <div class="col-sm-6 form-group required"> <!-- Date input -->
                                <label class="control-label">Start Date</label><br>
                                <input name="startDate" placeholder="MM/DD/YYYY" type="text" class="form-control" value="<%= new SimpleDateFormat("dd/MM/yyyy").format(company.getStartDate())%>" required>
                            </div>
                        </div>
                        <!-- check if the current logged in user is a mentor or mentee. if mentee and regular mentee -> show stage -->
                        <div class="row">
                            <div class="col-sm-6 form-group required">
                                <!-- NEED TO SHOW THE CURRENT STAGE FROM DB-->
                                <label class="control-label">Current Stage</label> 
                                <select class="form-control" name="stage" required>
                                    <option selected value = <%= company.getCurrentStage()%> ><%= company.getCurrentStage()%></option>
                                    <% for (Integer s : stages) {
                                            if (company.getCurrentStage() != s) {%>
                                    <option value='<%=s%>'><%=s%></option>
                                    <%      }
                                        }
                                    %>

                                </select>

                            </div>
                        

                            <div class="col-sm-6 form-group required">
                                <!-- NEED TO SHOW THE SELECTED INDUSTRY FROM DB-->
                                <label class="control-label">Industry</label> 
                                <select class="form-control" name="industry" required>
                                    <%
                                        Industry industry = industryController.getIndustry(company.getIndustry());
                                        if (industry != null) {
                                            String industry_name = industry.getIndustryName();
                                    %>
                                    <option selected value = <%=company.getIndustry()%> ><%=industry_name%></option>
                                    <%
                                        }
                                    %>
                                    <%
                                        ArrayList<Industry> industries = industryController.getIndustries();
                                        for (Industry i : industries) {
                                            if (company.getIndustry() != i.getIndustryCode()) {%>
                                    <option value='<%=i.getIndustryCode()%>'><%=i.getIndustryName()%></option>
                                    <%      }
                                        }
                                    %>
                                </select>

                            </div>
                        </div>

                        <div class="row">

                            <div class="col-sm-12 form-group required">
                                <label class="control-label">Company Description</label>
                                <textarea class="form-control" rows="3" name="description" placeholder="Enter Company Description Here.." required><%= company.getDescription()%></textarea>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-sm-12 form-group required">
                                <label class="control-label">Stakeholders E-mails</label>
                                <%
                                    String[] stakeholders;
                                    stakeholders = company.getStakeholders();

                                    if (stakeholders != null && stakeholders.length != 0) {

                                        String stakeholderFull = stakeholders[0];
                                        for (int i = 1; i < stakeholders.length; i++) {
                                            stakeholderFull = stakeholderFull + ',' + stakeholders[i];
                                        }
                                %>
                                <input id="shareholders" name="shareholders" type="text" placeholder="Enter emails separated by , (comma)" class="form-control" value="<%=stakeholderFull%>" required multiple>

                                <%
                                } else {
                                %>
                                <input id="shareholders" name="shareholders" type="text" placeholder="Currently, no stakeholders found! Enter emails separated by , (comma) " class="form-control" required multiple>

                                <%
                                    }
                                %>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6 form-group required">
                                <label class="control-label">Number of Full-Time Staff</label>
                                <input name="num_fulltime" type="text" placeholder="Enter Company Vision Here.." class="form-control" value="<%= company.getFullTimers()%>">
                            </div>
                            <div class="col-sm-6 form-group required">
                                <label class="control-label">Number of Part-Time Staff</label>
                                <input name="num_parttime" type="text" placeholder="Enter Company Mission Here.." class="form-control" value="<%= company.getPartTimers()%>">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6 form-group required">
                                <label class="control-label">Differentiation of Product</label>
                                 <%
                                    if (company.getProductDiff()==null) {
                                        %>
                                 <textarea class="form-control" rows="3" id="product_differentiation" name="product_differentiation" placeholder="Enter Differentiation of Product Here.."></textarea>
                                <%
                                    }else{
                                %>
                                <textarea class="form-control" rows="3" id="product_differentiation" name="product_differentiation" placeholder="Enter Differentiation of Product Here.."><%= company.getProductDiff()%></textarea>
                                <%}%>
                            </div>
                            <div class="col-sm-6 form-group required">
                                <label class="control-label">Revenue Model</label>
                                <%
                                    if ( company.getRevenueModel()==null) {
                                        %>
                               <textarea class="form-control" rows="3" id="revenue_model" name="revenue_model" placeholder="Enter Revenue Model Here.." ></textarea>
                                <%
                                    }else{
                                %>
                                <textarea class="form-control" rows="3" id="revenue_model" name="revenue_model" placeholder="Enter Revenue Model Here.."><%= company.getRevenueModel()%></textarea>
                                <%}%>
                                
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6 form-group required">
                                <label class="control-label">Traction</label>
                                <%
                                    if ( company.getTraction()==null) {
                                        %>
                               <textarea class="form-control" rows="3" id="traction" name="traction" placeholder="Enter Traction Here.." ></textarea>
                                <%
                                    }else{
                                %>
                                <textarea class="form-control" rows="3" id="traction" name="traction" placeholder="Enter Traction Here.." ><%= company.getTraction()%></textarea>
                            <%}%>
                            </div>
                            <div class="col-sm-6 form-group required">
                                <label class="control-label">Deployment of Funds</label>
                                <%
                                    if ( company.getDeployOfFunds()==null) {
                                        %>
                               <textarea class="form-control" rows="3" id="deployment_of_funds" name="deployment_of_funds" placeholder="Enter Deployment Of Funds Here.." ></textarea>
                                <%
                                    }else{
                                %>
                                <textarea class="form-control" rows="3" id="deployment_of_funds" name="deployment_of_funds" placeholder="Enter Deployment Of Funds Here.." ><%= company.getDeployOfFunds()%></textarea>
                            <%}%>
                            </div>
                        </div>
                       
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <label class="control-label">Incubation Pitch Deck Slides 
                                    </label> <a href="displayPdf.jsp?companyId=<%=company.getId()%>" target="blank" />PDF</a>
                                    </div>
                                    <div class="col-sm-6 form-group">
                            <label class="control-label">Update Slides </label> <br> Format <b>.pdf</b>, Max. 2mb, Guideline <a href="https://image.ibb.co/cFoVFb/Business_Deck_Guidelines_v2.png" target="blank">here</a>
                                <input type="file" name="biz_slides"/>
                            
                                    </div>
                        </div>


                       <button type="submit" class="btn btn-md btn-success center-block">Save</button>					
                    </div>
                </form> 
            </div>
        </div>
    </body>
</html>
