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
    private int meeting_id;
    private String mentor_email;
    private int task_id;
    private String comments;
    private String submitted_user;

    public MeetingMinutes(int minutesID, String title, int meeting_id, String mentor_email, int task_id, String comments, String submitted_user) {
        this.minutesID = minutesID;
        this.title = title;
        this.meeting_id = meeting_id;
        this.mentor_email = mentor_email;
        this.task_id = task_id;
        this.comments = comments;
        this.submitted_user = submitted_user;
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

    public int getMeeting_id() {
        return meeting_id;
    }

    public void setMeeting_id(int meeting_id) {
        this.meeting_id = meeting_id;
    }

    public String getMentor_email() {
        return mentor_email;
    }

    public void setMentor_email(String mentor_email) {
        this.mentor_email = mentor_email;
    }

    public int getTask_id() {
        return task_id;
    }

    public void setTask_id(int task_id) {
        this.task_id = task_id;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getSubmitted_user() {
        return submitted_user;
    }

    public void setSubmitted_user(String submitted_user) {
        this.submitted_user = submitted_user;
    }
}
