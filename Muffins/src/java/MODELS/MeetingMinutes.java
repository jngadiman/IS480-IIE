/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

import java.util.ArrayList;

/**
 *
 * @author Hui Min
 */
public class MeetingMinutes {
    private int minutesID;
    private String title;
    private int meetingID;
    private String mentorEmail;
    private int taskID;
    private String comments;
    private String submittedUser;
    private int mentorRating;
    private String mentorRatingComment;

    public MeetingMinutes(int minutesID, String title, int meetingID, String mentorEmail, int taskID, String comments, String submittedUser, int mentorRating, String mentorRatingComment) {
        this.minutesID = minutesID;
        this.title = title;
        this.meetingID = meetingID;
        this.mentorEmail = mentorEmail;
        this.taskID = taskID;
        this.comments = comments;
        this.submittedUser = submittedUser;
        this.mentorRating = mentorRating;
        this.mentorRatingComment = mentorRatingComment;
    }

    public int getMinutesID() {
        return minutesID;
    }

    public void setMinutesID(int minutesID) {
        this.minutesID = minutesID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getMeetingID() {
        return meetingID;
    }

    public void setMeetingID(int meetingID) {
        this.meetingID = meetingID;
    }

    public String getMentorEmail() {
        return mentorEmail;
    }

    public void setMentorEmail(String mentorEmail) {
        this.mentorEmail = mentorEmail;
    }

    public int getTaskID() {
        return taskID;
    }

    public void setTaskID(int taskID) {
        this.taskID = taskID;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getSubmittedUser() {
        return submittedUser;
    }

    public void setSubmittedUser(String submittedUser) {
        this.submittedUser = submittedUser;
    }

    public int getMentorRating() {
        return mentorRating;
    }

    public void setMentorRating(int mentorRating) {
        this.mentorRating = mentorRating;
    }

    public String getMentorRatingComment() {
        return mentorRatingComment;
    }

    public void setMentorRatingComment(String mentorRatingComment) {
        this.mentorRatingComment = mentorRatingComment;
    }
    
    
}
