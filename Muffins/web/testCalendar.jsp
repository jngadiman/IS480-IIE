<%-- 
    Document   : testCalendar
    Created on : 7 Oct, 2017, 6:12:29 PM
    Author     : Hui Min
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='css/fullcalendar.min.css' rel='stylesheet' />
<link href='css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='css/moment.min.js'></script>
<script src='css/lib/jquery.min.js'></script>
<script src='css/fullcalendar.min.js'></script>
<script src='css/gcal.min.js'></script>
<link rel="stylesheet" href="css/fullcalendar.css" />

<script src="js/jquery-3.2.1.min.js"></script>

<script src="css/fullcalendar.min.js"></script>
<script type='text/javascript' src='css/gcal.js'></script>

        <title>JSP Page</title>
        <script>
            // Google api console clientID and apiKey 

                var clientId = '886878581294-gvgjasgb61ncsjc9622nrqon6sug4tan.apps.googleusercontent.com';
                var apiKey = 'AIzaSyD7E4RajRYzD2P9V97jQGvWYtgonmNK2no';

                // enter the scope of current project (this API must be turned on in the Google console)
                  var scopes = 'https://www.googleapis.com/auth/calendar';


               // OAuth2 functions
                    function handleClientLoad() {
                          gapi.client.setApiKey(apiKey);
                          window.setTimeout(checkAuth, 1);
                       }

               //To authenticate
                 function checkAuth() {
                   gapi.auth.authorize({ client_id: clientId, scope: scopes, immediate: true }, handleAuthResult);
                       }

               // This is the resource we will pass while calling api function
               var resource = {
                           "summary": "My Event",
                           "start": {
                               "dateTime": today
                           },
                           "end": {
                               "dateTime": twoHoursLater
                           },
                           "description":"We are organizing events",
                           "location":"US",
                           "attendees":[
                           {
                                   "email":"attendee1@gmail.com",
                                   "displayName":"Jhon",
                                   "organizer":true,
                                   "self":false,
                                   "resource":false,
                                   "optional":false,
                                   "responseStatus":"needsAction",
                                   "comment":"This is my demo event",
                                   "additionalGuests":3

                           },
                           {    
                               "email":"attendee2@gmail.com",
                                   "displayName":"Marry",
                                   "organizer":true,
                                   "self":false,
                                   "resource":false,
                                   "optional":false,
                                   "responseStatus":"needsAction",
                                   "comment":"This is an official event",
                                   "additionalGuests":3
                           }
                           ],
                       };

               function makeApiCall(){
               gapi.client.load('calendar', 'v3', function () { // load the calendar api (version 3)
                               var request = gapi.client.calendar.events.insert
                               ({
                                   'calendarId': '24tn4fht2tr6m86efdiqqlsedk@group.calendar.google.com', 
               // calendar ID which id of Google Calendar where you are creating events. this can be copied from your Google Calendar user view.

                                   "resource": resource 	// above resource will be passed here
                               });                
               }
           }
        </script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <button id="btnCreateEvents" class="btn btn-primary" onclick="makeApiCall();">Create Events</button>  
        <div id='loading'>loading...</div>

	<div id='calendar'></div>
        <div id="divifm">
            <iframe 
                src="https://calendar.google.com/calendar/embed?src=huimin.sim.2015%40smu.edu.sg&ctz=Asia/Singapore" 
                style="border: 0" 
                width="800" 
                height="600" 
                frameborder="0" 
                scrolling="no">
            </iframe>

        </div>
    </body>
</html>
