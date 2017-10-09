<%-- 
    Document   : EIRCalendar
    Created on : 8 Oct, 2017, 9:35:57 PM
    Author     : Hui Min
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
<link href="css/cosmos.css" rel="stylesheet" type="text/css"/>
<link href="css/dashboard.css" rel="stylesheet" type="text/css"/>
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>EIR Calendar</h1>
        <script>
        $(document).ready(function() {
            $('#calendar').fullCalendar({
                selectable: true,
                selectHelper: true,
                // here is the part :
                select: function(start, end) {
                        modalbox(start.format(),end.format());
                },
                editable: true
             });
         }
        </script>
        <script type='text/javascript'>

        $(function() {

        function modalbox(start,end) {
            ID = "popup";
            // Title
            var pop_content = '<h2>New event:</h2>
            <form><div style="float:left;width:70%;text-align:right"><INPUT TYPE="TEXT" ID="title" style="width:200px;height:30px;line-height:30px;margin:5px;background-color:#EEF4F7" NAME="title" ><br>';
            // Place
            pop_content += '<div style="font-size:11px;color:gray;margin-top:10px">Place: <INPUT TYPE="TEXT" ID="where_event" style="width:200px;height:20px;line-height:20px;margin:3px;vertical-align:middle"  NAME="where_event"><br>';
            // Description
            pop_content += 'Content : <TEXTAREA ID="content_event" style="width:200px;height:60px;margin:3px;font-family:sans-serif;font-size:13px;vertical-align:middle" NAME="content_event"></TEXTAREA></div> </div>';
            // Submit       
            pop_content += '<INPUT type="submit" style="height:40px;width:90px" value="OK">';
            // Start and End of the event
            pop_content += '<INPUT TYPE="HIDDEN" ID="start" NAME="start" value="'+start+'"><INPUT type="HIDDEN" ID="end" NAME="end" value="'+end+'"></form>';

            /****** Some CSS effect *****************/
            $('#'+ID).fadeIn().css({'width': 500})
                .empty()
                .prepend('<a href="#" class="close"><img src="images/close.png" border="0" class="btn_close" title="Fermer" alt="Fermer" /></a>')
                .append(pop_content);   
            // Some CSS Adjust for centering the box
            var popMargTop = ($('#' + ID).height() + 80) / 2;
            var popMargLeft = ($('#' + ID).width() + 80) / 2;
            $('#' + ID).css({
                'margin-top' : -popMargTop,
                'margin-left' : -popMargLeft
            });
            //Effet fade-in du fond opaque
            $('body').append('<div id="fade"></div>'); //Ajout du fond opaque noir
            //Apparition du fond - .css({'filter' : 'alpha(opacity=80)'}) pour corriger les bogues de IE
            $('#fade').css({'filter' : 'alpha(opacity=80)'}).fadeIn();
            //Fade in the Popup and add close button
            }
            /********** end of CSS effects *************/

            });
            </script>
            <script type='text/javascript'>

                $(function() {
                /*********** We get the form data ****************/ 
                $('#popup').submit(function(event) {
                    event.preventDefault(); // on stop le submit
                    var title = $('#title').val();
                    var start = $('#start').val();
                    var end = $('#end').val();
                    var where_event = $('#where_event').val();
                    var content_event = $('#content_event').val();

                    // because we want immediate reaction of FullCalendar, we render the created event on the FullCalendar, even if it's only temporarily
                    if (title) {
                        $('#calendar').fullCalendar('renderEvent',
                            {
                            title: title,
                            start: start,
                            end: end
                            },
                            true // make the event "stick"
                        );
                    // Now we push it to Google also :
                    add_event_gcal(title,start,end,where_event,content_event);  
                    }

                    // Wether we had the form fulfilled or not, we clean FullCalendar and close the popup   
                    $('#calendar').fullCalendar('unselect');
                    $('#fade , .popup_block').fadeOut(function() {
                        $('#fade, a.close').hide("normal");    
                    });
                });


                /****** NOW WE ASK THE EVENT TO BE PUSHED TO GOOGLE **************/
                function add_event_gcal(title,start,end,where_event,content_event) { 
                    // I will create the eventInsert script in a new page, and I name it here :
                    var url = "calendrier_add.php";
                    var data = {'titre_event' :title, 'start' : start, 'end' :end, 'where_event' : where_event, 'content_event' : content_event};

                    // I want to check in the page the result of what happened
                    $('#gcal_loader').load(url,data,function(responseTxt,statusTxt,xhr){
                            if(statusTxt=="error") alert("Error: "+xhr.status+": "+xhr.statusText);
                    });
                }   

                });
            </script>
            <script type="text/php">

                // variables can only be got with $_REQUEST ?
                $title_event = $_REQUEST['title_event'];
                $start = $_REQUEST['start'];
                $end = $_REQUEST['end'];
                $allday = $_REQUEST['allday'];
                $where_event = $_REQUEST['where_event'];
                $content_event = $_REQUEST['content_event'];

                /********************************************
                        GOOGLE API CONNECTION
                ********************************************/

                    /************************************************
                      Make an API request authenticated with a service account.
                     ************************************************/
                    require_once 'fullcalendar/google-api-php-client-master/src/Google/autoload.php'; // or wherever autoload.php is located

                    /************************************************
                      The name is the email address value provided  as part of the service account (not your  address!)
                      cf. : https://console.developers.google.com/project/<your account>
                     ************************************************/
                    $client_id = '12345467-123azer123aze123aze.apps.googleusercontent.com'; // YOUR Client ID
                    $service_account_name = '12345467-123azer123aze123aze@developer.gserviceaccount.com'; // Email Address in the console account

                    $key_file_location = 'fullcalendar/google-api-php-client-master/API_Project-35c93db58757.p12'; // key.p12 to create in the Google API console

                    if (strpos($client_id, "googleusercontent") == false || !strlen($service_account_name) || !strlen($key_file_location)) {
                        echo "no credentials were set.";
                        exit;
                    }

                    /** We create service access ***/
                    $client = new Google_Client();  

                    /************************************************
                    If we have an access token, we can carry on.  (Otherwise, we'll get one with the help of an  assertion credential.)
                    Here we have to list the scopes manually. We also supply  the service account
                     ************************************************/
                    if (isset($_SESSION['service_token'])) {
                            $client->setAccessToken($_SESSION['service_token']);
                    }
                    $key = file_get_contents($key_file_location);
                    $cred = new Google_Auth_AssertionCredentials(
                        $service_account_name,
                    array('https://www.googleapis.com/auth/calendar'), // ou calendar_readonly
                    $key
                );

                    $client->setAssertionCredentials($cred);
                    if ($client->getAuth()->isAccessTokenExpired()) {
                        $client->getAuth()->refreshTokenWithAssertion($cred);
                    }
                    $_SESSION['service_token'] = $client->getAccessToken();

                /********************************************
                        END OF GOOGLE API CONNECTION
                ********************************************/

                /*********** AT LAAAAST, WE PUSH THE EVENT IN GOOGLE CALENDAR ***************/
                // Get the API client and construct the service object.
                $service = new Google_Service_Calendar($client);

                // We get the calendar
                $calendarId = 'Google_login@gmail.com'; // or whatever calendar you like where you have editable rights


                    /************* INSERT ****************/
                $event = new Google_Service_Calendar_Event(array(
                    'summary' => $titre_event, 
                    'location' => $where_event,
                    'description' => $content_event,
                    'start' => array(
                        'dateTime' => $start, //'2015-06-08T15:00:00Z'
                        'timeZone' => 'Europe/Paris',
                    ),
                    'end' => array(
                        'dateTime' => $end,
                        'timeZone' => 'Europe/Paris',
                    ),
                    /* in case you need that :
                    'attendees' => array(
                        array('email' => 'lpage@example.com'),
                        array('email' => 'sbrin@example.com'),
                    ),*/
                    'reminders' => array(
                        'useDefault' => FALSE,
                        'overrides' => array(
                            array('method' => 'email', 'minutes' => 20)
                    ),
                        ),
                ));

                $event = $service->events->insert($calendarId, $event);
                printf('Event created: %s', $event->htmlLink);

                </script>
        <div id="popup" class="popup_block"></div>
        <div id='calendar'></div>
        
        <!— Trigger the modal with a button —>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

        <!— Modal —>
        <div id="myModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!— Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Modal Header</h4>
              </div>
              <div class="modal-body">
                <form>
                    Title: <INPUT TYPE="TEXT" ID="title" NAME="title" ><br/>
                    Place: <INPUT TYPE="TEXT" ID="where_event" NAME="where_event"><br/>
                    Content: <TEXTAREA ID="content_event"  NAME="content_event"></TEXTAREA><br/></div>
                    <INPUT type="submit" value="OK">
                    <INPUT TYPE="HIDDEN" ID="start" NAME="start" value="'+start+'">
                    <INPUT type="HIDDEN" ID="end" NAME="end" value="'+end+'">
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>

          </div>
        </div>
        
        <iframe src="https://calendar.google.com/calendar/embed?src=jngadiman.2014%40smu.edu.sg&ctz=Asia/Singapore" style="border: 0" width="800" height="600" frameborder="0" scrolling="no"></iframe>
        <iframe src="https://calendar.google.com/calendar/embed?src=jnnfrn%40gmail.com&ctz=Asia/Singapore" style="border: 0" width="800" height="600" frameborder="0" scrolling="no"></iframe>
    </body>
</html>
