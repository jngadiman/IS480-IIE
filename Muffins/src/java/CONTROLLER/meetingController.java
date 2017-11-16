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
                System.out.println("MEETING SIZE = "+meetings.size());
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
    
    //get meetings with no minutes
    public static ArrayList<Meeting> getMeetingsWithoutMinutes(String email){
        ArrayList<Meeting> meetings = new ArrayList<Meeting>();
        ArrayList<Integer> ids= MeetingDAO.getMeetingIDsOfAttendees(email);
        
        if (ids!=null){
            for(int id: ids){
                Meeting m = MeetingDAO.getMeeting(id);
                if(m.getStatus().equals("confirmed")){
                    meetings.add(m);
                }
                
            }
        }
        return meetings;
    }
    
     //get meetings by the type of meeting
//    public static ArrayList<Meeting> getMeetingsByType(String type){
//        ArrayList<Meeting> meetings = new ArrayList<Meeting>();
//        ArrayList<Integer> ids= MeetingDAO.getMeetingIDsByType(type);
//        if (ids!=null){
//            for(int id: ids){
//                meetings.add(MeetingDAO.getMeeting(id));
//            }
//        }
//        return meetings;
//    }
    
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
    
    public static int getLastID(){
        return MeetingDAO.getLastID();
    }
    
    public static int changeStatusOfMeeting(String status, int meetingID) {
        return MeetingDAO.changeStatusOfMeeting(status, meetingID);
    }
    
     public static void main(String[] args){
       // Meeting m = new Meeting(5, "meetingname", "Incubation", new Date(), new Date(), "example@gmail.com,people@gmail.com", "accepted", 3);
//        ArrayList<Integer> meetings = MeetingDAO.getMeetingOfCompanyByMonthNYear(9, 2017, 3);
        ArrayList<Meeting> meetings = meetingController.getMeetingsOfAttendees("mentor1@hotmail.com");
        for(Meeting id:meetings){
            System.out.println("MEETING ID = "+id.getMeetingName());
            
        }
     }
    
}
