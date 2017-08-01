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
    private Meeting m;
    private Mentor mentor;
    private ArrayList<Task> tasksToComplete;
    private String comments;
    private User submittedUser;
    
    public MeetingMinutes(int minutesID, String title, Meeting m, Mentor mentor, ArrayList<Task> tasksToComplete, String comments, User submittedUser) {
        this.minutesID = minutesID;
        this.title = title;
        this.m = m;
        this.mentor = mentor;
        this.tasksToComplete = tasksToComplete;
        this.comments = comments;
        this.submittedUser = submittedUser;
    }
    
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    public int getMinutesID() {
        return minutesID;
    }

    public void setMinutesID(int minutesID) {
        this.minutesID = minutesID;
    }

    public Meeting getM() {
        return m;
    }

    public void setM(Meeting m) {
        this.m = m;
    }

    public Mentor getMentor() {
        return mentor;
    }

    public void setMentor(Mentor mentor) {
        this.mentor = mentor;
    }


    public ArrayList<Task> getTasksToComplete() {
        return tasksToComplete;
    }

    public void setTasksToComplete(ArrayList<Task> tasksToComplete) {
        this.tasksToComplete = tasksToComplete;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public User getSubmittedUser() {
        return submittedUser;
    }

    public void setSubmittedUser(User submittedUser) {
        this.submittedUser = submittedUser;
    }

}
