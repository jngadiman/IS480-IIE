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
    private int company_id;
    private String mentor_email;
    private Date start_date;
    private Date end_date;
    private String need;
    private Date date_sent;

    public Preference(int company_id, String mentor_email, Date start_date, Date end_date, String need, Date date_sent) {
        this.company_id = company_id;
        this.mentor_email = mentor_email;
        this.start_date = start_date;
        this.end_date = end_date;
        this.need = need;
        this.date_sent = date_sent;
    }

    public int getCompany_id() {
        return company_id;
    }

    public void setCompany_id(int company_id) {
        this.company_id = company_id;
    }

    public String getMentor_email() {
        return mentor_email;
    }

    public void setMentor_email(String mentor_email) {
        this.mentor_email = mentor_email;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public String getNeed() {
        return need;
    }

    public void setNeed(String need) {
        this.need = need;
    }

    public Date getDate_sent() {
        return date_sent;
    }

    public void setDate_sent(Date date_sent) {
        this.date_sent = date_sent;
    }

    
}
