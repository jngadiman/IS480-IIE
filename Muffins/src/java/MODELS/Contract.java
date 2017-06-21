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
public class Contract {
    
    Mentor mentor;
    Admin admin;
    Date signedDate;
    
    public Contract(Mentor mentor, Admin admin, Date signedDate){
        this.mentor = mentor;
        this.admin = admin;
        this.signedDate = signedDate;
    }
    
    public Mentor getMentor(){
        return mentor;
    }
    
    public Admin getAdmin(){
        return admin;
    }
    
    public Date getDate(){
        return signedDate;
    }
    
    public void setMentor(Mentor mentor){
        this.mentor = mentor;
    }
    
    public void setAdmin(Admin admin){
        this.admin = admin;
    }
    
    public void setDate(Date signedDate){
        this.signedDate = signedDate;
    }
    
}
