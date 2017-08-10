/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

import java.util.*;

/**
 *
 * @author Hui Min
 */
public class Meeting {
    private int meetingID;
    private String meetingName;
    private String meetingType;
    private Date startTime;
    private Date endTime;
    private String [] attendees;
    private boolean status;
    private Company menteeCompany;
    
    
//    public Meeting(int meetingID, String meetingName, String meetingType, String date, Date startTime, Date endTime) {
//        this.meetingID = meetingID;
//        this.meetingName = meetingName;
//        this.meetingType = meetingType;
//        this.date = date;
//        this.startTime = startTime;
//        this.endTime = endTime;
//        
//    }
    
    public Meeting(int meetingID, String meetingName, String meetingType, Date startTime, Date endTime, String [] attendees, boolean status, Company menteeCompany) {
        this.meetingID = meetingID;
        this.meetingName = meetingName;
        this.meetingType = meetingType;
        this.startTime = startTime;
        this.endTime = endTime;
        this.attendees = attendees;
        this.status = status;
        this.menteeCompany = menteeCompany;
    }
    
    public int getMeetingID() {
        return meetingID;
    }
    
    public void setMeetingID(int meetingID) {
        this.meetingID = meetingID;
    }
    
    public String getMeetingName() {
        return meetingName;
    }

    public void setMeetingName(String meetingName) {
        this.meetingName = meetingName;
    }

    public String getMeetingType() {
        return meetingType;
    }

    public void setMeetingType(String meetingType) {
        this.meetingType = meetingType;
    }
    
    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String [] getAttendees() {
        return attendees;
    }

    public void setAttendees(String [] attendees) {
        this.attendees = attendees;
    }
    
    public boolean getStatus(){
        return status;
    }
    
    public void setStatus(boolean status){
        this.status = status;
    }
    
    public Company getMenteeCompany(){
        return menteeCompany;
    }
    
    public void setMenteeCompany(Company menteeCompany){
        this.menteeCompany = menteeCompany;
    }

    
    /*public String addMeeting(Meeting m){
        
    }
    
    public String sendMeeting(Meeting m, User[] users){
        
    } */
}
