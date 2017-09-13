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
public class Mentor extends User{
    private String position;
    private String introduction;
    private String bankAccount;
    private String skills;

    public Mentor(String position, String introduction, String bankAccount, String skills, String email, String password, String name, String nric, Date joinedDate, byte[] profile_pic, String user_type, int companyid, String role, int equityPercentage, int contactNumber, String nationality) {
        super(email, password, name, nric, joinedDate, profile_pic, user_type, companyid, role, equityPercentage, contactNumber, nationality);
        this.position = position;
        this.introduction = introduction;
        this.bankAccount = bankAccount;
        this.skills = skills;
    }

    

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(String bankAccount) {
        this.bankAccount = bankAccount;
    }
    
    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }
    
}
