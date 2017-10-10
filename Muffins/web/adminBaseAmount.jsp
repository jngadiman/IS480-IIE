<%-- 
    Document   : adminBaseAmount
    Created on : Oct 10, 2017, 8:23:28 PM
    Author     : Jennefer Ngadiman
--%>


<%@include file="protect.jsp" %>
<%@include file="sidenav.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Base Amount</title>
        <script>
            function validateForm() {
                var baseAmt = document.forms["changeBase"]["baseAmt"].value;
                if (!baseAmt.match(/^[0-9].+$/)) {
                    alert('Please enter amount in numbers!');
                    return false;
                }
            }
            </script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-sm-offset-3">
                    <h2 class="page-header col-lg-7  col-sm-offset-3">Payment Base Amount</h2>
                    <div class="col-lg-7 well col-sm-offset-3">
                        <div class ="row">
                            <form action ="adminBaseAmountServlet" method ="post"  name="changeBase" onsubmit="return validateForm()">
                                <div class="col-sm-8 form-group">
                                <label class="control-label">Set Base Amount</label>
                                $ <input type ="text" class="form-control" name="baseAmt" required>
                            </div>
                            <br>
                                <button class="btn btn-md btn-primary" type="submit">Submit</button>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
