<%-- 
    Document   : calendar
    Created on : Aug 21, 2017, 3:34:27 PM
    Author     : Xinyao
--%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="CONTROLLER.mentorController"%>
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
        <title>View Calendar</title>
        <%@include file="navbar.jsp" %>
        <link href="css/dashboard.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@ page  language="java" import="java.util.*,java.text.*"%>
        <%!
        public int nullIntconv(String inv)
        {   
            int conv=0;

            try{
                conv=Integer.parseInt(inv);
            }
            catch(Exception e)
            {}
            return conv;
        }
        %>
        <%
         int iYear=nullIntconv(request.getParameter("iYear"));
         int iMonth=nullIntconv(request.getParameter("iMonth"));

         Calendar ca = new GregorianCalendar();
         int iTDay=ca.get(Calendar.DATE);
         int iTYear=ca.get(Calendar.YEAR);
         int iTMonth=ca.get(Calendar.MONTH);

         if(iYear==0)
         {
              iYear=iTYear;
              iMonth=iTMonth;
         }

         GregorianCalendar cal = new GregorianCalendar (iYear, iMonth, 1); 

         int days=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
         int weekStartDay=cal.get(Calendar.DAY_OF_WEEK);

         cal = new GregorianCalendar (iYear, iMonth, days); 
         int iTotalweeks=cal.get(Calendar.WEEK_OF_MONTH);

        %>
        <html>
        <head>
        <title>How to create Calendar in JSP</title>
        <script>
        function goTo()
        {
          document.frm.submit()
        }
        </script>
        <style>
        body
        {
         font-family:Verdana, Arial, Helvetica, sans-serif
        }
        .dsb
        {
         background-color:#EEEEEE
        }
        </style>
        </head>

        <body>
        <form name="frm" method="post">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="5%">&nbsp;</td>
            <td width="30%">&nbsp;</td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%">Year</td>
                <td width="7%">
                <select name="iYear" onChange="goTo()">
                <%
                // start year and end year in combo box to change year in calendar
                for(int iy=iTYear-70;iy<=iTYear+70;iy++)
                {
                  if(iy==iYear)
                  {
                    %>
                  <option value="<%=iy%>" selected="selected"><%=iy%></option>
                  <%
                  }
                  else
                  {
                    %>
                  <option value="<%=iy%>"><%=iy%></option>
                  <%
                  }
                }
               %>
                </select></td>
                <td width="73%" align="center" style="color:#4E96DE"><h3><%=new SimpleDateFormat("MMMM").format(new Date(2008,iMonth,01))%> <%=iYear%></h3></td>
                <td width="6%">Month</td>
                <td width="8%">
                <select name="iMonth" onChange="goTo()">
                <%
                // print month in combo box to change month in calendar
                for(int im=0;im<=11;im++)
                {
                  if(im==iMonth)
                  {
                 %>
                  <option value="<%=im%>" selected="selected"><%=new SimpleDateFormat("MMMM").format(new Date(2008,im,01))%></option>
                  <%
                  }
                  else
                  {
                    %>
                  <option value="<%=im%>"><%=new SimpleDateFormat("MMMM").format(new Date(2008,im,01))%></option>
                  <%
                  }
                }
               %>
                </select></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td><table align="center" border="1" cellpadding="3" cellspacing="0" width="100%">
              <tbody>
                <tr>
                  <th>Sun</th>
                  <th>Mon</th>
                  <th>Tue</th>
                  <th>Wed</th>
                  <th>Thu</th>
                  <th>Fri</th>
                  <th>Sat</th>
                </tr>
                <%
                int cnt =1;
                for(int i=1;i<=iTotalweeks;i++)
                {
                %>
                <tr>
                  <% 
                    for(int j=1;j<=7;j++)
                    {
                        if(cnt<weekStartDay || (cnt-weekStartDay+1)>days)
                        {
                         %>
                        <td align="center" height="35" class="dsb">&nbsp;</td>
                       <% 
                        }
                        else
                        {
                         %>
                        <td align="center" height="35" id="day_<%=(cnt-weekStartDay+1)%>"><span><%=(cnt-weekStartDay+1)%></span></td>
                       <% 
                        }
                        cnt++;
                      }
                    %>
                </tr>
                <% 
                }
                %>
              </tbody>
            </table></td>
          </tr>
        </table></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          
        </table>
        </form>
              <p class="text-center"><a href="addMeeting.jsp" class="btn btn-success btn-xs">Add Meeting</a></p>
        </body>
        </html> 