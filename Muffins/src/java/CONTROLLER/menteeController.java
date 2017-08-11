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
    
    public static void main(String[] args){
        ArrayList<Mentee> regularMentees = menteeController.getRegularMentees();
        for(Mentee m: regularMentees){
            System.out.println(m.getEmail());
            System.out.println(m.getPassword());
            System.out.println(m.getName());
            System.out.println(m.getNric());
            System.out.println(m.getProfile_pic());
            System.out.println(m.getUser_type());
            System.out.println(m.getCompanyid());
            System.out.println(m.getMentee_type());
            System.out.println(m.getDegree());
            System.out.println(m.getYear_of_grad());
            System.out.println(m.getMentor_email());
        }
    }
}
