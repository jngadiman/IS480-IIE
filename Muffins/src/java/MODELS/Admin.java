/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

/**
 *
 * @author JJAY
 */
public class Admin extends User{
    
    public Admin(String userName, String password, String name, String email, String nric, String user_type) {
        super(userName, password, name, email, nric, user_type);
    }
   
}
