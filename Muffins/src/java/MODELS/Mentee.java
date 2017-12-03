/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

import java.util.*;

/**
 *
 * @author Hui Min
 */
public class Mentee extends User{
    private String degree;
    private int yearOfGrad;
    private String mentorEmail;

    public Mentee(String degree, int yearOfGrad, String mentorEmail, String email, String password, String name, String nric, Date joinedDate, byte[] profilePic, String userType, int companyid, String role, int equityPercentage, int contactNumber, String nationality) {
        super(email, password, name, nric, joinedDate, profilePic, userType, companyid, role, equityPercentage, contactNumber, nationality);
        this.degree = degree;
        this.yearOfGrad = yearOfGrad;
        this.mentorEmail = mentorEmail;
    }
    
    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public int getYearOfGrad() {
        return yearOfGrad;
    }

    public void setYearOfGrad(int yearOfGrad) {
        this.yearOfGrad = yearOfGrad;
    }
    
    public String getMentorEmail() {
        return mentorEmail;
    }

    public void setMentorEmail(String mentorEmail) {
        this.mentorEmail = mentorEmail;
    }
}
