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
    
    String userName;
    String password;
    String email;
    
    User(String userName, String password, String email){
        this.userName = userName;
        this.password = password;
        this.email = email;
    }
    
    public String getUserName(){
        return userName;
    }
 
    
    public String getPassword(){
        return password;
    }
    
     public String getEmail(){
        return email;
    }
    
    public void setUserName(String username){
        this.userName = username;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
}
