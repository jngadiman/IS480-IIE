<%-- 
    Document   : test
    Created on : Oct 4, 2017, 8:57:59 PM
    Author     : JJAY
--%>
<html>
    <head>

        <%@include file="sidenav.jsp" %>  
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
            <div class="col-lg-12">
                <div id='loading'>loading...</div>

                <div id='calendar'></div>
                <div class="col-lg-10 col-lg-offset-1">
                    <button id="authorize-button" class="btn btn-lg btn-info">Authorize</button>
                    
                    <button id="signout-button" style="display: none;">Sign Out</button>

                    <!--<pre id="content"></pre> -->
                    <script type="text/javascript">
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
                                'calendarId': calendarId
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
                                }
                            });
                        });

                    </script>
                    <script>
                        function bookMeeting() {
                            var start = document.getElementById("start_date").value;
                            var end = document.getElementById("end_date").value;
                            var summary = document.getElementById("meetingName").value;
                            var location = document.getElementById("location").value;
                            var status = document.getElementById("status").value;
                            var attendees = document.getElementById("attendees").value;

                            var personArr = attendees.split(", ");
                            var numberspaces = attendees.split(", ").length;
                            var attendeesStr = "";
                            for (i = 0; i < numberspaces; i++) {
                                attendeesStr += "{ 'email' : \'" + personArr[i] + "\'}";
                                if (numberspaces > 1 && i != numberspaces - 1) {
                                    attendeesStr += ", \n";
                                }
                                //personArr[0] -> every email
                            }
                            //break up the attendees string into different variables for each attendees. 
                            //then add them inside {} for attendees. 

                            var startDate = new Date(start);
                            var startDateStr = startDate.toISOString();

                            var endDate = new Date(end);
                            var endDateStr = endDate.toISOString();

                            submitOK = "true";

                            //        var now = new Date();    
                            //        var today = now.toISOString();
                            //
                            //        var twoHoursLater = new Date(now.getTime() + (2*1000*60*60));
                            //        twoHoursLater = twoHoursLater.toISOString();

                            alert("start: " + startDateStr);
                            alert("end: " + endDateStr);
                            alert("summary: " + summary);
                            alert("location: " + location);
                            alert("status: " + status);
                            alert("attendees: " + attendeesStr);

                            resource = {
                                "summary": summary,
                                "start": {
                                    "dateTime": startDateStr
                                },
                                "end": {
                                    "dateTime": endDateStr
                                },
                                "location": location,
                                "status": status,
                                "attendees": [
                                    //attendeesStr
                                    {
                                        "email": attendees
                                    }
                                ]
                            };

                            gapi.client.load('calendar', 'v3', function () { // load the calendar api (version 3)
                                var request = gapi.client.calendar.events.insert(
                                        {
                                            'calendarId': 'incogiieportal@gmail.com', // calendar ID  
                                            "resource": resource  // pass event details with api call
                                        });
                                request.sendNotifications = true;
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
                        }
                    </script>
                    <script async defer src="https://apis.google.com/js/api.js"
                            onload="this.onload = function () {};
                        handleClientLoad();"
                            onreadystatechange="if (this.readyState === 'complete') this.onload()">
                    </script>
                    <script src="https://apis.google.com/js/client.js?onload=handleClientLoad"></script>
                    <div id="event-response"></div>
                    <button type="submit" class="btn btn-lg btn-info" data-toggle="modal" data-target="#addEvents">Book a Meeting</button>
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
                                    <input class="form-control" id="location" name="location" type="text" placeholder="Enter The Meeting Location" class="form-control" required>
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

