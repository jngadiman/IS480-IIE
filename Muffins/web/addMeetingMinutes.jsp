<%-- 
    Document   : addMeetingMinutes
    Created on : Aug 4, 2017, 2:18:24 PM
    Author     : jiatung.lim
--%>

<%@page import="DAO.CompanyDAO"%>
<%@page import="java.util.Date"%>
<%@page import="CONTROLLER.companyController"%>
<%@page import="CONTROLLER.mentorController"%>
<%@page import="MODELS.Mentor"%>
<%@page import="DAO.MenteeDAO"%>
<%@page import="MODELS.Company"%>
<%@page import="MODELS.Task"%>
<%@page import="java.util.ArrayList"%>
<%@page import="CONTROLLER.taskController"%>
<%@page import="MODELS.Meeting"%>
<%@page import="CONTROLLER.meetingController"%>
<%@page import="MODELS.User"%>
<%@include file="protect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <script>
            var __slice = [].slice;

            (function ($, window) {
                var Starrr;

                Starrr = (function () {
                    Starrr.prototype.defaults = {
                        rating: void 0,
                        numStars: 5,
                        change: function (e, value) {
                        }
                    };

                    function Starrr($el, options) {
                        var i, _, _ref,
                                _this = this;

                        this.options = $.extend({}, this.defaults, options);
                        this.$el = $el;
                        _ref = this.defaults;
                        for (i in _ref) {
                            _ = _ref[i];
                            if (this.$el.data(i) != null) {
                                this.options[i] = this.$el.data(i);
                            }
                        }
                        this.createStars();
                        this.syncRating();
                        this.$el.on('mouseover.starrr', 'span', function (e) {
                            return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
                        });
                        this.$el.on('mouseout.starrr', function () {
                            return _this.syncRating();
                        });
                        this.$el.on('click.starrr', 'span', function (e) {
                            return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
                        });
                        this.$el.on('starrr:change', this.options.change);
                    }

                    Starrr.prototype.createStars = function () {
                        var _i, _ref, _results;

                        _results = [];
                        for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
                            _results.push(this.$el.append("<span class='glyphicon glyphicon-star-empty'></span>"));
                        }
                        return _results;
                    };

                    Starrr.prototype.setRating = function (rating) {
                        if (this.options.rating === rating) {
                            rating = void 0;
                        }
                        this.options.rating = rating;
                        this.syncRating();
                        return this.$el.trigger('starrr:change', rating);
                    };

                    Starrr.prototype.syncRating = function (rating) {
                        var i, _i, _j, _ref;

                        rating || (rating = this.options.rating);
                        if (rating) {
                            for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
                                this.$el.find('span').eq(i).removeClass('glyphicon-star-empty').addClass('glyphicon-star');
                            }
                        }
                        if (rating && rating < 5) {
                            for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
                                this.$el.find('span').eq(i).removeClass('glyphicon-star').addClass('glyphicon-star-empty');
                            }
                        }
                        if (!rating) {
                            return this.$el.find('span').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
                        }
                    };

                    return Starrr;

                })();
                return $.fn.extend({
                    starrr: function () {
                        var args, option;

                        option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
                        return this.each(function () {
                            var data;

                            data = $(this).data('star-rating');
                            if (!data) {
                                $(this).data('star-rating', (data = new Starrr($(this), option)));
                            }
                            if (typeof option === 'string') {
                                return data[option].apply(data, args);
                            }
                        });
                    }
                });
            })(window.jQuery, window);


            $(function () {
                return $(".starrr").starrr();
            });
            
            
$( document ).ready(function() {
      
  $('#hearts').on('starrr:change', function(e, value){
    $('#count').html(value);
    
  });
  ratingd  
  
 
});
        </script>

        <div class="container">
            <div class="col-sm-9 col-sm-offset-2">
                <h2 class="page-header col-lg-9  col-sm-offset-2">Add Meeting Minutes</h2>
                <div class="col-lg-9 well col-sm-offset-2">

                    <%                User currentUser = (User) session.getAttribute("user");
                        int meeting_id = 3;
                        Meeting currentMeeting = meetingController.getMeetingByMeetingID(meeting_id);
                        int menteeCompany = currentMeeting.getMenteeCompany();
                        Company comp = CompanyDAO.getCompany(menteeCompany);
                        int currentStageOfCompany = comp.getCurrentStage();


                    %>


                    <!-- meeting id to be retrieved from previous page
                      <input type ="hidden" name ="meeting_id">-->

                    <form method ="post" action ="addMeetingMinutesServlet">


                        <div class="row">
                            <!-- FOR NOW -->
                            <input type="hidden" value = "<%=meeting_id%>" name ="meeting_id">
                            <div class="col-sm-12 form-group">

                                <%String type = user.getUser_type(); %>
                                <% if (type.equals("regular_mentee") || type.equals("light_mentee")) {
                                        Mentee mentee = MenteeDAO.getMenteeByEmail(user.getEmail());
                                        String mentor_name = "";
                                        if (mentee.getMentor_email() != null && !mentee.getMentor_email().isEmpty()) {
                                            Mentor myMentor = mentorController.getMentor(mentee.getMentor_email());
                                            mentor_name = myMentor.getName();
                                %>
                                <div class="row">
                            <div class="col-sm-6 form-group">
                                 <b>Mentor Name: </b><%=mentor_name%>
                            </div>
                                
                               
                                    <%
                                            } else {
                                                out.println("");
                                            }
                                        } else {
                                            out.println("");
                                        }
                                    %>
                                
                                    <div class="col-lg-6 form-group">
                                        <strong>Mentee Name: </strong><%=currentUser.getName()%>
                            </div>
                                </div>
                                <%
                                    Date startTime = currentMeeting.getStartTime();
                                    Date endTime = currentMeeting.getEndTime();

                                %>
                                <p><strong>Meeting Start Time: </strong><%=currentMeeting.getStartTime()%></p>
                                <p><strong>Meeting End Time: </strong><%=currentMeeting.getEndTime()%></p>
                                <p><strong>Company Current Stage: </strong><%=currentStageOfCompany%></p>

                            </div>
                        </div>
                        <!--                                    to insert current stage for company
                        <input id="stage" name="stage" type="text" placeholder="Enter Company Name Here.." class="form-control">-->
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <label class="control-label">Title</label>
                                <input class="col-sm-6 form-control" type ="text" name ="title" placeholder="Enter Title"> <br/>
                            </div>
                            
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                               
                                <label class="control-label">Tasks Completed (Please tick beside the tasks)</label><br>

                                <%
                                    int uncompleteTask = 0;
                                    ArrayList<Task> tasks = taskController.displayTasksByStageAndCompany(currentStageOfCompany, menteeCompany);
                                    if (tasks==null ||tasks.size() == 0 ) {
                                        out.println("No task assigned!");
                                    } else {
                                        for (Task t : tasks) {
                                            if (!t.isIsCompleted()) {
                                %>
                                <p><%=t.getName()%> <input class type="checkbox" name="tasks_completed" value="<%=t.getTaskId()%>"></p>
                                    <%
                                    uncompleteTask++;
                                                }
                                            
                                            }
                                        if(uncompleteTask==0){
                                             out.println("No uncomplete task!");
                                        }
                                        }

                                    %>
                                
                            </div>
                                    <div class="col-sm-6 form-group">
                                <label class="control-label">Comment(s)</label>
                                <textarea class="form-control" rows="3" id="comment" name="notes" placeholder="Enter Comment"></textarea>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-6 form-group">
                            <label class="control-label">Mentor Rating</label>
                            <div id="hearts" class="starrr"></div>
                            You gave a rating of <span id="count">0</span> star(s)
                            </div>
                            <script>
                                function rating(){
                                    var select = document.getElementById("count"); 
                                    select.innerHTML = "";
                                    innerHTML += "<input type='hidden' value='"+select+"' name='mentor_rating'>";
                                }
                                
                                
                            </script>
                            
                        </div>

                        <!--                            <div class="row">
                                                        <div class="col-sm-6 form-group">
                                                            <label>Date</label>
                                                            <input id="date" name="date" type="text" placeholder="Enter Date" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6 form-group">
                                                            <label>Purpose</label>
                                                            <select class="form-control" id="industry" name="industry">
                                                                <option value="validateModel">Validate Business Model Canvas</option>
                                                                <option value="compAnalysis">Competitor Analysis</option>
                                                                <option value="marketSizing">Market Sizing</option>
                                                                <option value="defineTargetAudience">Define Target Audience</option>
                                                                <option value="ensureProductMarketFit">Ensure Product-market-fit(Value proposition for identified target audience)</option>
                                                                <option value="defineRevenueModel">Define Revenue model</option>
                                                                <option value="defineDistributionChannel">Define Distribution Channels</option>
                                                                <option value="others">Others</option>
                                                            </select>
                                                        </div>
                                                    </div>
                        
                                                    <div class="row">
                                                        <div class="col-sm-6 form-group">
                                                            <label>Comment</label>
                                                            <textarea class="form-control" rows="3" id="comment" name="notes" placeholder="Enter Comment"></textarea>
                                                        </div>
                                                    </div>
                        
                                                    <div class="row">
                                                        <div class="col-sm-6 form-group">
                                                            <label>Deliverables</label> *to be retrieve from database
                                                             <select class="form-control" id="deliverables" name="deliverables">
                                                                <option value="1">1</option>
                                                                <option value="2">2</option>
                                                            </select>
                                                            
                                                        </div>
                                                    </div>
                        
                                                    <div class="row">
                                                        <div class="col-sm-6 form-group">
                                                            <label>Dateline</label>
                                                            <input id="date" name="date" type="text" placeholder="Enter Dateline" class="form-control">
                                                        </div>
                                                    </div>-->


                        <input type="submit" class="btn btn-lg btn-info" value="Submit">					
                        </div>
                    </form> 
                </div>
            </div>
    </body>
</html>
<%@include file="browserCloseEvent.jsp" %>
