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
    private int partTimers;
    private int fullTimers;
    private int industry;
    private Date startDate;
    private int currentStage;
    private byte[] companyLogo;
    private byte[] acraFile;
    private byte[] bizFile;
    
    
    //constructor for incubator registration
    public Company(int id, String name, String description, int partTimers, int fullTimers, int industry, Date startDate, int currentStage, byte[] companyLogo, byte[] acraFile, byte[] bizFile) {    
        this.id = id;
        this.name = name;
        this.description = description;
        this.partTimers = partTimers;
        this.fullTimers = fullTimers;
        this.industry = industry;
        this.startDate = startDate;
        this.currentStage = currentStage;
        this.companyLogo = companyLogo;
        this.acraFile = acraFile;
        this.bizFile = bizFile;
    }
    
    public Company(int id, String name, String description, int partTimers, int fullTimers, int industry, Date startDate, int currentStage) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.partTimers = partTimers;
        this.fullTimers = fullTimers;
        this.industry = industry;
        this.startDate = startDate;
        this.currentStage = currentStage;
        
    }

    public Company(int id, String name, String description, int partTimers, int fullTimers, int industry, Date startDate, int currentStage, byte[] companyLogo) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.partTimers = partTimers;
        this.fullTimers = fullTimers;
        this.industry = industry;
        this.startDate = startDate;
        this.currentStage = currentStage;
        this.companyLogo = companyLogo;
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

    public int getPartTimers() {
        return partTimers;
    }
    
    public int getFullTimers() {
        return partTimers;
    }

    public void setPartTimers(int partTimers) {
        this.partTimers = partTimers;
    }
    
    public void setFullTimers(int fullTimers) {
        this.fullTimers = fullTimers;
    }

    public int getIndustry() {
        return industry;
    }

    public void setIndustry(int industry) {
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

    public byte[] getCompanyLogo() {
        return companyLogo;
    }

    public void setCompanyLogo(byte[] companyLogo) {
        this.companyLogo = companyLogo;
    }
    
    public byte[] getAcraFile() {
        return acraFile;
    }

    public void setAcraFile(byte[] acraFile) {
        this.acraFile = acraFile;
    }
    
    public byte[] getBizFile() {
        return bizFile;
    }

    public void setBizFile(byte[] bizFile) {
        this.bizFile = bizFile;
    }
    
}
