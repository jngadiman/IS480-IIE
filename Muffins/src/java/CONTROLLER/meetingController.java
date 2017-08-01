/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.*;
import MODELS.*;
import java.util.ArrayList;

/**
 *
 * @author jiatung.lim
 */
public class meetingController {
     public static ArrayList<MeetingMinutes> viewAllMeetingMinutes(Mentor mentor){
        ArrayList<MeetingMinutes> minutes = new ArrayList<MeetingMinutes>();
        ArrayList<Integer> taskids = new ArrayList<Integer>();
        TaskDAO taskDAO = new TaskDAO(); 
        UserDAO userDAO = new UserDAO();
        MeetingDAO meetingDAO = new MeetingDAO();
        ArrayList<Task> completedTasks = new ArrayList<Task>();
        String title = "";
        String comment = "";
        User submittedUser = null;
        
        
        MeetingMinutesDAO minutesDAO = new MeetingMinutesDAO();
        ArrayList<Integer> minutesIDs = minutesDAO.getMeetingMinutesIDsOfMentor(mentor);
        
        for(int id: minutesIDs){
            taskids = minutesDAO.getCompletedTasksByMeetingMinutes(id);
            for(int taskid: taskids){
               completedTasks.add(taskDAO.getTask(taskid));
            }
            ArrayList<String> details = minutesDAO.getMeetingMinutesDetails(id);
            title = details.get(0);
            int meetingID = Integer.parseInt(details.get(1));
            Meeting meeting = meetingDAO.getMeeting(meetingID);
            comment = details.get(2);
            String userEmail = details.get(3);
            submittedUser = userDAO.getUserByEmail(userEmail);
            minutes.add(new MeetingMinutes(id, title, meeting, mentor, completedTasks, comment, submittedUser));
        }
        
        return minutes;
     }
     
     public static int setMeetingMinutes(int minutesID, String title, int meetingID, String mentor, ArrayList<Task> completedTasks, String comment, User submittedUser){
        
        MeetingDAO meetingDAO = new MeetingDAO();
        Meeting meeting = meetingDAO.getMeeting(meetingID);
        UserDAO userDAO = new UserDAO();
        Mentor m = (Mentor)userDAO.getUserByEmail(mentor);
        MeetingMinutes minutes = new MeetingMinutes(minutesID, title, meeting, m, completedTasks, comment, submittedUser);
        
        MeetingMinutesDAO minutesDAO = new MeetingMinutesDAO();
        int status = minutesDAO.addMeetingMinutes(minutes);
        return status;
     }
}
