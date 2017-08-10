/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;


import MODELS.Mentee;
//import MODELS.RegularMentees;
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
    
  
//    //need to recode this!!
//    public static ArrayList<Mentee> getLightMentees(){
//        ArrayList<Mentee> lightMentees = new ArrayList<>();
//        
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet result = null;
//        String email = "";
//        String mentee_type = "";
//        String degree = "";
//        int yearOfGrad = 0;
//        String mentor_email = "";
//        Mentee mentee = null;
//        
//        ArrayList<User> lightmentees = UserDAO.getAllLightMentees();
//        for(User u: lightmentees){
//            email = u.getEmail();
//            try {
//                conn = ConnectionManager.getConnection();
//                stmt = conn.prepareStatement("SELECT `degree`, `year_of_grad` FROM `mentee` WHERE `email` = ?;");
//                stmt.setString(1, email);
//                result = stmt.executeQuery();
//                
//                while (result.next()) {
//                    degree = result.getString("degree");
//                    yearOfGrad = Integer.parseInt(result.getString("year_of_grad"));
//                }
//                lightMentee = new Mentee(email, u.getPassword(), u.getName(), u.getNric(), u.getProfile_pic(), u.getUser_type(), u.getCompanyid(), degree, yearOfGrad);
//            } catch (SQLException ex) {
//                Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
//            } finally {
//                ConnectionManager.close(conn, stmt, result);
//            }
//            lightMentees.add(lightMentee);
//            degree = "";
//            yearOfGrad = 0;
//        }
//        return lightMentees;
//    }
//
//    //need to recode this!!
//    public static ArrayList<RegularMentees> getRegularMentees(){
//        ArrayList<RegularMentees> regularMentees = new ArrayList<>();
//        
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet result = null;
//        String email = "";
//        String degree = "";
//        int yearOfGrad = 0;
//        String mentor_email = "";
//        RegularMentees regularMentee = null;
//        
//        ArrayList<User> regularmentees = UserDAO.getAllRegularMentees();
//        for(User u: regularmentees){
//            email = u.getEmail();
//            try {
//                conn = ConnectionManager.getConnection();
//                stmt = conn.prepareStatement("SELECT `degree`, `year_of_grad`, 'mentor_email' FROM `mentee` WHERE `email` = ?;");
//                stmt.setString(1, email);
//                result = stmt.executeQuery();
//                
//                while (result.next()) {
//                    degree = result.getString("degree");
//                    yearOfGrad = Integer.parseInt(result.getString("year_of_grad"));
//                    mentor_email = result.getString("mentor_email");
//                }
//                
//                
//                regularMentee = new RegularMentees(email, u.getPassword(), u.getName(), u.getNric(), u.getProfile_pic(), u.getUser_type(), u.getCompanyid(), degree, yearOfGrad, mentor_email);
//            } catch (SQLException ex) {
//                Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
//            } finally {
//                ConnectionManager.close(conn, stmt, result);
//            }
//            regularMentees.add(regularMentee);
//            degree = "";
//            yearOfGrad = 0;
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
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        Mentee m = new Mentee("huimin1@hotmail.com", "abc1234", "huimin1", "S7657328Y", null, "mentee", 1, "regular", "business", 2018, "huimin@hotmail.com");
        int result = MenteeDAO.editMenteeDetails(m);
        System.out.println(result);
        
//        Mentee m = MenteeDAO.getMenteeByEmail("huimin1@hotmail.com");
//            System.out.println(m.getEmail());
//            System.out.println(m.getPassword());
//            System.out.println(m.getName());
//            System.out.println(m.getNric());
//            System.out.println(m.getProfile_pic());
//            System.out.println(m.getUser_type());
//            System.out.println(m.getCompanyid());
//            System.out.println(m.getDegree());
//            System.out.println(m.getYear_of_grad());
//        
    }
}
