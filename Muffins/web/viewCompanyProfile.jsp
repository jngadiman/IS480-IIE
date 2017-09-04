
<%@page import="DAO.MentorDAO"%>
<%@page import="MODELS.Mentor"%>
<%@page import="MODELS.Mentor"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Base64"%>
<%-- 
    Document   : viewMentorProfile
    Created on : Jul 15, 2017, 4:30:40 PM
    Author     : Xinyao
--%>

<%@page import="DAO.CompanyDAO"%>
<%@page import="MODELS.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UserDAO"%>
<%@page import="MODELS.User"%>
<%@page import="MODELS.User"%>
<%@include file="protect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company Profile</title>
        <%@include file="navbar.jsp" %>
        <%@include file="protect.jsp" %>
    </head>
    <%            user = (User) session.getAttribute("user");
        int companyID = user.getCompanyid();
        Company company = CompanyDAO.getCompany(companyID);
    %>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-10 col-sm-offset-1">
                    <h2 class="col-lg-10 well col-sm-offset-1">Company Profile</h2>
                    <div class="col-lg-10 well col-sm-offset-1">
                        <div class="row">
                            <div class="col-sm-6 form-group"

                                 <%  // display the image
                                     byte[] imgData = company.getCompanyLogo();
                                     if (imgData != null) {
                                         String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                                 %>
                                 <div class="row"><img width="200" src="data:image/gif;base64,<%= imgDataBase64%>"  alt="images Here" /></div>
                                    <%
                                        }
                                    %>

                                <p><font size="+3"><%= company.getName()%></font></p>
                                    <%String startDate = new SimpleDateFormat("dd-MM-yyyy").format(company.getStartDate());%>
                                <label class="control-label">Start Date</label> : <%=startDate%>
                                <p><strong>Company Current Stage</strong> : <%= company.getCurrentStage()%></p>
                                <p><strong>Industry</strong> : <%= company.getIndustry()%></p>
                                <p><strong>Company Current Mentor</strong> : 
                                    <%
                                        ArrayList<String> all_founders = UserDAO.getUserEmailsOfCompany(companyID);
                                        String first_founder_email = all_founders.get(0);
                                        User first_user = UserDAO.getUserByEmail(first_founder_email);
                                        String first_user_type = first_user.getUser_type();
                                        Mentee mentee2;
                                        /*if (first_user_type.equals("mentee") && first_user!= null) {
                                            mentee2 = (Mentee) first_user;
                                            String mentor_email = mentee2.getMentor_email();
                                            if (mentor_email !=null && !mentor_email.equals("")){
                                                Mentor mentor2 = MentorDAO.getMentorByEmail(mentor_email);
                                                String mentor2_name = mentor2.getName();
                                                String mentor2_email = mentor2.getEmail();
                                                out.println(" <a href='displayProfile.jsp?email=" + mentor2_email + " class='btn btn-success btn-xs'>" + mentor2_email + "</a>");
                                            }

                                        }
*/
                                %></p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-12 form-group required">
                                <p><strong>Company Founders</strong> :<br> 
                                <p><%
                                    ArrayList<String> allFounders = UserDAO.getUserEmailsOfCompany(companyID);
                                    String firstFounderEmail = allFounders.get(0);
                                    User firstUser = UserDAO.getUserByEmail(firstFounderEmail);
                                    String firstUserName = firstUser.getName();
                                    out.println(" <a href='displayProfile.jsp?email=" + firstFounderEmail + " class='btn btn-success btn-xs'>" + firstUserName + "</a>");
                                    for (int i = 1; i < allFounders.size(); i++) {
                                        String s = allFounders.get(i);
                                        User u = UserDAO.getUserByEmail(s);
                                        String userName = u.getName();
                                        out.println(", <a href='displayProfile.jsp?email=" + s + "'>" + userName + "</a>");
                                    }


                                    %></p>
                            </div>	
                        </div>

                        <div class="row">
                            <div class="col-sm-12 form-group required">
                                <p><strong>Company Description</strong> :<br> 
                                <p><%= company.getDescription()%></p>
                            </div>	
                        </div>


                        <div class="row">
                            <div class="col-sm-6 form-group required">
                                <p><strong>Number of Full-Time Employees</strong> : <%= company.getFullTimers()%></p>
                            </div>
                            <div class="col-sm-6 form-group required">
                                <p><strong>Number of Part-Time Employees</strong> : <%= company.getPartTimers()%></p>
                            </div>	
                        </div>

                        <div class="row">
                            <div class="col-sm-6 form-group required">
                                <p><strong>Product Differentiation</strong> :<br> 
                                    <%= company.getProductDiff()%></p>
                            </div>	
                            <div class="col-sm-6 form-group required">
                                <p><strong>Revenue Model</strong> :<br> 
                                    <%= company.getRevenueModel()%></p>
                            </div>	
                        </div>

                        <div class="row">
                            <div class="col-sm-6 form-group required">
                                <p><strong>Traction</strong> :<br> 
                                    <%= company.getTraction()%></p>
                            </div>	
                            <div class="col-sm-6 form-group required">
                                <p><strong>Deployment of Funds</strong> :<br> 
                                    <%= company.getDeployOfFunds()%></p>
                            </div>	
                        </div>
                    </div>
                </div>
                <p class="text-center"><a href="editCompanyProfile.jsp" class="btn btn-success btn-xs">Edit Company Profile</a></p>

            </div>
        </div>
    </div>
</div>
</div>


</body>



</html>
