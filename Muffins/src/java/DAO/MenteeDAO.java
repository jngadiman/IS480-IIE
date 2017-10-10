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
import java.util.*;

/**
 *
 * @author Hui Min
 */
public class MenteeDAO {
    public static ArrayList<Mentee> getMentees(){
        ArrayList<Mentee> allMentees = new ArrayList<Mentee>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
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
                    degree = result.getString("degree");
                    yearOfGrad = Integer.parseInt(result.getString("year_of_grad"));
                    mentor_email = result.getString("mentor_email");
                }
                
                mentee = new Mentee(degree, yearOfGrad, mentor_email, email, u.getPassword(), u.getName(), u.getNric(), u.getJoinedDate(), u.getProfile_pic(), u.getUser_type(), u.getCompanyid(), u.getRole(), u.getEquityPercentage(), u.getContactNumber(),u.getNationality());
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
    
    public static ArrayList<Mentee> getRegularMentees(){
        ArrayList<Mentee> regularMentees = new ArrayList<Mentee>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String degree = "";
        int yearOfGrad = 0;
        String mentor_email = "";
        Mentee mentee = null;
        
        ArrayList<User> mentees = UserDAO.getAllRegularMentees();
        for(User u: mentees){
            email = u.getEmail();
            try {
                conn = ConnectionManager.getConnection();
                stmt = conn.prepareStatement("SELECT * FROM `mentee` WHERE `email` = ?;");
                stmt.setString(1, email);
                result = stmt.executeQuery();
                
                while (result.next()) {
                    email = result.getString("email");
                    degree = result.getString("degree");
                    yearOfGrad = Integer.parseInt(result.getString("year_of_grad"));
                    mentor_email = result.getString("mentor_email");
                }
                
                mentee = new Mentee(degree, yearOfGrad, mentor_email, email, u.getPassword(), u.getName(), u.getNric(), u.getJoinedDate(), u.getProfile_pic(), u.getUser_type(), u.getCompanyid(), u.getRole(), u.getEquityPercentage(), u.getContactNumber(),u.getNationality());
            } catch (SQLException ex) {
                Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                ConnectionManager.close(conn, stmt, result);
            }
            regularMentees.add(mentee);
            degree = "";
            yearOfGrad = 0;
        }
        return regularMentees;
    }
    
    public static ArrayList<Mentee> getLightMentees(){
        ArrayList<Mentee> lightMentees = new ArrayList<Mentee>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String degree = "";
        int yearOfGrad = 0;
        String mentor_email = "";
        Mentee mentee = null;
        
        ArrayList<User> mentees = UserDAO.getAllLightMentees();
        for(User u: mentees){
            email = u.getEmail();
            try {
                conn = ConnectionManager.getConnection();
                stmt = conn.prepareStatement("SELECT * FROM `mentee` WHERE `email` = ?;");
                stmt.setString(1, email);
                result = stmt.executeQuery();
                
                while (result.next()) {
                    email = result.getString("email");
                    degree = result.getString("degree");
                    yearOfGrad = Integer.parseInt(result.getString("year_of_grad"));
                    mentor_email = result.getString("mentor_email");
                }
                
                mentee = new Mentee(degree, yearOfGrad, mentor_email, email, u.getPassword(), u.getName(), u.getNric(), u.getJoinedDate(), u.getProfile_pic(), u.getUser_type(), u.getCompanyid(), u.getRole(), u.getEquityPercentage(), u.getContactNumber(),u.getNationality());
            } catch (SQLException ex) {
                Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                ConnectionManager.close(conn, stmt, result);
            }
            lightMentees.add(mentee);
            degree = "";
            yearOfGrad = 0;
        }
        return lightMentees;
    }
    
//    //get all emails of all the Light Mentees
//    public static ArrayList<String> getLightMenteeEmails(){
//        ArrayList<String> lightMenteeEmails = new ArrayList<String>();
//        
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet result = null;
//        String email = "";
//        
//        try {
//            conn = ConnectionManager.getConnection();
//            stmt = conn.prepareStatement("SELECT `email` FROM `mentee` WHERE `mentee_type` = 'light';");
//            result = stmt.executeQuery();
//
//            while (result.next()) {
//                email = result.getString("email");
//                lightMenteeEmails.add(email);
//            }
//            
//        } catch (SQLException ex) {
//            Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            ConnectionManager.close(conn, stmt, result);
//        }
//        
//        return lightMenteeEmails;
//    }
//    
//    //get all emails of Regular Mentees
//    public static ArrayList<String> getRegularMenteeEmails(){
//        ArrayList<String> regularMenteeEmails = new ArrayList<String>();
//        
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet result = null;
//        String email = "";
//        
//        try {
//            conn = ConnectionManager.getConnection();
//            stmt = conn.prepareStatement("SELECT `email` FROM `mentee` WHERE `mentee_type` = 'regular';");
//            result = stmt.executeQuery();
//
//            while (result.next()) {
//                email = result.getString("email");
//                regularMenteeEmails.add(email);
//            }
//            
//        } catch (SQLException ex) {
//            Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            ConnectionManager.close(conn, stmt, result);
//        }
//        
//        return regularMenteeEmails;
//    }
    
//    public static ArrayList<ArrayList<String>> getLightMenteeDetails(){
//        ArrayList<ArrayList<String>> lightMentees = new ArrayList<ArrayList<String>>();
//        ArrayList<String> emails = MenteeDAO.getLightMenteeEmails();
//        
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet result = null;
//        String email = "";
//        String mentee_type = "";
//        String degree = "";
//        String yearOfGrad = "";
//        String mentor_email = "";
//        
//        
//        for(String s: emails){
//            ArrayList<String> lightMentee = new ArrayList<String>();
//            
//            try {
//                conn = ConnectionManager.getConnection();
//                stmt = conn.prepareStatement("SELECT * FROM `mentee` WHERE `email` = ?;");
//                stmt.setString(1, s);
//                result = stmt.executeQuery();
//                
//                while (result.next()) {
//                    email = result.getString("email");
//                    mentee_type = result.getString("mentee_type");
//                    degree = result.getString("degree");
//                    yearOfGrad = result.getString("year_of_grad");
//                    mentor_email = result.getString("mentor_email");    
//                }
//                
//                lightMentee.add(email);
//                lightMentee.add(mentee_type);
//                lightMentee.add(degree);
//                lightMentee.add(yearOfGrad);
//                lightMentee.add(mentor_email);
//            } catch (SQLException ex) {
//                Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
//            } finally {
//                ConnectionManager.close(conn, stmt, result);
//            }
//            lightMentees.add(lightMentee);
//            email = "";
//            mentee_type = "";
//            degree = "";
//            yearOfGrad = "";
//            mentor_email = "";
//        }
//        return lightMentees;
//    }
//
//    public static ArrayList<ArrayList<String>> getRegularMenteeDetails(){
//        ArrayList<ArrayList<String>> regularMentees = new ArrayList<ArrayList<String>>();
//        ArrayList<String> emails = MenteeDAO.getRegularMenteeEmails();
//        
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet result = null;
//        String email = "";
//        String mentee_type = "";
//        String degree = "";
//        String yearOfGrad = "";
//        String mentor_email = "";
//        
//        
//        for(String s: emails){
//            ArrayList<String> regularMentee = new ArrayList<String>();
//            
//            try {
//                conn = ConnectionManager.getConnection();
//                stmt = conn.prepareStatement("SELECT * FROM `mentee` WHERE `email` = ?;");
//                stmt.setString(1, s);
//                result = stmt.executeQuery();
//                
//                while (result.next()) {
//                    email = result.getString("email");
//                    mentee_type = result.getString("mentee_type");
//                    degree = result.getString("degree");
//                    yearOfGrad = result.getString("year_of_grad");
//                    mentor_email = result.getString("mentor_email");    
//                }
//                
//                regularMentee.add(email);
//                regularMentee.add(mentee_type);
//                regularMentee.add(degree);
//                regularMentee.add(yearOfGrad);
//                regularMentee.add(mentor_email);
//            } catch (SQLException ex) {
//                Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
//            } finally {
//                ConnectionManager.close(conn, stmt, result);
//            }
//            regularMentees.add(regularMentee);
//            email = "";
//            mentee_type = "";
//            degree = "";
//            yearOfGrad = "";
//            mentor_email = "";
//        }
//        return regularMentees;
//    }
    
    public static Mentee getMenteeByEmail(String email){
        Mentee m = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        
        User u = UserDAO.getUserByEmail(email);
        
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
                degree = result.getString("degree");
                yearOfGrad = Integer.parseInt(result.getString("year_of_grad"));
                mentor_email = result.getString("mentor_email");
            }
            
            m = new Mentee(degree, yearOfGrad, mentor_email, email, u.getPassword(), u.getName(), u.getNric(), u.getJoinedDate(), u.getProfile_pic(), u.getUser_type(), u.getCompanyid(), u.getRole(), u.getEquityPercentage(), u.getContactNumber(),u.getNationality());
            
        } catch (SQLException ex) {
            Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return m;
    }
    
    public static int editMenteeDetails(Mentee m){
        int result = 0;
        
        User u = new User(m.getEmail(), m.getPassword(), m.getName(), m.getNric(), m.getJoinedDate(), m.getProfile_pic(), m.getUser_type(), m.getCompanyid(), m.getRole(), m.getEquityPercentage(), m.getContactNumber(), m.getNationality());
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
    
    public static int updateMentor_Email(String mentee_email, String mentor_email){
        int result = 0;
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        
        try {
            conn = ConnectionManager.getConnection();
            
            stmt = conn.prepareStatement("UPDATE Mentee SET mentor_email = ? WHERE email = ?;");
            stmt.setString(1, mentor_email);
            stmt.setString(2, mentee_email);
            
            result = stmt.executeUpdate();
            
          
        } catch (SQLException ex) {
            Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }
    
    public static int addMentee(Mentee m){
        int numRecordsUpdated = 0;
        
        String email = m.getEmail();
        String degree = m.getDegree();
        int yrOfGrad = m.getYear_of_grad();
        String mentor_email = m.getMentor_email();
        
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            
            //insert user to database
            stmt = conn.prepareStatement("Insert into Mentee values (?, ?, ?, ?)");

            //set email
            stmt.setString(1, email);

            //set degree
            stmt.setString(2, degree);

            //set year of grad
            stmt.setInt(3, yrOfGrad);
            
            //set mentor_email
            stmt.setString(4, mentor_email);
            
            numRecordsUpdated = stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            try {
                if (conn != null) {
                    conn.close();

                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return numRecordsUpdated;
    }
    
    public static boolean deleteMentee(String email){
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int records = 0;
        
        
            try {
                conn = ConnectionManager.getConnection();
                stmt = conn.prepareStatement("DELETE * FROM `mentee` WHERE `email` = ?;");
                stmt.setString(1, email);
                
                records = stmt.executeUpdate();
                
                
            } catch (SQLException ex) {
                Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                ConnectionManager.close(conn, stmt, result);
            }
            if (records != 1){
            return false;
        }
        return true;
            
        
    }
    
    public static void main(String[] args){
//        ArrayList<ArrayList<String>> regularMentees = MenteeDAO.getRegularMenteeDetails();
//        for(ArrayList<String> regularMentee : regularMentees){
//            for(String s: regularMentee){
//                System.out.println(s);
//            }
//        }
        
//        Mentee m = new Mentee("huimin1@hotmail.com", "abc1234", "huimin1", "S0057328Y", null, "mentee", 1, "light", "accountancy", 2010, "huimin@hotmail.com");
//        int result = MenteeDAO.editMenteeDetails(m);
//        System.out.println(result);
            
            
        ArrayList<Mentee> mentees = MenteeDAO.getMentees();
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
