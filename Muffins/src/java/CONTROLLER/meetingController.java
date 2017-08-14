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

    public static ArrayList<MeetingMinutes> viewMeetingMinutesOfMentor(String mentor_email) {
        ArrayList<MeetingMinutes> minutes = new ArrayList<MeetingMinutes>();
        ArrayList<Integer> taskids = new ArrayList<Integer>();
        TaskDAO taskDAO = new TaskDAO();
        CompanyDAO companyDAO = new CompanyDAO();
        MeetingDAO meetingDAO = new MeetingDAO();
        MentorDAO mentorDAO = new MentorDAO();
        ArrayList<Task> completedTasks = new ArrayList<Task>();
        String title = "";
        String comment = "";
        Company company = null;

        MeetingMinutesDAO minutesDAO = new MeetingMinutesDAO();
        ArrayList<Integer> minutesIDs = minutesDAO.getMeetingMinutesIDsOfMentor(mentor_email);

        for (int id : minutesIDs) {
            taskids = minutesDAO.getCompletedTasksByMeetingMinutes(id);
            for (int taskid : taskids) {
                completedTasks.add(taskDAO.getTask(taskid));
            }
            ArrayList<String> details = minutesDAO.getMeetingMinutesDetails(id, taskids.get(0));
            title = details.get(0);
            int meetingID = Integer.parseInt(details.get(1));

            Meeting meeting = meetingDAO.getMeeting(meetingID);
            comment = details.get(2);
            String submitted_user = details.get(3);
            User user = UserDAO.getUserByEmail(submitted_user);
            Mentor mentor = mentorDAO.getMentorByEmail(mentor_email);
            minutes.add(new MeetingMinutes(id, title, meeting, mentor, completedTasks, comment, user));
        }

        return minutes;
    }

    public static ArrayList<MeetingMinutes> viewMeetingMinutesOfCompany(int companyID) {
        ArrayList<MeetingMinutes> minutes = new ArrayList<MeetingMinutes>();
        ArrayList<Integer> taskids = new ArrayList<Integer>();
        TaskDAO taskDAO = new TaskDAO();
        CompanyDAO companyDAO = new CompanyDAO();
        MeetingDAO meetingDAO = new MeetingDAO();
        MentorDAO mentorDAO = new MentorDAO();
        ArrayList<Task> completedTasks = new ArrayList<Task>();
        String title = "";
        String comment = "";
        Company company = null;

        ArrayList<Integer> meetingIDs = MeetingDAO.getMeetingIDsOfCompany(companyID);
        for (int meetingID : meetingIDs) {
            ArrayList<Integer> minutesIDs = MeetingMinutesDAO.getMeetingMinutesIDsOfCompany(meetingID);

            for (int id : minutesIDs) {
                taskids = MeetingMinutesDAO.getCompletedTasksByMeetingMinutes(id);
                for (int taskid : taskids) {
                    completedTasks.add(taskDAO.getTask(taskid));
                }
                ArrayList<String> details = MeetingMinutesDAO.getMeetingMinutesDetails(id, taskids.get(0));
                title = details.get(0);
                Meeting meeting = meetingDAO.getMeeting(meetingID);
                comment = details.get(2);
                String submitted_user = details.get(3);
                User user = UserDAO.getUserByEmail(submitted_user);
                String mentor = details.get(4);
                
                minutes.add(new MeetingMinutes(id, title, meeting, MentorDAO.getMentorByEmail(mentor), completedTasks, comment, user));
            }

        }

        return minutes;
    }

    public static int setMeetingMinutes(String title, int meetingID, String mentor, ArrayList<Integer> completedTasks, String comment, String submitted_user) {

        MeetingDAO meetingDAO = new MeetingDAO();
        TaskDAO taskDAO = new TaskDAO();
        CompanyDAO companyDAO = new CompanyDAO();
        Meeting meeting = meetingDAO.getMeeting(meetingID);
        System.out.println("MEETING IN CONTEROLLER" + meeting.getMeetingName());
        UserDAO userDAO = new UserDAO();
        Mentor m = MentorDAO.getMentorByEmail(mentor);
        if (m != null) {
            System.out.println("MENTOR IN CONTEROLLER" + m.getEmail());
        } else {
            System.out.println("NO MENTOR IN CONTEROLLER YET");
        }
        ArrayList<Task> taskIDs = new ArrayList<Task>();

        int minutesID = MeetingMinutesDAO.getLastID();

        for (int each : completedTasks) {
            taskIDs.add(taskDAO.getTask(each));
        }
        //Company company = companyDAO.getCompany(companyID);
        User user = UserDAO.getUserByEmail(submitted_user);
        MeetingMinutes minutes = new MeetingMinutes(minutesID, title, meeting, m, taskIDs, comment, user);
        int status = MeetingMinutesDAO.addMeetingMinutes(minutes);
        return status;
    }
    
    public static int editMeetingMinutes(int minutesID, String title, int meetingID, String mentor, ArrayList<Integer> completedTasks, String comment, String submitted_user) {
        
        int status = 0;
        boolean deleted = MeetingMinutesDAO.deleteMeetingMinutesByID(minutesID);
        
        if (deleted){
            status = meetingController.setMeetingMinutes(title, meetingID, mentor, completedTasks, comment, submitted_user);
        }
        return status;
    }
    
    public static Meeting getMeetingByMeetingID(int meeting_id){
        return MeetingDAO.getMeeting(meeting_id);
    }
}
