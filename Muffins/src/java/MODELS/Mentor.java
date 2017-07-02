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
    
    ArrayList<RegularMentees> myMentees;

    public Mentor(String userName, String password, String name, String email, String nric, String user_type) {
        super(userName, password, name, email, nric, user_type);
    } 
    
    //gets all the mentees of this mentor
    public ArrayList<RegularMentees> getMentees(){
        
        
        return myMentees;
    }
}
