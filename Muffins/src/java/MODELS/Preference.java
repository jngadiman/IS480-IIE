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
public class Preference {
    private int companyID;
    private String mentorEmail;
    private Date startDate;
    private Date endDate;
    private String need;
    private Date dateSent;

    public Preference(int companyID, String mentorEmail, Date startDate, Date endDate, String need, Date dateSent) {
        this.companyID = companyID;
        this.mentorEmail = mentorEmail;
        this.startDate = startDate;
        this.endDate = endDate;
        this.need = need;
        this.dateSent = dateSent;
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

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getNeed() {
        return need;
    }

    public void setNeed(String need) {
        this.need = need;
    }

    public Date getDate_sent() {
        return dateSent;
    }

    public void setDate_sent(Date dateSent) {
        this.dateSent = dateSent;
    }

    
}
