/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

import java.util.*;

/**
 *
 * @author jiatung.lim
 */
public class User {
    
    private String email;
    private String password;
    private String name;
    private String nric;
    private Date joinedDate;
    private byte[] profilePic;
    private String userType;
    private int companyid;
    private String position;
    private int equityPercentage;
    private int contactNumber;
    private String nationality;
    
    //constructor for add new user

    public User(String email, String password, String name, String nric, Date joinedDate, byte[] profilePic, String userType, int companyid, String position, int equityPercentage, int contactNumber, String nationality) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.nric = nric;
        this.joinedDate = joinedDate;
        this.profilePic = profilePic;
        this.userType = userType;
        this.companyid = companyid;
        this.position = position;
        this.equityPercentage = equityPercentage;
        this.contactNumber = contactNumber;
        this.nationality = nationality;
    }

    public User(String email, String password, int companyid) {
        this.email = email;
        this.password = password;
        this.companyid = companyid;
        this.nric = "";
        this.joinedDate = null;
        this.profilePic = null;
        this.userType = "regular_mentee";
        this.position = "";
        this.equityPercentage = 0;
        this.contactNumber = 0;
        this.nationality = "";
        
    }
    
    public String getEmail(){
        return email;
    }
    
    public String getPassword(){
        return password;
    }
    
    public String getName() {
        return name;
    }
    
    public String getNric(){
        return nric;
    }
    
    public Date getJoinedDate() {
        return joinedDate;
    }
    
    public String getUserType() {
        return userType;
    }
    
    public int getCompanyid() {
        return companyid;
    }

    public byte[] getProfilePic() {
        return profilePic;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public void setNric(String nric){
        this.nric = nric;
    }
    
    public void setJoinedDate(Date joinedDate) {
        this.joinedDate = joinedDate;
    }
    
    public void setUserType(String userType) {
        this.userType = userType;
    }
    
    public void setCompanyid(int companyid) {
        this.companyid = companyid;
    }
    
    public void setProfilePic(byte[] profilePic) {
        this.profilePic = profilePic;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public int getEquityPercentage() {
        return equityPercentage;
    }

    public void setEquityPercentage(int equityPercentage) {
        this.equityPercentage = equityPercentage;
    }

    public int getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(int contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }
    
    
}
