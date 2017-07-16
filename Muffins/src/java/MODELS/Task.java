/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

import java.util.Date;

/**
 *
 * @author Hui Min
 */
public class Task {
    private int taskid;
    private String name;
    private String description;
    private Date deadline;
    private int stage;
    private int companyID;
    private boolean isCompleted;
    
    public Task(int taskid, String name, String description, Date deadline, boolean isCompleted) {
        this.taskid = taskid;
        this.name = name;
        this.description = description;
        this.deadline = deadline;
        this.isCompleted = isCompleted;
    }
    
    public Task(int taskid, String name, String description, Date deadline, int stage, int companyID, boolean isCompleted) {
        this.taskid = taskid;
        this.name = name;
        this.description = description;
        this.deadline = deadline;
        this.stage = stage;
        this.companyID = companyID;
        this.isCompleted = isCompleted;
    }
    
    public int getTaskId() {
        return taskid;
    }

    public void setTaskid(int taskid) {
        this.taskid = taskid;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }
    
    public int getStage() {
        return stage;
    }

    public void setStage(int stage) {
        this.stage = stage;
    }

    public int getCompanyID() {
        return companyID;
    }

    public void setCompanyID(int companyID) {
        this.companyID = companyID;
    }
    
    public boolean isIsCompleted() {
        return isCompleted;
    }

    public void setIsCompleted(boolean isCompleted) {
        this.isCompleted = isCompleted;
    }
}
