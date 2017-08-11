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
public class Mentee extends User{
    private User user;
    private String mentee_type;
    private String degree;
    private int year_of_grad;
    private String mentor_email;

    public Mentee(String email, String password, String name, String nric, String profile_pic, String user_type, int company_id, String mentee_type, String degree, int year_of_grad, String mentor_email) {
        super(email, password, name, nric, profile_pic, user_type, company_id);
        this.mentee_type = mentee_type;
        this.degree = degree;
        this.year_of_grad = year_of_grad;
        this.mentor_email = mentor_email;
    }

    public String getMentee_type() {
        return mentee_type;
    }

    public void setMentee_type(String mentee_type) {
        this.mentee_type = mentee_type;
    }
    
    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public int getYear_of_grad() {
        return year_of_grad;
    }

    public void setYear_of_grad(int year_of_grad) {
        this.year_of_grad = year_of_grad;
    }
    
    public String getMentor_email() {
        return mentor_email;
    }

    public void setMentor_email(String mentor_email) {
        this.mentor_email = mentor_email;
    }
}
