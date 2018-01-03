<%-- 
    Document   : test
    Created on : Oct 4, 2017, 8:57:59 PM
    Author     : JJAY
--%>
<%@include file="sidenav.jsp" %>  
<%@page import="com.google.api.client.http.HttpTransport"%>
<%@page import="com.google.api.client.json.jackson2.JacksonFactory"%>
<%@page import="com.google.api.client.json.JsonFactory"%>
<html>
    <head>
        <meta charset='utf-8' />
        <script src='js/jquery-3.2.1.min.js'></script>
        <script src='css/fullcalendar.min.js'></script>
        <script src='css/moment.min.js'></script>
        <script src='css/gcal.min.js'></script>
        <link href='css/fullcalendar.min.css' rel='stylesheet' />
        <link href='css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
        <link rel="stylesheet" href="css/fullcalendar.css" />
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="css/fullcalendar.min.js"></script>
        <script type='text/javascript' src='css/gcal.js'></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <style>

            body {
                margin: 40px 10px;
                padding: 0;
                font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
                font-size: 14px;
            }

            #loading {
                display: none;
                position: absolute;
                top: 10px;
                right: 10px;
            }

            #calendar {
                max-width: 900px;
                margin: 0 auto;
            }

        </style>        


    </head>
    <body>
        <div class="container">
            <div class="col-lg-10 col-lg-offset-2">
                <div id='loading'>loading...</div>

                <div id='calendar'></div>
                <div class="col-lg-10 col-lg-offset-1">
                    <br>
                    <button id="authorize-button" class="btn btn-xs btn-info center-block" onClick="handleAuthClick">Authorize</button>
                    <br>
                    <button id="signout-button" style="display: none;" onClick="handleSignoutClick">Sign Out</button>
<!--                    <pre id="content"></pre>-->
                    <script type="text/javascript">
                        var calendarId = 'incogiieportal@gmail.com';
                        var now = new Date();
                        var today = now.toISOString();

                        var twoHoursLater = new Date(now.getTime() + (2 * 1000 * 60 * 60));
                        twoHoursLater = twoHoursLater.toISOString();
                        // Client ID and API key from the Developer Console
                        var CLIENT_ID = '886878581294-gvgjasgb61ncsjc9622nrqon6sug4tan.apps.googleusercontent.com';

                        // Google Calendar API key from Developer Console
                        var API_KEY = 'AIzaSyD7E4RajRYzD2P9V97jQGvWYtgonmNK2no';

                        // Array of API discovery doc URLs for APIs used by the quickstart
                        var DISCOVERY_DOCS = ["https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest"];

                        // Authorization scopes required by the API; multiple scopes can be
                        // included, separated by spaces.
                        var SCOPES = "https://www.googleapis.com/auth/calendar";

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

                        // show/hide the 'authorize' button, depending on application state
                        function handleAuthResult(authResult) {
                            var authorizeButton = document.getElementById('authorize-button');

                            if (authResult && !authResult.error) {
                                authorizeButton.style.visibility = 'hidden';
                                //makeApiCall();											// call the api if authorization passed
                                bookMeeting();
                            } else {													// otherwise, show button
                                authorizeButton.style.visibility = 'visible';
                                resultPanel.className += ' panel-danger';				// make panel red
                                authorizeButton.onclick = handleAuthClick;				// setup function to handle button click
                            }
                        }

                        function makeApiCall() {
                            
                            requestList = gapi.client.calendar.events.list({
                                'calendarId': calendarId,
                            });
                            
                            console.log('--- eventsList ---');
                            console.log(eventsList);
                            uiCalendarConfig.calendars['myCalendar'].fullCalendar('removeEventSource', eventsList);
                            eventsList = [];

                            // Step 6: Execute the API request
                            requestList
                                    .then(function (resp) {

                                        if (resp.result.error) {

                                            reportError('Google Calendar API: ' + data.error.message, data.error.errors);

                                        } else if (resp.result.items) {

                                            resp.result.items.forEach(function (entry, index) {
                                                eventsList.push({
                                                    id: entry.id,
                                                    title: entry.summary,
                                                    start: entry.start.dateTime || entry.start.date, // try timed. will fall back to all-day
                                                    end: entry.end.dateTime || entry.end.date, // same
                                                    url: url,
                                                    location: entry.location,
                                                    description: entry.description
                                                });
                                            });

                                        }

                                        if (eventsList.length > 0) {
                                            uiCalendarConfig.calendars['myCalendar'].fullCalendar('addEventSource', eventsList, true);
                                        }

                                    }, function (reason) {
                                        console.log('Error: ' + reason.result.error.message);
                                    });
                        }

                        // setup event details
                        var resource = {};
                        
                        
                        
                        //display messages in element called "content" by appending
                        function appendPre(message) {
                            var pre = document.getElementById('content');
                            var textContent = document.createTextNode(message + '\n');
                            pre.appendChild(textContent);
                        }
                        
                        //get the upcoming events in the calendar
                        var occupiedStartDates = new Array();
                        var occupiedEndDates = new Array();
                        function listUpcomingEvents() {
                          gapi.client.calendar.events.list({  
                            'calendarId': calendarId,
                            'timeMin': (new Date()).toISOString(),
                            'showDeleted': false,
                            'singleEvents': true,
                            'maxResults': 100,
                            'orderBy': 'startTime'
                          }).then(function(response) {
                            var events = response.result.items;
                            event = events;
                            appendPre('Upcoming events:');

                            if (events.length > 0) {
                              for (i = 0; i < events.length; i++) {
                                var event = events[i];
                                var when = event.start.dateTime;
                                var end = event.end.dateTime;
                                var eventid = event.id;
                                var attendees = [];
                                attendees = event.attendees;
                                //document.write("TO SEE THE START DATETIME"+when);
                                if (!when) {
                                  when = event.start.date;
                                }
                                occupiedStartDates.push(when);
                                appendPre(event.summary + ' (' + when + ')')
                                occupiedEndDates.push(end);
                                for(j = 0; j < attendees.length; j++){
                                    appendPre('attendees: ' + attendees[j].email)
                                    //check if in the attendees have the current logged in user for google calendar login
                                    //then get the id? or the event index in this loop, and then call only these indexes 
                                    //from the event list and display
                                    //var currentUserEmail = GoogleUser.getBasicProfile().getEmail();
                                    //appendPre('currentUser: ' + currentUserEmail)
                                }
                              }
                            } else {
                              appendPre('No upcoming events found.');
                            }
                          });
                        }
                        
//                        function loadCalendarApi() {
//                            gapi.client.load('calendar', 'v3', listUpcomingEvents());
//                        }
                    </script>

                    <script>

                        $(document).ready(function () {
                            $('#calendar').fullCalendar({
                                googleCalendarApiKey: API_KEY,
                                selectable: true,
                                selectHelper: true,
                                // here is the part :

                                editable: true,
                                eventSources: [
                                    {
                                        googleCalendarId: 'incogiieportal@gmail.com'
                                    }
                                ],
                                header: {
                                    left: 'prev,next today myCustomButton',
                                    center: 'title',
                                    right: 'month,agendaWeek,agendaDay'
                                },
                                eventClick:function(calEvent, jsEvent, view){ 
                                    //$(this).toggleClass('newColor');
//                                    event.preventDefault();
                                    alert('Event id: ' + calEvent.id); //event ID
                                    // "id" if it is set by the event object, will be here.
                                    $('#editEvents').modal('show'); 
                                    //stuff for updating an event
                                    return false;
                                    var event = {
                                        'summary': summaryTxt,
                                        'location': locationTxt,
                                        'description': ' ',
                                        'start': {
                                          'dateTime': datetime,
                                        },
                                        'end': {
                                          'dateTime': datimeEnd,
                                        },


                                        'reminders': {
                                          'useDefault': false,
                                          'overrides': [
                                            {'method': 'email', 'minutes': 24 * 60},
                                            {'method': 'popup', 'minutes': 10}
                                          ]
                                        }
                                      };
                                      
                                    var request = gapi.client.calendar.events.update({
                                        'calendarId': 'primary',
                                        'eventId':google_event_id,
                                        'resource': event
                                      });
                                      
                                    request.execute(function(event) {
                                        alert('Event updated successfully' );
                                    });
                                    //ends here - still testing in process
                                    //console.log(this);  // is the div element that was clicked on
                                } 
                                        
//                                        function(resource, element) {
//                                    event.preventDefault();
//                                    event.title = "CLICKED!";
//                                    //if (resource.url) {
//                                        alert("Event: " + event.title);
//                                        //alert("Event ID: " + event.fullCalendar( 'getEventSourceById', id ));
//                                        //$('#editEvents').modal('show'); 
//                                        //return false;
//                                    //}
//                                    //$('#calendar').fullCalendar('updateEvent', event);
//                                    
//                                }
                            });
                        });

                    </script>
                    <script>
                        //get meeting details keyed in by the user and create an event in google calendar
                        function bookMeeting() {
                            var start = document.getElementById("start_date").value;
                            var end = document.getElementById("end_date").value;
                            var summary = document.getElementById("meetingName").value;
                            var location = document.getElementById("location").value;
                            var status = document.getElementById("status").value;
                            var attendees = document.getElementById("attendees").value;

                            var personArr = attendees.split(", ");
                            var numberspaces = attendees.split(", ").length;
                            var attendeesArr = [];
                            
                            for (i = 0; i < numberspaces; i++) {
                                var person = new Object();
                                person.email = personArr[i];
                                attendeesArr.push(person);
                                //personArr[0] -> every email
                            }
                            //break up the attendees string into different variables for each attendees. 
                            //then add them inside {} for attendees. 

                            var startDate = new Date(start);
                            var startDateStr = startDate.toISOString();

                            var endDate = new Date(end);
                            var endDateStr = endDate.toISOString();
                            
                            var visibility = "public";
                            var transparency = "opaque";

                            submitOK = "true";

                            //        var now = new Date();    
                            //        var today = now.toISOString();
                            //
                            //        var twoHoursLater = new Date(now.getTime() + (2*1000*60*60));
                            //        twoHoursLater = twoHoursLater.toISOString();

//                            alert("start: " + startDateStr);
//                            alert("end: " + endDateStr);
//                            alert("summary: " + summary);
//                            alert("location: " + location);
//                            alert("status: " + status);
//                            alert("attendees: " + attendees);
                            
                            resource = {
                                "summary": summary,
                                "start": {
                                    "dateTime": startDateStr
                                },
                                "end": {
                                    "dateTime": endDateStr
                                },
                                "location": "SMU BIG Incubator At SOA Basement",
                                "status": status,
                                "transparency": transparency,
                                "visibility": visibility,
                                "attendees": attendeesArr
                            };

                            gapi.client.load('calendar', 'V3', function () { // load the calendar api (version 3)
                                var request = gapi.client.calendar.events.insert(
                                        {
                                            'calendarId': 'incogiieportal@gmail.com', // calendar ID  
                                            "resource": resource,  // pass event details with api call
                                            "sendNotifications": true
                                        });
                                //request.sendNotifications = true;
                                // handle the response from our api call
                                request.execute(function (resp) {
                                    if (resp.status == 'confirmed') {
                                        
                                        document.getElementById('event-response').innerHTML = "Event created successfully. View it <a href='" + resp.htmlLink + "'>online here</a>.";
                                        
                                    } else {
                                        document.getElementById('event-response').innerHTML = "There was a problem. Reload page and try again.";
                                    }
                                    /* for (var i = 0; i < resp.items.length; i++) {		// loop through events and write them out to a list
                                     var li = document.createElement('li');
                                     var eventInfo = resp.items[i].summary + ' ' +resp.items[i].start.dateTime;
                                     li.appendChild(document.createTextNode(eventInfo));
                                     document.getElementById('events').appendChild(li);
                                     } */
                                    console.log(resp);
                                });
                            });
                            
                            window.location.reload(true);
                        }
                        
                    </script>
                    <script async defer src="https://apis.google.com/js/api.js"
                            onload="this.onload = function(){};handleClientLoad();listUpcomingEvents()"
                            onreadystatechange="if (this.readyState === 'complete') this.onload()">
                    </script>
                    <script src="https://apis.google.com/js/client.js?onload=handleClientLoad"></script>
                    <div id="event-response"></div>
                    <button type="submit" class="btn btn-xs btn-info center-block" data-toggle="modal" data-target="#addEvents">Book a Meeting</button>
                </div>
                <div id="addEvents" class="modal fade" role="dialog">

                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Book A Timing With EIR</h4>
                            </div>
                            <form role="form" method="POST" action="meetingServlet">
                            <div class="modal-body">
                                
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Meeting Name</label>
                                    <input class="form-control" id="meetingName" name="meetingName" type="text" placeholder="Enter Meeting Name" class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Location</label>
                                    <input class="form-control" id="location" name="location" type="text" value="SMU BIG Incubator" class="form-control" disabled required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Start Date</label>
                                    <input class="form-control" id="start_date" name="start_date" type="datetime-local" placeholder="Enter Start Date DD/MM/YYYY" class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">End Date</label>
                                    <input class="form-control" id="end_date" name= "end_date" type="datetime-local" placeholder="Enter End Date DD/MM/YYYY" class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Attendees</label>
                                    <input class="form-control" id="attendees" name="attendees" type="text" placeholder="Enter The Emails of the Attendees" class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Status</label>
                                    <select class="form-control" id="status" name="status" class="form-control" required>
                                        <option value="confirmed">confirmed</option>
                                        <option value="tentative">tentative</option>
                                        <option value="cancelled">cancelled</option>
                                    </select>
                                </div>
                                    
                                
                            </div>

                            <div class="modal-footer">
                                <button type="submit" value="Book Timeslot" class="btn btn-xs btn-default" onclick="bookMeeting()">Submit</button>
                            </div>
                                </form>
                        </div>
                    </div>
                </div>
                
                <div id="editEvents" class="modal fade" role="dialog">

                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Edit Meeting Details With EIR</h4>
                            </div>
                            <form role="form" method="POST" action="editMeetingDetailsServlet">
                            <div class="modal-body">
                                
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Meeting Name</label>
                                    <input class="form-control" id="meetingName" name="meetingName" type="text" placeholder="Enter Meeting Name" class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Location</label>
                                    <input class="form-control" id="location" name="location" type="text" value="SMU BIG Incubator" class="form-control" disabled required>

                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Start Date</label>
                                    <input class="form-control" id="start_date" name="start_date" type="datetime-local" placeholder="Enter Start Date DD/MM/YYYY" class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">End Date</label>
                                    <input class="form-control" id="end_date" name= "end_date" type="datetime-local" placeholder="Enter End Date DD/MM/YYYY" class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Attendees</label>
                                    <input class="form-control" id="attendees" name="attendees" type="text" placeholder="Enter The Emails of the Attendees" class="form-control" required>
                                </div>
                                <div class="col-sm-6 form-group required">
                                    <label class="control-label">Status</label>
                                    <select class="form-control" id="status" name="status" class="form-control" required>
                                        <option value="confirmed">confirmed</option>
                                        <option value="tentative">tentative</option>
                                        <option value="cancelled">cancelled</option>
                                    </select>
                                </div>
                                    
                                
                            </div>

                            <div class="modal-footer">
                                <button type="submit" value="Book Timeslot" class="btn btn-xs btn-default" onclick="bookMeeting()">Submit</button>
                            </div>
                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

