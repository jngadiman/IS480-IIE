<%-- 
    Document   : test
    Created on : Oct 4, 2017, 8:57:59 PM
    Author     : JJAY
--%>
<html>
<head>
<meta charset='utf-8' />
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
      "https://www.googleapis.com/auth/devstorage.full_control";
      "https://developers.google.com/identity/sign-in/web/reference#googleauthsigninoptions"

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

	

</script>
<input type ="hidden" value ="<%=request.getParameter("calendarID")%>" id ="calID">
<script>
        var calendarID = document.getElementById("calID").toString();
          $(document).ready(function() {
                $('#calendar').fullCalendar({
                    googleCalendarApiKey: API_KEY,
                    events: {
                        googleCalendarId: calendarID
                    }
                });
	});
    
</script>

<script async defer src="https://apis.google.com/js/api.js"
      onload="this.onload=function(){};handleClientLoad()"
      onreadystatechange="if (this.readyState === 'complete') this.onload()">
    </script>
    
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

	<div id='loading'>loading...</div>

	<div id='calendar'></div>
        
        

</body>
</html>

