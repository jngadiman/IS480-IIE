<%-- 
    Document   : addMeeting
    Created on : Nov 21, 2017, 1:17:33 AM
    Author     : Xinyao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Meeting</title>
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-10 col-sm-offset-1">
                <h2 class="col-lg-12 page-header">Add A New Meeting </h2>
                <div class="col-lg-12 well">
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

                            alert("start: " + startDateStr);
                            alert("end: " + endDateStr);
                            alert("summary: " + summary);
                            alert("location: " + location);
                            alert("status: " + status);
                            alert("attendees: " + attendees);
                            
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
                                <button type="submit" value="Book Timeslot" class="center-block btn btn-xs btn-default" onclick="bookMeeting()">Submit</button>
                            </div>
                                </form>
                </div>
                        
            </div>
        </div>
    </body>
</html>
