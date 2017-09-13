/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.MentorDAO;
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
    
    public static void main(String[] args){
        ArrayList<Mentor> mentors = mentorController.getMentors();
        for(Mentor m: mentors){
            System.out.println(m.getEmail());
            System.out.println(m.getPassword());
            System.out.println(m.getName());
            System.out.println(m.getNric());
            System.out.println(m.getJoinedDate());
            System.out.println(m.getProfile_pic());
            System.out.println(m.getUser_type());
            System.out.println(m.getCompanyid());
            System.out.println(m.getPosition());
            System.out.println(m.getIntroduction());
        }
    }
    
}
