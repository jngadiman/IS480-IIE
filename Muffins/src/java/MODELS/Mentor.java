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
    
    ArrayList<Mentee> myMentees;

    public Mentor(String userName, String password, String email, String nric) {
        super(userName, password, email, nric);
    } 
    
    //gets all the mentees of this mentor
    public ArrayList<Mentee> getMentees(){
        
        
        return myMentees;
    }
}
