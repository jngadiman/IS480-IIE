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
public class Request {
    private int requestID;
    private String mentorEmail;
    private int companyID;
    private String type;
    private String adminEmail;
    private String status;

    public Request(int requestID, int companyID, String mentorEmail, String type) {
        this.requestID = requestID;
        this.companyID = companyID;
        this.mentorEmail = mentorEmail;
        this.type = type;
    }

    public Request(int requestID, int companyID, String mentorEmail, String type, String adminEmail) {
        this.requestID = requestID;
        this.companyID = companyID;
        this.mentorEmail = mentorEmail;
        this.type = type;
        this.adminEmail = adminEmail;
    }
    
    public Request(int requestID, int companyID, String mentorEmail, String type, String adminEmail, String status) {
        this.requestID = requestID;
        this.companyID = companyID;
        this.mentorEmail = mentorEmail;
        this.type = type;
        this.adminEmail = adminEmail;
        this.status = status;
    }

    public int getRequestID() {
        return requestID;
    }

    public void setRequestID(int requestID) {
        this.requestID = requestID;
    }
    
    public int getCompanyID() {
        return companyID;
    }

    public void setCompanyID(int companyID) {
        this.companyID = companyID;
    }

    public String getMentorEmail() {
        return mentorEmail;
    }

    public void setMentorEmail(String mentorEmail) {
        this.mentorEmail = mentorEmail;
    }
    
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
