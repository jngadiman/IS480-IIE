/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.MeetingDAO;
import DAO.MeetingMinutesDAO;
import DAO.TaskDAO;
import DAO.UserDAO;
import MODELS.Company;
import MODELS.Meeting;
import MODELS.MeetingMinutes;
import MODELS.User;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Hui Min
 */
public class minutesController {
    //get all the sets of MeetingMinutes of a given Mentor
    public static ArrayList<ArrayList<MeetingMinutes>> getMeetingMinutesOfMentor(String mentor_email) {
        ArrayList<ArrayList<MeetingMinutes>> minutes = new ArrayList<ArrayList<MeetingMinutes>>();
        ArrayList<Integer> meetingMinutesIDs = MeetingMinutesDAO.getMeetingMinutesIDsOfMentor(mentor_email);

        ArrayList<MeetingMinutes> meetingMinutes = new ArrayList<MeetingMinutes>();
        for (Integer id : meetingMinutesIDs) {
            meetingMinutes = MeetingMinutesDAO.getMeetingMinutes(id);
            minutes.add(meetingMinutes);
        }

        return minutes;
    }

    //get the sets of MeetingMinutes of a given company ID
    public static ArrayList<ArrayList<MeetingMinutes>> getMeetingMinutesOfCompany(int companyID) {
        ArrayList<ArrayList<MeetingMinutes>> minutes = new ArrayList<ArrayList<MeetingMinutes>>();
        ArrayList<Integer> meetingIDs = MeetingDAO.getMeetingIDsOfCompany(companyID);
        
        ArrayList<MeetingMinutes> meetingMinutes = new ArrayList<MeetingMinutes>();
        for(Integer i: meetingIDs){
            meetingMinutes = MeetingMinutesDAO.getMeetingMinutes(i);
            minutes.add(meetingMinutes);
        }

        return minutes;
    }

    public static ArrayList<ArrayList<MeetingMinutes>> getMeetingMinutesOfMentorNCompany(String mentor_email, int company_id){
        ArrayList<ArrayList<MeetingMinutes>> meetingMinutes = minutesController.getMeetingMinutesOfMentor(mentor_email);
        
        for(int i = 0; i < meetingMinutes.size(); i++){
            ArrayList<MeetingMinutes> mm = meetingMinutes.get(i);
            MeetingMinutes m = mm.get(0);
            String email = m.getSubmitted_user();
            User user = UserDAO.getUserByEmail(email);
            int companyID = user.getCompanyid();
            if(companyID != company_id){
                meetingMinutes.remove(mm);
                i++;
            }
        }
        
        return meetingMinutes;
    }
    
    //adds in a whole set of MeetingMinutes into the DB
    public static int setMeetingMinutes(ArrayList<MeetingMinutes> meetingMinutes) {
        int status = 0;
        for(MeetingMinutes mm: meetingMinutes){
            status = MeetingMinutesDAO.addMeetingMinutesRow(mm);
        }
        
        return status;
    }
    
    //deletes the MeetingMinutes row from the db and add in a new MeetingMinutes row into db
    public static int editMeetingMinutes(MeetingMinutes mm) {
        
        int status = 0;
        boolean deleted = MeetingMinutesDAO.deleteMeetingMinutesByRow(mm.getMinutesID(), mm.getTask_id());
        
        if (deleted){
            status = MeetingMinutesDAO.addMeetingMinutesRow(mm);
        }
        return status;
    }
    
    //update the deadline of the task given the Task ID and the new deadline in the Task table
    public static String updateDeadline(int taskID, Date deadline){
        int result = TaskDAO.updateDeadlineForTask(taskID, deadline);
        String status = "";
        
        if(result == 1){
            status = "Deadline is updated!";
        }else{
            status = "Deadline is not updated!";
        }
        
        return status;
    }
    
    public static ArrayList<ArrayList<MeetingMinutes>> getAllMeetingMinutes(){
        ArrayList<ArrayList<MeetingMinutes>> meetingMinutes = new ArrayList<ArrayList<MeetingMinutes>>();
        int id = minutesController.getNextId();
        for(int i = 1; i <= id; i++){
            ArrayList<MeetingMinutes> mm = MeetingMinutesDAO.getMeetingMinutes(i);
            meetingMinutes.add(mm);
        }
        
        return meetingMinutes;
    }
    
    public static int getNextId(){
        int id = MeetingMinutesDAO.getLastID();
        return id;
    }
    
    public static ArrayList<MeetingMinutes> getMeetingMinutesByMonthNYear(int month, int year, int company, String mentor_email){
        ArrayList<MeetingMinutes> mm = new ArrayList<MeetingMinutes>();
        ArrayList<Integer> meetings = MeetingDAO.getMeetingOfCompanyByMonthNYear(month, year, company);
        for(int m: meetings){
            ArrayList<MeetingMinutes> temp = MeetingMinutesDAO.getMeetingMinutesOfMentorByMeetingIDs(m, mentor_email);
            for(MeetingMinutes mins: temp){
                mm.add(mins);
            }
        }
        return mm;
    }
    
    public static int getNumMeetingMinutesPerMentorNCompany(String mentor_email, int company_id){
        int numMM = 0;
        
        ArrayList<Integer> meetingMinutesIDs = MeetingMinutesDAO.getMeetingMinutesIDsOfMentor(mentor_email);
        ArrayList<Integer> meetingIDs = new ArrayList<Integer>();
        
        for(Integer i: meetingMinutesIDs){
            Meeting m = meetingController.getMeetingByMeetingID(i);
            Company c = m.getMenteeCompany();
            if(c.getId() == company_id){
                numMM++;
            }
        }
        return numMM;
    }
    
    public static void main(String[] args){
        ArrayList<ArrayList<MeetingMinutes>> meetingMinutes = minutesController.getAllMeetingMinutes();
        for(ArrayList<MeetingMinutes> mm : meetingMinutes){
            for(MeetingMinutes m : mm){
                System.out.println(m.getMinutesID());
                System.out.println(m.getTitle());
                System.out.println(m.getMeeting_id());
                System.out.println(m.getMentor_email());
                System.out.println(m.getTask_id());
                System.out.println(m.getComments());
                System.out.println(m.getSubmitted_user());
            }
        }
    }
}
