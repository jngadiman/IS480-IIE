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
import java.util.TreeMap;

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
    public static int editMeetingMinutes(ArrayList<MeetingMinutes> mm) {
        
        int status = 0;
        if(mm!=null&&mm.size()!=0){
            int minutesID = mm.get(0).getMinutesID();
            int meetingID = mm.get(0).getMeeting_id();
            Meeting meeting = meetingController.getMeetingByMeetingID(meetingID);
            System.out.println("MINUTES CONTROLLER ------ meeting "+meeting.getMeetingName());
            int menteeCompany = meeting.getMenteeCompany();
            
            ArrayList<Integer> taskIDs = MeetingMinutesDAO.getTaskIDsOfMM(minutesID);
            System.out.println("MINUTES CONTROLLER ------ task loop size "+taskIDs.size());
            if(taskIDs!=null && taskIDs.size()!= 0 ){
                for(int id:taskIDs){
                   TaskDAO.unCompleteTask(id, menteeCompany);
                   System.out.println("MINUTES CONTROLER TASK THAT WE UNCOMPLETE ----- "+id);
                }
                
            }else{
                System.out.println("MINUTES CONTROLER NO TASK TO UNCOMPLETE ----- ");
            }
            boolean deleted = MeetingMinutesDAO.deleteMeetingMinutes(minutesID);
            System.out.println("MINUTES CONTROLER DELETED STATUS ----- "+deleted);
            for(MeetingMinutes m: mm){
                int taskEdited = m.getTask_id();
                //if (deleted){
                    status = MeetingMinutesDAO.addMeetingMinutesRow(m);
                    taskController.completeTask(taskEdited, menteeCompany);
                    System.out.println("MINUTES CONTROLER TASK THAT WE COMPLETE ----- "+taskEdited);
                //} 
            }
            
        }
        
        return status;
    }
    
    //update the deadline of the task given the Task ID and the new deadline in the Task table
    public static String updateDeadline(int taskID, Date deadline, int company){
        int result = TaskDAO.updateDeadlineForTask(taskID, company, deadline);
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
    
    public static ArrayList<MeetingMinutes> getMeetingMinutesByPeriod(Date start, Date end, int company, String mentor_email){
        ArrayList<MeetingMinutes> mm = new ArrayList<MeetingMinutes>();
        //ArrayList<Integer> meetings = MeetingDAO.getMeetingOfCompanyByMonthNYear(month, year, company);
        ArrayList<Integer> meetings = MeetingDAO.getMeetingOfCompanyByPeriod(start, end, company);
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
            
            int c = m.getMenteeCompany();
            if(c == company_id){
                numMM++;
            }
        }
        return numMM;
    }
    public TreeMap<Integer, ArrayList<String>> sortMentorsByMentorRatingCount(ArrayList<String> mentors){
        TreeMap<Integer, ArrayList<String>> treemap = new TreeMap<>();
        for(String m: mentors){
            
            int rating = MeetingMinutesDAO.getAverageMentorRatingCount(m);
            if (treemap.get(rating)==null){
                treemap.put(rating, new ArrayList<String>());
                
            }else{
                treemap.get(rating).add(m);
            }
            
        }
        return treemap;
    }
    
    //select distinct meeting minutes of mentor, sort by rating
    public int getAverageMentorRatingCount(String email){
        int count = MeetingMinutesDAO.getAverageMentorRatingCount(email);
        return count;
    }
    
    public static ArrayList<MeetingMinutes> getMeetingMinutesByMeeting(int meetingID){
        return MeetingMinutesDAO.getMeetingMinutesByMeeting(meetingID);
    }
    
    public static void main(String[] args){
        //ArrayList<ArrayList<MeetingMinutes>> meetingMinutes = minutesController.getAllMeetingMinutes();
       ArrayList<MeetingMinutes> meetingMinutes = minutesController.getMeetingMinutesByMeeting(2);
        
        //for(ArrayList<MeetingMinutes> mm : meetingMinutes){
            for(MeetingMinutes m : meetingMinutes){
                System.out.println(m.getMinutesID());
                System.out.println(m.getTitle());
                System.out.println(m.getMeeting_id());
                System.out.println(m.getMentor_email());
                System.out.println(m.getTask_id());
                System.out.println(m.getComments());
                System.out.println(m.getSubmitted_user());
            }
        //}
    }
}
