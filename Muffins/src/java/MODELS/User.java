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
}
