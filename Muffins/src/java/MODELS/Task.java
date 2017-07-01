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
public class Task {
    private String name;
    private String dateline;
    private String description;
    private boolean isCompleted;
    private int stage;
    
    public Task(String name, String dateline, String description, boolean isCompleted) {
        this.name = name;
        this.dateline = dateline;
        this.description = description;
        this.isCompleted = isCompleted;
    }
    
    public Task(String name, String dateline, String description, boolean isCompleted, int stage) {
        this.name = name;
        this.dateline = dateline;
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

    public String getDateline() {
        return dateline;
    }

    public void setDateline(String dateline) {
        this.dateline = dateline;
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
