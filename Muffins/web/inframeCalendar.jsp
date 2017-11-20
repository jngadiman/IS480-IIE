<%-- 
    Document   : inlineFrameGoogleCalendar
    Created on : Oct 27, 2017, 12:04:29 PM
    Author     : JJAY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INLINE FRAME FOR GOOGLE CALENDAR</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/calendar.css" rel="stylesheet" />
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js"></script>
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
        <h1>INLINE FRAME FOR GOOGLE CALENDAR</h1>

        <!--Add buttons to initiate auth sequence and sign out-->
        <button id="authorize-button" style="display: none;">Authorize</button>
        <button id="signout-button" style="display: none;">Sign Out</button>

        <script type="text/javascript">
            // date variables
            var now = new Date();
            today = now.toISOString();

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
            "https://www.googleapis.com/auth/calendar.readonly";

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

            /**
             * Append a pre element to the body containing the given message
             * as its text node. Used to display the results of the API call.
             *
             * @param {string} message Text to be placed in pre element.
             */
            
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


        <script>
            function refreshICalendarframe() {
                var iframe = document.getElementById('divifm')
                iframe.innerHTML = iframe.innerHTML;
            }
            // setup event details

            // function load the calendar api and make the api call
            function makeApiCall() {
                var eventResponse = document.getElementById('event-response');

                gapi.client.load('calendar', 'v3', function () {					// load the calendar api (version 3)
                    var request = gapi.client.calendar.events.insert
                            ({
                                //need change to their email??        
                                'calendarId': 'incogiieportal@gmail.com', //calendar id
                                "resource": resource							// pass event details with api call
                            });

                    // handle the response from our api call
                    request.execute(function (resp) {
                        if (resp.status == 'confirmed') {
                            eventResponse.innerHTML = "Event created successfully. View it <a href='" + resp.htmlLink + "'>online here</a>.";
                            eventResponse.className += ' panel-success';
                            refreshICalendarframe();
                        } else {
                            document.getElementById('event-response').innerHTML = "There was a problem. Reload page and try again.";
                            eventResponse.className += ' panel-danger';
                        }
                    });
                });
            }
            var resource = {
                "summary": <%=request.getParameter("eventSummary")%>,
                "start": {
                    "dateTime": today
                },
                "end": {
                    "dateTime": twoHoursLater
                },
                "description": "We are organizing events",
                "location": "US",
                "attendees": [
                    {
                        "email": "xyz@gmail.com",
                        "displayName": "Shaveta",
                        "organizer": true,
                        "self": false,
                        "resource": false,
                        "optional": false,
                        "responseStatus": "needsAction",
                        "comment": "This is event first",
                        "additionalGuests": 3

                    },
                    {
                        "email": "abc@gmail.com",
                        "displayName": "Chatak",
                        "organizer": true,
                        "self": false,
                        "resource": false,
                        "optional": false,
                        "responseStatus": "needsAction",
                        "comment": "This is office event",
                        "additionalGuests": 3
                    }
                ],
            };

            // FUNCTION TO DELETE EVENT
            function deleteEvent() {
                gapi.client.load('calendar', 'v3', function () {
                    var request = gapi.client.calendar.events.delete({
                        'calendarId': 'incogiieportal@gmail.com',
                        'eventId': 'Hdusrtsbs8'
                    });
                    request.execute(function (resp) {
                        if (resp.status == 'confirmed') {
                            alert("Event was successfully removed from the calendar!");
                        } else {
                            alert('An error occurred, please try again later.')
                        }
                    });
                });
            }


        </script>

                    <script async defer src="https://apis.google.com/js/api.js"
                            onload="this.onload = function(){};handleClientLoad();listUpcomingEvents()"
                            onreadystatechange="if (this.readyState === 'complete') this.onload()">
                    </script>
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-bottom" role="navigation">
            <div class="container">
                
                
            </div>
        </nav>
        <!-- Page Content -->
        <div class="container">
            <div class="row">
                
                <!-- .col -->
                <div class="col-md-10 col-sm-10 col-xs-12">
                    <div class="panel panel-danger" id="result-panel">
                        <div class="panel-heading">
                            <h1>
                                My Calendar</h1>
                            
                        </div>
                    </div>
                    <!--  <input id="txtEventDetails" type="text" /> -->
                    					
                    
                    <div id="divifm">
                        <iframe id="ifmCalendar" src="https://calendar.google.com/calendar/embed?src=incogiieportal%40gmail.com&ctz=Asia/Singapore"
                                style="border-width: 0" width="950" height="520" frameborder="0" scrolling="no">
                        </iframe>
                    </div>
                </div>
            </div>
        </div>

                    
        <div class="container">
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




    </body>
</html>
