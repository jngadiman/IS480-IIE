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
    
    private ArrayList<Mentor> myMentors;
    private Mentor myMentor;
    private String company;

    public Mentee(String userName, String password, String email, String nric) {
        super(userName, password, email, nric);
    }
    
    public Mentee(String userName, String password, String email, String nric, String company) {
        super(userName, password, email, nric);
    }
      
    //gets all the mentors of this mentee (if have more that one mentors)
    public ArrayList<Mentor> getMentors(){
        
        return myMentors;
        
    }
    
    //gets the mentor of this mentee 
    public Mentor getMentor(){
        
        return myMentor;
        
    }
    
    public String getCompany(){
        
        return company;
        
    }
    
    public void setMentor(Mentor mentor){
        
        myMentor = mentor;
        
    }
    
    public void addMentor(Mentor mentor){
        
        myMentors.add(mentor);
        
    }
    
    public void setCompany(String company){
        
        this.company = company;
        
    }
    
}
