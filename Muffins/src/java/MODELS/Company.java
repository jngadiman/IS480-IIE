/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

import java.util.*;

/**
 *
 * @author JJAY
 */
public class Company {
    
    private int id;
    private String name;
    private String description;
    private String vision;
    private String mission;
    private String industry;
    private Date startDate;
    private int currentStage;

    public Company(int id, String name, String description, String vision, String mission, String industry, Date startDate) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.vision = vision;
        this.mission = mission;
        this.industry = industry;
        this.startDate = startDate;
    }

    public Company(int id, String name, String description, String vision, String mission, String industry, Date startDate, int currentStage) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.vision = vision;
        this.mission = mission;
        this.industry = industry;
        this.startDate = startDate;
        this.currentStage = currentStage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getVision() {
        return vision;
    }

    public void setVision(String vision) {
        this.vision = vision;
    }

    public String getMission() {
        return mission;
    }

    public void setMission(String mission) {
        this.mission = mission;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public int getCurrentStage() {
        return currentStage;
    }

    public void setCurrentStage(int currentStage) {
        this.currentStage = currentStage;
    }
    
}
