/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

/**
 *
 * @author jiatung.lim
 */
public class User {
    
    private String email;
    private String password;
    private String name;
    private String nric;
    private byte[] profile_pic;
    private String user_type;
    private int companyid;
    private String role;
    private int equityPercentage;
    private int contactNumber;
    private String nationality;
    
    //constructor for add new user

    public User(String email, String password, String name, String nric, byte[] profile_pic, String user_type, int companyid, String role, int equityPercentage, int contactNumber, String nationality) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.nric = nric;
        this.profile_pic = profile_pic;
        this.user_type = user_type;
        this.companyid = companyid;
        this.role = role;
        this.equityPercentage = equityPercentage;
        this.contactNumber = contactNumber;
        this.nationality = nationality;
    }
    
    
    public User(String email, String password, String name, String nric, String user_type){
        this.email = email;
        this.password = password;
        this.name = name;
        this.nric = nric;
        this.user_type = user_type;
    }
    
    public User(String email, String password, String name, String nric, byte[] profile_pic, String user_type){
        this.email = email;
        this.password = password;
        this.name = name;
        this.nric = nric;
        this.user_type = user_type;
        this.profile_pic = profile_pic;
    }
    
    public User(String email, String password, String name, String nric, String user_type, int company_id){
        this.email = email;
        this.password = password;
        this.name = name;
        this.nric = nric;
        this.user_type = user_type;
        this.companyid = company_id;
    }
    
    public User(String email, String password, String name, String nric, byte[] profile_pic, String user_type, int company_id){
        this.email = email;
        this.password = password;
        this.name = name;
        this.nric = nric;
        this.profile_pic = profile_pic;
        this.user_type = user_type;
        this.companyid = company_id;
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
    
    public String getUser_type() {
        return user_type;
    }
    
    public int getCompanyid() {
        return companyid;
    }

    public byte[] getProfile_pic() {
        return profile_pic;
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
    
    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }
    
    public void setCompanyid(int companyid) {
        this.companyid = companyid;
    }
    
    public void setProfile_pic(byte[] profile_pic) {
        this.profile_pic = profile_pic;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
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
