<%-- 
    Document   : test
    Created on : Oct 4, 2017, 8:57:59 PM
    Author     : JJAY
--%>
<html>
<head>
<meta charset='utf-8' />
<script src='js/jquery-3.2.1.min.js'></script>
<link href='css/fullcalendar.min.css' rel='stylesheet' />
<link href='css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='css/moment.min.js'></script>
<script src='css/fullcalendar.min.js'></script>
<script src='css/gcal.min.js'></script>
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
<% 
    String calID = (String) session.getAttribute("calendarID");
    calID = calID.trim();
%>
<script>
    var calID = 'huimin.sim.2015@smu.edu.sg';
</script>
    
</head>
<body>
        <div id='loading'>loading...</div>

	<div id='calendar'></div>
        
    <button id="authorize-button" style="display: none;">Authorize</button>
    <button id="signout-button" style="display: none;">Sign Out</button>

    <pre id="content"></pre>
   <script type="text/javascript">
            
      // Client ID and API key from the Developer Console
      var CLIENT_ID = '886878581294-gvgjasgb61ncsjc9622nrqon6sug4tan.apps.googleusercontent.com';
      
      // Google Calendar API key from Developer Console
      var API_KEY = 'AIzaSyD7E4RajRYzD2P9V97jQGvWYtgonmNK2no';

      // Array of API discovery doc URLs for APIs used by the quickstart
      var DISCOVERY_DOCS = ["https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest"];

      // Authorization scopes required by the API; multiple scopes can be
      // included, separated by spaces.
      var SCOPES = "https://www.googleapis.com/auth/calendar"

      var authorizeButton = document.getElementById('authorize-button');
      var signoutButton = document.getElementById('signout-button');

      /**
       *  On load, called to load the auth2 library and API client library.
       */
      function handleClientLoad() {
        gapi.load('client:auth2', initClient);
      }
      
      function loadCalendarApi() {
        gapi.client.load('calendar', 'v3', makeApiCall);
      }
      
      /**
       *  Initializes the API client library and sets up sign-in state
       *  listeners.
       */
      function initClient() {
        gapi.client.init({
          apiKey: API_KEY,
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
        listUpcomingEvents();
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
      
      /**
       * Print the summary and start datetime/date of the next ten events in
       * the authorized user's calendar. If no events are found an
       * appropriate message is printed.
       */
      var occupiedStartDates = new Array();
      var occupiedEndDates = new Array();
      function listUpcomingEvents() {
        var gEventArray = [];
        gapi.client.calendar.events.list({
          'calendarId': 'primary',
          'timeMin': (new Date()).toISOString(),
          'showDeleted': false,
          'singleEvents': true,
          'maxResults': 100,
          'orderBy': 'startTime'
        }).then(function(response) {
          var events = response.result.items;
          alert(response);
        if(events == null){
            alert("Events are null");
        }
        alert("Events are NOT null");
          event = events;
          alert("listUpcomingEvents: " + event);
          if (events.length > 0) {
            for (i = 0; i < events.length; i++) {
              var eventGoogle  = events[i];
              var event = {};
              var when = eventGoogle.start.dateTime;
              var end = eventGoogle.end.dateTime;
              event.title = eventGoogle.summary;
              event.description = eventGoogle.description;
              //document.write("TO SEE THE START DATETIME"+when);
              if (!when) {
                event.start = moment(eventGoogle.start.date);
              }
              occupiedStartDates.push(when);
              occupiedEndDates.push(end);
              gEventArray.push(event);
            }
            alert(gEventArray)
            return gEventArray;
          }     
        });
      }

</script>


<script async defer src="https://apis.google.com/js/api.js"
      onload="loadCalendar();handleClientLoad();"
      onload="this.onload=function(){};handleClientLoad()"
      onreadystatechange="if (this.readyState === 'complete') this.onload()">
    </script>

<script>
      
        function loadCalendar() {
//                var gEventArray = listUpcomingEvents();
//                alert(gEventArray);
                $('#calendar').fullCalendar({
                    selectable: true,
                    selectHelper: true,
                    // here is the part :
                    onClick: function(start, end) {
                            modalbox(start.format(),end.format());
                    },
                    editable: true,
                    googleCalendarApiKey: API_KEY,
                    events: {  
                        googleCalendarId: calID
                    }
                    //IMPT
                    //need print out all the values of the event into json
//                    events: [{
//                                title: event.title,
//                                start: event.start.dateTime,
//                                description: event.summary
//                                }]
//                                
                    //something wrong witj 
//                    eventRender: function(event, element) {
//                        element.qtip({
//                            content: event.description
//                        });
//                    }
                    
                });
	}
    
</script>
<script type='text/javascript'>

//$(function() {

//function modalbox(start,end) {
//    ID = "popup";
//    // Title
//    var pop_content = '<h2>New event:</h2>
//    <form><div style="float:left;width:70%;text-align:right"><INPUT TYPE="TEXT" ID="title" style="width:200px;height:30px;line-height:30px;margin:5px;background-color:#EEF4F7" NAME="title" ><br>';
//    // Place
//    pop_content += '<div style="font-size:11px;color:gray;margin-top:10px">Place: <INPUT TYPE="TEXT" ID="where_event" style="width:200px;height:20px;line-height:20px;margin:3px;vertical-align:middle"  NAME="where_event"><br>';
//    // Description
//    pop_content += 'Content : <TEXTAREA ID="content_event" style="width:200px;height:60px;margin:3px;font-family:sans-serif;font-size:13px;vertical-align:middle" NAME="content_event"></TEXTAREA></div> </div>';
//    // Submit       
//    pop_content += '<INPUT type="submit" style="height:40px;width:90px" value="OK">';
//    // Start and End of the event
//    pop_content += '<INPUT TYPE="HIDDEN" ID="start" NAME="start" value="'+start+'"><INPUT type="HIDDEN" ID="end" NAME="end" value="'+end+'"></form>';
//
//    /****** Some CSS effect *****************/
//    $('#'+ID).fadeIn().css({'width': 500})
//        .empty()
//        .prepend('<a href="#" class="close"><img src="images/close.png" border="0" class="btn_close" title="Fermer" alt="Fermer" /></a>')
//        .append(pop_content);   
//    // Some CSS Adjust for centering the box
//    var popMargTop = ($('#' + ID).height() + 80) / 2;
//    var popMargLeft = ($('#' + ID).width() + 80) / 2;
//    $('#' + ID).css({
//        'margin-top' : -popMargTop,
//        'margin-left' : -popMargLeft
//    });
//    //Effet fade-in du fond opaque
//    $('body').append('<div id="fade"></div>'); //Ajout du fond opaque noir
//    //Apparition du fond - .css({'filter' : 'alpha(opacity=80)'}) pour corriger les bogues de IE
//    $('#fade').css({'filter' : 'alpha(opacity=80)'}).fadeIn();
//    //Fade in the Popup and add close button
//    }
//    /********** end of CSS effects *************/
//
//    });
    </script>

<div id="popup" class="popup_block"></div>
<button id="authorize-button" style="display: none;">Authorize</button>
    <button id="signout-button" style="display: none;">Sign Out</button>
</body>
</html>

    