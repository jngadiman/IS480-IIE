<%-- 
    Document   : login
    Created on : Jun 24, 2017, 10:15:04 AM
    Author     : JEN
--%>

<%@page import="MODELS.Mentee"%>
<%@page import="MODELS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/cosmos.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>

    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">IIE Portal</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                <%
                    User user = (User) session.getAttribute("user");
                    if(user.getUser_type().equals("mentee")){
                        Mentee m = (Mentee) session.getAttribute("mentee");
                %>    
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="home.jsp">Homepage</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Actions<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="stages.jsp">Progress</a></li>
                                <li><a href="#">Meetings</a></li>
                                <li><a href="#">Calendar</a></li>
                                <%
                                    if(m != null){
                                        if(m.getMentee_type().equals("regular")){
                                %>
                                        <li><a href="requestForMentor.jsp?type=incubator">Request For Mentor</a></li>
                                <%
                                        }
                                    }
                                %>
                        <li><a href="requestForMentor.jsp?type=open">Open Mentorship Request</a></li>
                            </ul>
                        </li>
                        <li><a href="viewPersonalProfile.jsp">Profile</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                <%
                    }else if(user.getUser_type().equals("admin")){
                %>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="adminHomepage.jsp">Homepage</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Actions<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="adminViewAllRequests.jsp">Pending Request <span class="badge">14</span>  </a></li>
                                <li><a href="viewCompanyProfile.jsp">View All Companies</a></li>
                                <li><a href="viewAllMentees.jsp">View All Mentees</a></li>
                                <li><a href="viewAllMentors.jsp">View All Mentors</a></li>
                            </ul>
                        </li>
                        <li><a href="viewPersonalProfile.jsp">Profile</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                <%
                    }else{
                %>
                        <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Actions<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="stages.jsp">Progress</a></li>
                                <li><a href="#">Meetings</a></li>
                                <li><a href="#">Calendar</a></li>
                                <li><a href="viewCompanyProfile.jsp">View All Companies</a></li>
                                <li><a href="viewAllMentees.jsp">View All Mentees</a></li>
                                <li><a href="viewAllMentors.jsp">View All Mentors</a></li>
                            </ul>
                        </li>
                        <li><a href="viewPersonalProfile.jsp">Profile</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                <%
                    }
                %>
                    <form class="navbar-form navbar-right">
                        <input type="text" class="form-control" placeholder="Search...">
                    </form>
                </div>
            </div>
        </nav>
    </body>
</html>
