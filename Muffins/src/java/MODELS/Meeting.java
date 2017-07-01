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
    private String meetingName;
    private String meetingType;
    private String date;
    private Date startTime;
    private Date endTime;
    private User[] attendees;
    private MeetingMinutes mm;
    
    public Meeting(String meetingName, String meetingType, String date, Date startTime, Date endTime, MeetingMinutes mm) {
        this.meetingName = meetingName;
        this.meetingType = meetingType;
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
        this.mm = mm;
    }
    
    public Meeting(String meetingName, String meetingType, String date, Date startTime, Date endTime, Task[] tasksToBeDiscussed, User[] attendees, Task[] tasksToBeCompleted, MeetingMinutes mm) {
        this.meetingName = meetingName;
        this.meetingType = meetingType;
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
        this.attendees = attendees;
        this.mm = mm;
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
    
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
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

    public User[] getAttendees() {
        return attendees;
    }

    public void setAttendees(User[] attendees) {
        this.attendees = attendees;
    }

    public MeetingMinutes getMm() {
        return mm;
    }

    public void setMm(MeetingMinutes mm) {
        this.mm = mm;
    }
    
    /*public String addMeeting(Meeting m){
        
    }
    
    public String sendMeeting(Meeting m, User[] users){
        
    } */
}
