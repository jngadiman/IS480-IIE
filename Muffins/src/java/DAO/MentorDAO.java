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
        ArrayList<Mentor> allMentors = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String position = "";
        String introduction = "";
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
                }
                mentor = new Mentor(email, u.getPassword(), u.getName(), u.getNric(), u.getProfile_pic(), u.getUser_type(), u.getCompanyid(), position, introduction);
            } catch (SQLException ex) {
                Logger.getLogger(MenteeDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                ConnectionManager.close(conn, stmt, result);
            }
            allMentors.add(mentor);
            position = "";
            introduction = "";
        }
        return allMentors;
    }
    
    public static Mentor getMentorByEmail(String email){
        Mentor m = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        
        User u = UserDAO.getUserByEmail(email);
        
        String position = "";
        String introduction = "";
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Mentor where email = ?;");
            stmt.setString(1, email);
            result = stmt.executeQuery();
            
            while (result.next()) {
                email = result.getString("email");
                position = result.getString("position");
                introduction = result.getString("introduction");
            }
            
            m = new Mentor(email, u.getPassword(), u.getName(), u.getNric(), u.getProfile_pic(), u.getUser_type(), u.getCompanyid(), position, introduction);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return m;
    }

    public static int editMentorDetails(Mentor m){
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
            
            stmt = conn.prepareStatement("UPDATE Mentor SET position = ?, introduction = ? WHERE email = ?;");
            stmt.setString(1, m.getPosition());
            stmt.setString(2, m.getIntroduction());
            stmt.setString(3, m.getEmail());
            
            result = stmt.executeUpdate();
            //task = new Task(taskName, desc, deadline, stage,companyID, isCompleted);
          
        } catch (SQLException ex) {
            Logger.getLogger(MentorDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }
    
    
    
    public static void main(String[] args){
        Mentor m = MentorDAO.getMentorByEmail("huimin@hotmail.com");
        System.out.println(m.getEmail());
        System.out.println(m.getPassword());
        System.out.println(m.getName());
        System.out.println(m.getNric());
        System.out.println(m.getProfile_pic());
        System.out.println(m.getUser_type());
        System.out.println(m.getCompanyid());
        System.out.println(m.getPosition());
        System.out.println(m.getIntroduction());
        
//        ArrayList<Mentor> mentors = MentorDAO.getMentors();
//        for(Mentor m: mentors){
//            System.out.println(m.getEmail());
//            System.out.println(m.getPassword());
//            System.out.println(m.getName());
//            System.out.println(m.getNric());
//            System.out.println(m.getProfile_pic());
//            System.out.println(m.getUser_type());
//            System.out.println(m.getCompanyid());
//            System.out.println(m.getPosition());
//            System.out.println(m.getIntroduction());
//        }
    }
}
