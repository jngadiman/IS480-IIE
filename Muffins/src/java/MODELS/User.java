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
    
    private String userName;
    private String password;
    private String name;
    private String email;
    private String nric;
    private String user_type;
    private Company company;
    
    public User(String userName, String password, String name, String email, String nric, String user_type, Company company){
        this.userName = userName;
        this.password = password;
        this.name = name;
        this.email = email;
        this.nric = nric;
        this.user_type = user_type;
        this.company = company;
    }
    
    
    public User(String userName, String password, String name, String email, String nric, String user_type){
        this.userName = userName;
        this.password = password;
        this.name = name;
        this.email = email;
        this.nric = nric;
        this.user_type = user_type;
    }
    
    public String getUserName(){
        return userName;
    }
 
    
    public String getPassword(){
        return password;
    }
    
    public String getName() {
        return name;
    }

    public String getEmail(){
        return email;
    }
    
    public String getNric(){
        return nric;
    }
    
    public String getUser_type() {
        return user_type;
    }
    
    public void setUserName(String username){
        this.userName = username;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public void setNric(String nric){
        this.nric = nric;
    }
    
    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }
}
