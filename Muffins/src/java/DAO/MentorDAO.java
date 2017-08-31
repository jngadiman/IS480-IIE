/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.Mentor;
import MODELS.User;
import Utility.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hui Min
 */
public class MentorDAO {
    public static ArrayList<Mentor> getMentors(){
        ArrayList<Mentor> allMentors = new ArrayList<Mentor>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String position = "";
        String introduction = "";
        String skills = "";
        String bankAccount = "";
        Mentor mentor = null;
        
        ArrayList<User> mentors = UserDAO.getAllMentors();
        for(User u: mentors){
            email = u.getEmail();
            try {
                conn = ConnectionManager.getConnection();
                stmt = conn.prepareStatement("SELECT *  FROM `mentor` WHERE `email` = ?;");
                stmt.setString(1, email);
                result = stmt.executeQuery();
                
                while (result.next()) {
                    email = result.getString("email");
                    position = result.getString("position");
                    introduction = result.getString("introduction");
                    bankAccount = result.getString("bank_account");
                    skills = result.getString("skills");
                }
                System.out.println(u.getName() + ": " + u.getProfile_pic());
                mentor = new Mentor(position, introduction, bankAccount, skills, email, u.getPassword(), u.getName(), u.getNric(), u.getProfile_pic(), u.getUser_type(), u.getCompanyid(), u.getRole(), u.getEquityPercentage(), u.getContactNumber(),u.getNationality());
            } catch (SQLException ex) {
                Logger.getLogger(MentorDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                ConnectionManager.close(conn, stmt, result);
            }
            allMentors.add(mentor);
            position = "";
            introduction = "";
        }
        return allMentors;
    }
    
      public static ArrayList<Mentor> getIncubatorMentors(){
        ArrayList<Mentor> incubatorMentors = new ArrayList<Mentor>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String position = "";
        String introduction = "";
        String skills = "";
        String bankAccount = "";
        Mentor mentor = null;
        
        ArrayList<User> mentors = UserDAO.getIncubatorMentors();
        for(User u: mentors){
            email = u.getEmail();
            try {
                conn = ConnectionManager.getConnection();
                stmt = conn.prepareStatement("SELECT *  FROM `mentor` WHERE `email` = ?;");
                stmt.setString(1, email);
                result = stmt.executeQuery();
                
                while (result.next()) {
                    email = result.getString("email");
                    position = result.getString("position");
                    introduction = result.getString("introduction");
                    bankAccount = result.getString("bank_account");
                    skills = result.getString("skills");
                }
                System.out.println(u.getName() + ": " + u.getProfile_pic());
                mentor = new Mentor(position, introduction, bankAccount, skills, email, u.getPassword(), u.getName(), u.getNric(), u.getProfile_pic(), u.getUser_type(), u.getCompanyid(), u.getRole(), u.getEquityPercentage(), u.getContactNumber(),u.getNationality());
            } catch (SQLException ex) {
                Logger.getLogger(MentorDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                ConnectionManager.close(conn, stmt, result);
            }
            incubatorMentors.add(mentor);
            position = "";
            introduction = "";
        }
        return incubatorMentors;
    }
    
      public static ArrayList<Mentor> getOpenMentors(){
        ArrayList<Mentor> openMentors = new ArrayList<Mentor>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String position = "";
        String introduction = "";
        String bankAccount = "";
        String skills = "";
        Mentor mentor = null;
        
        ArrayList<User> mentors = UserDAO.getOpenMentors();
        for(User u: mentors){
            email = u.getEmail();
            try {
                conn = ConnectionManager.getConnection();
                stmt = conn.prepareStatement("SELECT *  FROM `mentor` WHERE `email` = ?;");
                stmt.setString(1, email);
                result = stmt.executeQuery();
                
                while (result.next()) {
                    email = result.getString("email");
                    position = result.getString("position");
                    introduction = result.getString("introduction");
                    bankAccount = result.getString("bank_account");
                    skills = result.getString("skills");
                }
                System.out.println(u.getName() + ": " + u.getProfile_pic());
                mentor = new Mentor(position, introduction, bankAccount, skills, email, u.getPassword(), u.getName(), u.getNric(), u.getProfile_pic(), u.getUser_type(), u.getCompanyid(), u.getRole(), u.getEquityPercentage(), u.getContactNumber(),u.getNationality());
            } catch (SQLException ex) {
                Logger.getLogger(MentorDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                ConnectionManager.close(conn, stmt, result);
            }
            openMentors.add(mentor);
            position = "";
            introduction = "";
        }
        return openMentors;
    }
    
    public static Mentor getMentorByEmail(String email){
        Mentor m = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        
        User u = UserDAO.getUserByEmail(email);
        System.out.println("from mentorDAO" + u.getName());
        String position = "";
        String introduction = "";
        String bankAccount = "";
        String skills = "";
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Mentor where email = ?;");
            stmt.setString(1, email);
            result = stmt.executeQuery();
            
            while (result.next()) {
                email = result.getString("email");
                position = result.getString("position");
                introduction = result.getString("introduction");
                bankAccount = result.getString("bank_account");
                skills = result.getString("skills");
            }
            
            m = new Mentor(position, introduction, bankAccount, skills, email, u.getPassword(), u.getName(), u.getNric(), u.getProfile_pic(), u.getUser_type(), u.getCompanyid(), u.getRole(), u.getEquityPercentage(), u.getContactNumber(),u.getNationality());
        } catch (SQLException ex) {
            Logger.getLogger(MentorDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return m;
    }

    public static int editMentorDetails(Mentor m){
        int result = 0;
        
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        
        try {
            conn = ConnectionManager.getConnection();
            
            stmt = conn.prepareStatement("UPDATE Mentor SET position = ?, introduction = ?, bank_account = ?, skills = ? WHERE email = ?;");
            stmt.setString(1, m.getPosition());
            stmt.setString(2, m.getIntroduction());
            stmt.setString(3, m.getBankAccount());
            stmt.setString(4, m.getSkills());
            
            result = stmt.executeUpdate();
            
          
        } catch (SQLException ex) {
            Logger.getLogger(MentorDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }
    
    //get all the skill sets of the mentor
    public static String [] getSkillsOfMentor(String email){
        Mentor m = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        
        String skillsSet = "";
        String[] skills = new String[0];
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select skills from Mentor where email = ?;");
            stmt.setString(1, email);
            result = stmt.executeQuery();
            
            while (result.next()) {
                
                skillsSet = result.getString("skills");
            }
            skills = skillsSet.split(",");
            
        } catch (SQLException ex) {
            Logger.getLogger(MentorDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return skills;
    }
    
    public static void main(String[] args){
//        Mentor m = MentorDAO.getMentorByEmail("hello@hotmail.com");
//        System.out.println(m.getEmail());
//        System.out.println(m.getPassword());
//        System.out.println(m.getName());
//        System.out.println(m.getNric());
//        System.out.println(m.getProfile_pic());
//        System.out.println(m.getUser_type());
//        System.out.println(m.getCompanyid());
//        System.out.println(m.getPosition());
//        System.out.println(m.getIntroduction());
        
        ArrayList<Mentor> mentors = MentorDAO.getMentors();
        for(Mentor m: mentors){
            System.out.println(m.getEmail());
            System.out.println(m.getPassword());
            System.out.println(m.getName());
            System.out.println(m.getNric());
            System.out.println(m.getProfile_pic());
            System.out.println(m.getUser_type());
            System.out.println(m.getCompanyid());
            System.out.println(m.getPosition());
            System.out.println(m.getIntroduction());
        }
    }
}
