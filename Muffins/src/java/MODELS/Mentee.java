/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

import java.util.ArrayList;

/**
 *
 * @author JJAY
 */
public class Mentee extends User {
    
    ArrayList<Mentor> myMentors;
    Mentor myMentor;
    
    public Mentee(String userName, String userType, String password, String email) {
        super(userName,password,email);
    }
    
    //gets all the mentors of this mentee (if have more that one mentors)
    public ArrayList<Mentor> getMentors(){
        
        return myMentors;
        
    }
    
    //gets the mentor of this mentee 
    public Mentor getMentor(){
        
        return myMentor;
        
    }
    
    public void setMentor(Mentor mentor){
        
        myMentor = mentor;
        
    }
    
    public void addMentor(Mentor mentor){
        
        myMentors.add(mentor);
        
    }
    
}
