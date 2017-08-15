/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.MenteeDAO;
import DAO.UserDAO;
import MODELS.Mentee;
import MODELS.User;
import java.util.ArrayList;

/**
 *
 * @author Hui Min
 */
public class menteeController {
    
    public static Mentee getMentee(String email){
        Mentee m = MenteeDAO.getMenteeByEmail(email);
        return m;
    }
    
    public static ArrayList<Mentee> getLightMentees(){
        ArrayList<Mentee> lightMentees = new ArrayList<>();
        Mentee m = null;
        
        ArrayList<String> lightMenteeEmails = MenteeDAO.getLightMenteeEmails();
        for(String s: lightMenteeEmails){
            m = MenteeDAO.getMenteeByEmail(s);
            lightMentees.add(m);
        }
        
        return lightMentees;
    }
    
    public static ArrayList<Mentee> getRegularMentees(){
        ArrayList<Mentee> regularMentees = new ArrayList<>();
        Mentee m = null;
        
        ArrayList<String> regularMenteeEmails = MenteeDAO.getRegularMenteeEmails();
        for(String s: regularMenteeEmails){
            m = MenteeDAO.getMenteeByEmail(s);
            regularMentees.add(m);
        }
        
        return regularMentees;
    }
    
    public static ArrayList<Mentee> getAllMentees(){
        ArrayList<Mentee> allMentees = new ArrayList<>();
        Mentee m = null;
        
        allMentees = MenteeDAO.getMentees();
        return allMentees;
    }
    
    public static int updateMentorEmail(int company_id, String mentor_email){
        ArrayList<String> emails = UserDAO.getUserEmailsOfCompany(company_id);
        int result = 0;
        for(String email: emails){
            result = MenteeDAO.updateMentor_Email(email, mentor_email);
        }
        
        return result;
    }
    
    public static void main(String[] args){
        int result = menteeController.updateMentorEmail(2, "hello@hotmail.com");
        System.out.println(result);
    }
}
