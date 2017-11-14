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
        ArrayList<Mentee> lightMentees = MenteeDAO.getLightMentees();
        return lightMentees;
    }
    
    public static ArrayList<Mentee> getRegularMentees(){
        ArrayList<Mentee> regularMentees = MenteeDAO.getRegularMentees();
        return regularMentees;
    }
    
    public static ArrayList<Mentee> getAllMentees(){
        ArrayList<Mentee> allMentees = new ArrayList<>();
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
    
    public static boolean deleteMentee(String email){
        boolean deleteUser = UserDAO.deleteUser(email);
        boolean deleteMentee =  MenteeDAO.deleteMentee(email);
        if(deleteUser && deleteMentee){
            return true;
        }
        return false;
    }
    
    public static ArrayList<Mentee> getMenteeByMentor(String mentorEmail) {
        ArrayList<Mentee> mentees = new ArrayList<Mentee>();
        mentees = MenteeDAO.getMenteeByMentor(mentorEmail);
        return mentees;
    }
    
    public static void main(String[] args){
        ArrayList<Mentee> mentees = menteeController.getAllMentees();
        for(Mentee m: mentees){
            System.out.println(m.getEmail());
            System.out.println(m.getPassword());
            System.out.println(m.getName());
            System.out.println(m.getNric());
            System.out.println(m.getJoinedDate());
            System.out.println(m.getProfile_pic());
            System.out.println(m.getUser_type());
            System.out.println(m.getCompanyid());
            System.out.println(m.getRole());
            System.out.println(m.getEquityPercentage());
            System.out.println(m.getContactNumber());
            System.out.println(m.getNationality());
            System.out.println(m.getDegree());
            System.out.println(m.getYear_of_grad());
            System.out.println(m.getMentor_email());
        }
    }
}