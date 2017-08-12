<%-- 
    Document   : RequestForMentor
    Created on : Aug 1, 2017, 11:50:25 AM
    Author     : Xinyao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor List</title>
        <%@include file="navbar.jsp" %>
        <link href="css/stages.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/npm.js" type="text/javascript"></script>
        <link href="css/bootstrap-datepicker.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <link href="css/requestForMentor.css" rel="stylesheet" type="text/css"/>
        <script src="js/requestForMentor.js" type="text/javascript"></script>
    </head>
    <body>
        
 
                   <div class="col-sm-4" style ="width: 300px;height:300px; border:1px solid black">
                   Mentor number 1
                   <br>
                   Mentor profile photo
                   <script type="text/javascript">
                    // Popup window code
                    function newPopup(url) {
                            popupWindow = window.open(
                                    url,'popUpWindow','height=300,width=200,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
                    }
                    </script>
                    <p><a href="requestForMentorCompanyProfile.jsp" class="btn btn-success btn-outline-rounded green">Read more</a></p>
                    </div>
                   
                   <div class="col-sm-4" style ="width: 300px;height:300px; border:1px solid black">
                   mentor number 2
                   <br>
                   Mentor profile photo
                   <script type="text/javascript">
                    // Popup window code
                    function newPopup(url) {
                            popupWindow = window.open(
                                    url,'popUpWindow','height=300,width=200,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
                    }
                    </script>
                    <p><a href="requestForMentorCompanyProfile.jsp" class="btn btn-success btn-outline-rounded green">Read more</a></p>
                   </div>
                   <div class="col-sm-4" style ="width: 300px;height:300px; border:1px solid black">
                   Mentor number 3
                   <br>
                   Mentor profile photo
                   <script type="text/javascript">
                    // Popup window code
                    function newPopup(url) {
                            popupWindow = window.open(
                                    url,'popUpWindow','height=300,width=200,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
                    }
                    </script>
                    <p><a href="requestForMentorCompanyProfile.jsp" class="btn btn-success btn-outline-rounded green">Read more</a></p>
                   </div>
                   
                    <!-- Trigger/Open The Modal -->
                     <button id="myBtn">Open Modal</button>

                     <!-- The Modal -->
                     <div id="myModal" class="modal">

                       <!-- Modal content -->
                       <div class="modal-content">
                         <span class="close">&times;</span>
                         <p>Some text in the Modal..</p>
                       </div>

                     </div>
    </body>
</html>
