/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

/**
 *
 * @author Hui Min
 */
public class MeetingMinutes {
    private String title;
    private Meeting m;
    private Mentor mentor;
    private Task[] tasksToBeDiscussed;
    private Task[] tasksToComplete;
    private String comments;
    private User submittedUser;
    
    public MeetingMinutes(String title, Meeting m, Mentor mentor, Task[] tasksToBeDiscussed, Task[] tasksToComplete, String comments, User submittedUser) {
        this.title = title;
        this.m = m;
        this.mentor = mentor;
        this.tasksToBeDiscussed = tasksToBeDiscussed;
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

    public Task[] getTasksToBeDiscussed() {
        return tasksToBeDiscussed;
    }

    public void setTasksToBeDiscussed(Task[] tasksToBeDiscussed) {
        this.tasksToBeDiscussed = tasksToBeDiscussed;
    }

    public Task[] getTasksToComplete() {
        return tasksToComplete;
    }

    public void setTasksToComplete(Task[] tasksToComplete) {
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