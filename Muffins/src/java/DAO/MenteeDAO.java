/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;


import MODELS.Mentee;
import MODELS.User;
import Utility.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hui Min
 */
public class MenteeDAO {
    public static ArrayList<Mentee> getMentees(){
        ArrayList<Mentee> allMentees = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String mentee_type = "";
        String degree = "";
        int yearOfGrad = 0;
        String mentor_email = "";
        Mentee mentee = null;
        
        ArrayList<User> mentees = UserDAO.getAllMentees();
        for(User u: mentees){
            email = u.getEmail();
            try {
                conn = ConnectionManager.getConnection();
                stmt = conn.prepareStatement("SELECT * FROM `mentee` WHERE `email` = ?;");
                stmt.setString(1, email);
                result = stmt.executeQuery();
                
                while (result.next()) {
                    email = result.getString("email");
                    mentee_type = result.getString("mentee_type");
                    degree = result.getString("degree");
                    yearOfGrad = Integer.parseInt(result.getString("year_of_grad"));
                    mentor_email = result.getString("mentor_email");
                }
                mentee = new Mentee(email, u.getPassword(), u.getName(), u.getNric(), u.getProfile_pic(), u.getUser_type(), u.getCompanyid(), mentee_type , degree, yearOfGrad, mentor_email);
            } catch (SQLException ex) {
                Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                ConnectionManager.close(conn, stmt, result);
            }
            allMentees.add(mentee);
            degree = "";
            yearOfGrad = 0;
        }
        return allMentees;
    }
    
    //get all emails of all the Light Mentees
    public static ArrayList<String> getLightMenteeEmails(){
        ArrayList<String> lightMenteeEmails = new ArrayList<>();
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("SELECT `email` FROM `mentee` WHERE `mentee_type` = 'light';");
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                lightMenteeEmails.add(email);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return lightMenteeEmails;
    }
    
    //get all emails of Regular Mentees
    public static ArrayList<String> getRegularMenteeEmails(){
        ArrayList<String> regularMenteeEmails = new ArrayList<>();
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("SELECT `email` FROM `mentee` WHERE `mentee_type` = 'regular';");
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                regularMenteeEmails.add(email);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return regularMenteeEmails;
    }
    
    public static ArrayList<ArrayList<String>> getLightMenteeDetails(){
        ArrayList<ArrayList<String>> lightMentees = new ArrayList<>();
        ArrayList<String> emails = MenteeDAO.getLightMenteeEmails();
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String mentee_type = "";
        String degree = "";
        String yearOfGrad = "";
        String mentor_email = "";
        
        
        for(String s: emails){
            ArrayList<String> lightMentee = new ArrayList<>();
            
            try {
                conn = ConnectionManager.getConnection();
                stmt = conn.prepareStatement("SELECT * FROM `mentee` WHERE `email` = ?;");
                stmt.setString(1, s);
                result = stmt.executeQuery();
                
                while (result.next()) {
                    email = result.getString("email");
                    mentee_type = result.getString("mentee_type");
                    degree = result.getString("degree");
                    yearOfGrad = result.getString("year_of_grad");
                    mentor_email = result.getString("mentor_email");    
                }
                
                lightMentee.add(email);
                lightMentee.add(mentee_type);
                lightMentee.add(degree);
                lightMentee.add(yearOfGrad);
                lightMentee.add(mentor_email);
            } catch (SQLException ex) {
                Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                ConnectionManager.close(conn, stmt, result);
            }
            lightMentees.add(lightMentee);
            email = "";
            mentee_type = "";
            degree = "";
            yearOfGrad = "";
            mentor_email = "";
        }
        return lightMentees;
    }

    public static ArrayList<ArrayList<String>> getRegularMenteeDetails(){
        ArrayList<ArrayList<String>> regularMentees = new ArrayList<>();
        ArrayList<String> emails = MenteeDAO.getRegularMenteeEmails();
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String mentee_type = "";
        String degree = "";
        String yearOfGrad = "";
        String mentor_email = "";
        
        
        for(String s: emails){
            ArrayList<String> regularMentee = new ArrayList<>();
            
            try {
                conn = ConnectionManager.getConnection();
                stmt = conn.prepareStatement("SELECT * FROM `mentee` WHERE `email` = ?;");
                stmt.setString(1, s);
                result = stmt.executeQuery();
                
                while (result.next()) {
                    email = result.getString("email");
                    mentee_type = result.getString("mentee_type");
                    degree = result.getString("degree");
                    yearOfGrad = result.getString("year_of_grad");
                    mentor_email = result.getString("mentor_email");    
                }
                
                regularMentee.add(email);
                regularMentee.add(mentee_type);
                regularMentee.add(degree);
                regularMentee.add(yearOfGrad);
                regularMentee.add(mentor_email);
            } catch (SQLException ex) {
                Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                ConnectionManager.close(conn, stmt, result);
            }
            regularMentees.add(regularMentee);
            email = "";
            mentee_type = "";
            degree = "";
            yearOfGrad = "";
            mentor_email = "";
        }
        return regularMentees;
    }
    
    public static Mentee getMenteeByEmail(String email){
        Mentee m = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        
        User u = UserDAO.getUserByEmail(email);
        
        String mentee_type = "";
        String degree = "";
        int yearOfGrad = 0;
        String mentor_email = "";
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Mentee where email = ?;");
            stmt.setString(1, email);
            result = stmt.executeQuery();
            
            while (result.next()) {
                email = result.getString("email");
                mentee_type = result.getString("mentee_type");
                degree = result.getString("degree");
                yearOfGrad = Integer.parseInt(result.getString("year_of_grad"));
                mentor_email = result.getString("mentor_email");
            }
            
            m = new Mentee(email, u.getPassword(), u.getName(), u.getNric(), u.getProfile_pic(), u.getUser_type(), u.getCompanyid(), mentee_type, degree, yearOfGrad, mentor_email);
            
        } catch (SQLException ex) {
            Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return m;
    }
    
    public static int editMenteeDetails(Mentee m){
        int result = 0;
        
        User u = new User(m.getEmail(), m.getPassword(), m.getName(), m.getNric(), m.getProfile_pic(), m.getUser_type(), m.getCompanyid());
        int userResult = UserDAO.editUser(u);
        
        if(userResult == 0){
            return userResult;
        }
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        
        try {
            conn = ConnectionManager.getConnection();
            
            stmt = conn.prepareStatement("UPDATE Mentee SET degree = ?, year_of_grad = ? WHERE email = ?;");
            stmt.setString(1, m.getDegree());
            stmt.setInt(2, m.getYear_of_grad());
            stmt.setString(3, m.getEmail());
            
            result = stmt.executeUpdate();
            //task = new Task(taskName, desc, deadline, stage,companyID, isCompleted);
          
        } catch (SQLException ex) {
            Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }
    
    public static void main(String[] args){
//        ArrayList<ArrayList<String>> regularMentees = MenteeDAO.getRegularMenteeDetails();
//        for(ArrayList<String> regularMentee : regularMentees){
//            for(String s: regularMentee){
//                System.out.println(s);
//            }
//        }
        
//        Mentee m = new Mentee("huimin1@hotmail.com", "abc1234", "huimin1", "S7657328Y", null, "mentee", 1, "regular", "business", 2018, "huimin@hotmail.com");
//        int result = MenteeDAO.editMenteeDetails(m);
//        System.out.println(result);
        
            Mentee m = MenteeDAO.getMenteeByEmail("y@smu.edu.sg");
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
