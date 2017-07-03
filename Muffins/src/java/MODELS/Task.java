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
    private String name;
    private Date deadline;
    private String description;
    private boolean isCompleted;
    private int stage;
    
    public Task(String name, Date deadline, String description, boolean isCompleted) {
        this.name = name;
        this.deadline = deadline;
        this.description = description;
        this.isCompleted = isCompleted;
    }
    
    public Task(String name, Date deadline, String description, boolean isCompleted, int stage) {
        this.name = name;
        this.deadline = deadline;
        this.description = description;
        this.isCompleted = isCompleted;
        this.stage = stage;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isIsCompleted() {
        return isCompleted;
    }

    public void setIsCompleted(boolean isCompleted) {
        this.isCompleted = isCompleted;
    }

    public int getStage() {
        return stage;
    }

    public void setStage(int stage) {
        this.stage = stage;
    }
    
}
