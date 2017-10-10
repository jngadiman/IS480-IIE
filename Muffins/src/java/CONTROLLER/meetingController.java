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
    //get the Meeting object given the Meeting ID
    public static Meeting getMeetingByMeetingID(int meeting_id){
        return MeetingDAO.getMeeting(meeting_id);
    }
    
    //add Meeting into the Meeting table
    public static String addMeeting(Meeting m){
        return MeetingDAO.addMeeting(m);
    }
    
    //get meetings of the company
    public static ArrayList<Meeting> getMeetingsOfCompany(int companyID){
        ArrayList<Meeting> meetings = new ArrayList<Meeting>();
        ArrayList<Integer> ids= MeetingDAO.getMeetingIDsOfCompany(companyID);
        if (ids!=null){
            for(int id: ids){
                meetings.add(MeetingDAO.getMeeting(id));
            }
        }
        return meetings;
    }
    
    //get meetings by the attendees
    public static ArrayList<Meeting> getMeetingsOfAttendees(String email){
        ArrayList<Meeting> meetings = new ArrayList<Meeting>();
        ArrayList<Integer> ids= MeetingDAO.getMeetingIDsOfAttendees(email);
        if (ids!=null){
            for(int id: ids){
                meetings.add(MeetingDAO.getMeeting(id));
            }
        }
        return meetings;
    }
    
    //get meetings by the status
    public static ArrayList<Meeting> getMeetingsByStatus(String status){
        ArrayList<Meeting> meetings = new ArrayList<Meeting>();
        ArrayList<Integer> ids= MeetingDAO.getMeetingIDsByStatus(status);
        if (ids!=null){
            for(int id: ids){
                meetings.add(MeetingDAO.getMeeting(id));
            }
        }
        return meetings;
    }
    
     //get meetings by the type of meeting
    public static ArrayList<Meeting> getMeetingsByType(String type){
        ArrayList<Meeting> meetings = new ArrayList<Meeting>();
        ArrayList<Integer> ids= MeetingDAO.getMeetingIDsByType(type);
        if (ids!=null){
            for(int id: ids){
                meetings.add(MeetingDAO.getMeeting(id));
            }
        }
        return meetings;
    }
    
     //get meetings by month and year
    //public static ArrayList<Meeting> getMeetingsByMonthNYearNCompany(int month, int year, int company){
    public static ArrayList<Meeting> getMeetingsByMonthNYearNCompany(int month, int year, int company){
        ArrayList<Meeting> meetings = new ArrayList<Meeting>();
        ArrayList<Integer> ids= MeetingDAO.getMeetingOfCompanyByMonthNYear(month, year, company);
        if (ids!=null){
            for(int id: ids){
                meetings.add(MeetingDAO.getMeeting(id));
            }
        }
        return meetings;
    }
    
    
}
