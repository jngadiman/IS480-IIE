<%-- 
    Document   : MentorHomepage
    Created on : Oct 4, 2017, 10:25:01 AM
    Author     : Jennefer Ngadiman
--%>

<%@page import="DAO.RelationshipDAO"%>
<%@page import="DAO.ProgramStageDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor Homepage</title>
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">

                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h1 class="page-header">Mentor Dashboard</h1>
                    <%
                    String mentorEmail = user.getEmail();
                    ArrayList<Relationship> mentorRS = RelationshipDAO.getAllRelationshipsForMentor(mentorEmail);
                                    ArrayList<Integer> currentMentees = new ArrayList<Integer>();
                                    ArrayList<Integer> pastMentees = new ArrayList<Integer>();
                                    if (mentorRS != null || !mentorRS.isEmpty()) {
                                        for (Relationship rs : mentorRS) {
                                            String rsStatus = rs.getStatus();
                                            if (rsStatus.contains("assigned")) {
                                                currentMentees.add(rs.getCompanyID());
                                            }
                                            if (rsStatus.contains("over")) {
                                                pastMentees.add(rs.getCompanyID());
                                            }
                                        }
                                    }
                                    
                    %>
                    <div class="row placeholders">
                        <div class="col-lg-6 placeholder">
                        <h3>Current Start-up(s)</h3>
                        
                        <button href="#current" class="btn btn-default btn-xs" data-toggle="collapse"><%=currentMentees.size()%></button>
                            <div id="current" class="collapse">
                                
                                <%
                                   
                                    if(currentMentees != null && currentMentees.size() != 0){
                                        for(Integer c: currentMentees){
                                            String cName = companyController.getCompany(c).getName();
                                            out.println("<li>" + cName + "</li>");
                                        }
                                    }else{
                                        
                                    }
                                %>
                            </div>
                            </div>
                            <div class="col-lg-6 placeholder">
                                <h3>Past Start-up(s)</h3>
                        <button href="#past" class="btn btn-default btn-xs" data-toggle="collapse"><%=pastMentees.size()%></button>
                            <div id="past" class="collapse">
                                
                                <%
                                   
                                    if(pastMentees != null && pastMentees.size() != 0){
                                        for(Integer c: pastMentees){
                                            String cName = companyController.getCompany(c).getName();
                                            out.println("<li>" + cName + "</li>");
                                        }
                                    }else{
                                        
                                    }
                                %>
                            </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
