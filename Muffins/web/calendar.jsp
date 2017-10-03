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
        <p>Google Calendar API Quickstart</p>

    <!--Add buttons to initiate auth sequence and sign out-->
    <button id="authorize-button" style="display: none;">Authorize</button>
    <button id="signout-button" style="display: none;">Sign Out</button>

    <pre id="content"></pre>

    <script type="text/javascript">
      // Client ID and API key from the Developer Console
      var CLIENT_ID = '886878581294-gvgjasgb61ncsjc9622nrqon6sug4tan.apps.googleusercontent.com';

      // Array of API discovery doc URLs for APIs used by the quickstart
      var DISCOVERY_DOCS = ["https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest"];

      // Authorization scopes required by the API; multiple scopes can be
      // included, separated by spaces.
      var SCOPES = "https://www.googleapis.com/auth/calendar.readonly";

      var authorizeButton = document.getElementById('authorize-button');
      var signoutButton = document.getElementById('signout-button');

      /**
       *  On load, called to load the auth2 library and API client library.
       */
      function handleClientLoad() {
        gapi.load('client:auth2', initClient);
      }

      /**
       *  Initializes the API client library and sets up sign-in state
       *  listeners.
       */
      function initClient() {
        gapi.client.init({
          discoveryDocs: DISCOVERY_DOCS,
          clientId: CLIENT_ID,
          scope: SCOPES
        }).then(function () {
          // Listen for sign-in state changes.
          gapi.auth2.getAuthInstance().isSignedIn.listen(updateSigninStatus);

          // Handle the initial sign-in state.
          updateSigninStatus(gapi.auth2.getAuthInstance().isSignedIn.get());
          authorizeButton.onclick = handleAuthClick;
          signoutButton.onclick = handleSignoutClick;
        });
      }

      /**
       *  Called when the signed in status changes, to update the UI
       *  appropriately. After a sign-in, the API is called.
       */
      function updateSigninStatus(isSignedIn) {
        if (isSignedIn) {
          authorizeButton.style.display = 'none';
          signoutButton.style.display = 'block';
          listUpcomingEvents();
        } else {
          authorizeButton.style.display = 'block';
          signoutButton.style.display = 'none';
        }
      }

      /**
       *  Sign in the user upon button click.
       */
      function handleAuthClick(event) {
        gapi.auth2.getAuthInstance().signIn();
      }

      /**
       *  Sign out the user upon button click.
       */
      function handleSignoutClick(event) {
        gapi.auth2.getAuthInstance().signOut();
      }

      /**
       * Append a pre element to the body containing the given message
       * as its text node. Used to display the results of the API call.
       *
       * @param {string} message Text to be placed in pre element.
       */
      function appendPre(message) {
        var pre = document.getElementById('content');
        var textContent = document.createTextNode(message + '\n');
        pre.appendChild(textContent);
      }

      /**
       * Print the summary and start datetime/date of the next ten events in
       * the authorized user's calendar. If no events are found an
       * appropriate message is printed.
       */
      function listUpcomingEvents() {
        gapi.client.calendar.events.list({
          'calendarId': 'primary',
          'timeMin': (new Date()).toISOString(),
          'showDeleted': false,
          'singleEvents': true,
          'maxResults': 10,
          'orderBy': 'startTime'
        }).then(function(response) {
          var events = response.result.items;
          appendPre('Upcoming events:');

          if (events.length > 0) {
            for (i = 0; i < events.length; i++) {
              var event = events[i];
              var when = event.start.dateTime;
              if (!when) {
                when = event.start.date;
              }
              appendPre(event.summary + ' (' + when + ')')
            }
          } else {
            appendPre('No upcoming events found.');
          }
        });
      }

    </script>

    <script async defer src="https://apis.google.com/js/api.js"
      onload="this.onload=function(){};handleClientLoad()"
      onreadystatechange="if (this.readyState === 'complete') this.onload()">
    </script>
        
    
    //NOT GOOGLE CALENDAR
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