/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.MentorDAO;
import DAO.UserDAO;
import MODELS.Mentor;
import java.util.ArrayList;

/**
 *
 * @author Hui Min
 */
public class mentorController {
    public static Mentor getMentor(String email){
        Mentor m = MentorDAO.getMentorByEmail(email);    
        return m;
    }
    
    public static ArrayList<Mentor> getMentors(){
        ArrayList<Mentor> mentors = MentorDAO.getMentors();
        return mentors;
    }
    
    public static ArrayList<String> getSkillsOfMentor(String email){
        String[] set = MentorDAO.getSkillsOfMentor(email);
        ArrayList<String> skills = new ArrayList<String>();
        for(String skill: set){
            skills.add(skill);
        }
        return skills;
    }
    
    public static ArrayList<Mentor> getMentorsByType(String type){
        if(type.equals("IncubationManager")){
            type = "mentor_im";
        }else if(type.equals("VentureCapitalist")){
            type = "mentor_vc";
        }else if(type.equals("IndustryProfessional")){
            type = "mentor_ip";
        }else if(type.equals("Entrepreneur")){
            type = "mentor_entre";
        }
        
        ArrayList<Mentor> mentors = MentorDAO.getMentorsByType(type);
        return mentors;
    }
    
    public static String addMentor(Mentor m){
        String status = MentorDAO.addMentor(m);
        return status;
    }
    
    public static boolean deleteMentor(String email){
        boolean status = MentorDAO.deleteMentor(email);
        if(status){
            UserDAO.deleteUser(email);
        }
        return status;
    }
    
    public static void main(String[] args){
        ArrayList<Mentor> mentors = mentorController.getMentorsByType("IncubationManager");
        for(Mentor m: mentors){
            System.out.println(m.getEmail());
            System.out.println(m.getPassword());
            System.out.println(m.getName());
            System.out.println(m.getNric());
            System.out.println(m.getJoinedDate());
            System.out.println(m.getProfilePic());
            System.out.println(m.getUserType());
            System.out.println(m.getCompanyid());
            System.out.println(m.getPosition());
            System.out.println(m.getIntroduction());
        }
    }
    
}
