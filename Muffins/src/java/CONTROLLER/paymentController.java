/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.MeetingMinutesDAO;
import MODELS.Company;
import MODELS.Meeting;
import java.util.ArrayList;

/**
 *
 * @author Hui Min
 */
public class paymentController {
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
        int numMM = paymentController.getNumMeetingMinutesPerMentorNCompany("mentor3@hotmail.com", 3);
        System.out.println(numMM);
    }
}
