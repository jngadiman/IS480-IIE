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
public class RegularMentees extends User {
    
    private ArrayList<Mentor> myMentors;
    private Mentor myMentor;
    private Company company;

    
    public RegularMentees(String userName, String password, String email, String nric) {
        super(userName, password, email, nric);
    }
    
    public RegularMentees(String userName, String password, String email, String nric, String company) {
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
    
    public Company getCompany(){
        
        return company;
        
    }
    
    public void setMentor(Mentor mentor){
        
        myMentor = mentor;
        
    }
    
    public void addMentor(Mentor mentor){
        
        myMentors.add(mentor);
        
    }
    
    public void setCompany(Company company){
        
        this.company = company;
        
    }
    
}
