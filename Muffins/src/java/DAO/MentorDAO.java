/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.Mentor;
import MODELS.User;
import Utility.ConnectionManager;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.serial.SerialBlob;

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
                    skills = result.getString("skills");
                    bankAccount = result.getString("bank_account");
                }
                System.out.println(u.getName() + ": " + u.getProfilePic());
                mentor = new Mentor(position, introduction, bankAccount, skills, email, u.getPassword(), u.getName(), u.getNric(), u.getJoinedDate(), u.getProfilePic(), u.getUserType(), u.getCompanyid(), u.getPosition(), u.getEquityPercentage(), u.getContactNumber(),u.getNationality());
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
                System.out.println(u.getName() + ": " + u.getProfilePic());
                mentor = new Mentor(position, introduction, bankAccount, skills, email, u.getPassword(), u.getName(), u.getNric(), u.getJoinedDate(), u.getProfilePic(), u.getUserType(), u.getCompanyid(), u.getPosition(), u.getEquityPercentage(), u.getContactNumber(),u.getNationality());
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
                System.out.println(u.getName() + ": " + u.getProfilePic());
                mentor = new Mentor(position, introduction, bankAccount, skills, email, u.getPassword(), u.getName(), u.getNric(), u.getJoinedDate(), u.getProfilePic(), u.getUserType(), u.getCompanyid(), u.getPosition(), u.getEquityPercentage(), u.getContactNumber(),u.getNationality());
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
            
            m = new Mentor(position, introduction, bankAccount, skills, email, u.getPassword(), u.getName(), u.getNric(), u.getJoinedDate(), u.getProfilePic(), u.getUserType(), u.getCompanyid(), u.getPosition(), u.getEquityPercentage(), u.getContactNumber(),u.getNationality());
        } catch (SQLException ex) {
            Logger.getLogger(MentorDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return m;
    }

    public static int editMentorDetails(Mentor m){
        int result = 0;
        
        User u = new User(m.getEmail(), m.getPassword(), m.getName(), m.getNric(), m.getJoinedDate(), m.getProfilePic(), m.getUserType(), m.getCompanyid(), m.getPosition(), m.getEquityPercentage(), m.getContactNumber(), m.getNationality());
        int userResult = UserDAO.editUser(u);
        System.out.println("from MentorDAO editMentorDetails: " + userResult);
        
        if(userResult == 0){
            return userResult;
        }
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        
        try {
            conn = ConnectionManager.getConnection();
            
            stmt = conn.prepareStatement("UPDATE mentor SET position = ?, introduction = ?, bank_account = ?, skills = ? WHERE email = ?;");
            stmt.setString(1, m.getPosition());
            stmt.setString(2, m.getIntroduction());
            stmt.setString(3, m.getBankAccount());
            stmt.setString(4, m.getSkills());
            stmt.setString(5, m.getEmail());
            System.out.println("from MentorDAO editMentorDetails: " + m.getPosition());
            System.out.println("from MentorDAO editMentorDetails: " + m.getIntroduction());
            System.out.println("from MentorDAO editMentorDetails: " + m.getSkills());
            System.out.println("from MentorDAO editMentorDetails: " + m.getEmail());
            result = stmt.executeUpdate();
            System.out.println("from MentorDAO editMentorDetails: " + result);
            //if there is a user record in the User table but no such row in the Mentee table
            if(userResult == 1 && result == 0){
                MentorDAO.addMentor(m);
            }
          
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
    
    public static ArrayList<String> getMentorsBySkills(ArrayList<String> skillSet){
        ArrayList<String> mentorEmails = new ArrayList<String>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String sqlStatement = "SELECT email FROM `mentor` WHERE ";
        String statement = " skills LIKE '%";
                
        for(int i = 0; i < skillSet.size(); i++){
            sqlStatement += statement + skillSet.get(i) + "%'";
            if(i != skillSet.size()- 1){
                sqlStatement += " AND ";
            }
        }
        System.out.println(sqlStatement);
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement(sqlStatement);
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                mentorEmails.add(email);
            }

        } catch (SQLException ex) {
            Logger.getLogger(MentorDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        sqlStatement = "SELECT email FROM `mentor` WHERE ";
        for(int i = 0; i < skillSet.size(); i++){
            sqlStatement += statement + skillSet.get(i) + "%'";
            if(i != skillSet.size()- 1){
                sqlStatement += " OR ";
            }
        }
        System.out.println(sqlStatement);
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement(sqlStatement);
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                if(!mentorEmails.contains(email)){
                    mentorEmails.add(email);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(MentorDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return mentorEmails;
    }
    
    //get mentors by type
    public static ArrayList<Mentor> getMentorsByType(String type){
        ArrayList<Mentor> allMentorsByType = new ArrayList<Mentor>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String position = "";
        String introduction = "";
        String skills = "";
        String bankAccount = "";
        Mentor mentor = null;
        
        ArrayList<User> mentors = UserDAO.getMentorsByType(type);
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
                    skills = result.getString("skills");
                    bankAccount = result.getString("bank_account");
                }
                System.out.println(u.getName() + ": " + u.getProfilePic());
                mentor = new Mentor(position, introduction, bankAccount, skills, email, u.getPassword(), u.getName(), u.getNric(), u.getJoinedDate(), u.getProfilePic(), u.getUserType(), u.getCompanyid(), u.getPosition(), u.getEquityPercentage(), u.getContactNumber(),u.getNationality());
            } catch (SQLException ex) {
                Logger.getLogger(MentorDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                ConnectionManager.close(conn, stmt, result);
            }
            allMentorsByType.add(mentor);
            position = "";
            introduction = "";
        }
        return allMentorsByType;
    }
    
    public static String addMentor(Mentor m){
        int result = 0;
        String status = "";
        User user = new User(m.getEmail(), m.getPassword(), m.getName(), m.getNric(), m.getJoinedDate(), m.getProfilePic(), m.getUserType(), m.getCompanyid(), m.getPosition(), m.getEquityPercentage(), m.getContactNumber(), m.getNationality());
        result = UserDAO.addUser(user);
        int result1 = 0;
        String email = m.getEmail();
        String dbpwd = "";
        
        String position = m.getPosition();
        String introduction = m.getIntroduction();
        String skills = m.getSkills();
        String bankAcct = m.getBankAccount();
        
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            
            //insert user to database
            stmt = conn.prepareStatement("Insert into mentor values (?, ?, ?, ?, ?)");

            //set email
            stmt.setString(1, email);

            //set password
            stmt.setString(2, position);

            //set name
            stmt.setString(3, introduction);

            //set nric
            stmt.setString(4, skills);
           
            //set nric
            stmt.setString(5, bankAcct);
            
            result1 = stmt.executeUpdate();
//            if(numRecordsUpdated == 1){
//                status = "Success!";
//            }else{
//                status = "Fail!";
//            }

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
        
        if(result == 1 && result1 == 1){
            status = "Mentor has been added in successfully!";
        }else{
            status = "Mentor could not be added in!";
        }
        
        return status;
    }
    
    public static boolean deleteMentor(String email){
        
        
        Connection conn = null;
        int numRecordsUpdated = 0;
        
        PreparedStatement stmt0 = null;

        try {
            conn = ConnectionManager.getConnection();

            //check the number of bids made by the student
            stmt0 = conn.prepareStatement("DELETE FROM mentor WHERE email = ?");
            stmt0.setString(1, email);

            numRecordsUpdated = stmt0.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (conn != null) {
                    conn.close();

                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        if (numRecordsUpdated != 1){
            return false;
        }
        return true;
    }
    
    public static void main(String[] args){
        //Mentor m = new Mentor("founder", "I am abc. ", "445-009-0093", "cooking and baking", "mentor4@hotmail.com", "password", "Mentor 4", "S9876713Y", new Date(), (byte[]) null, "Entrepreneur Mentor", 5, "founder", 100, 91129903, "Singaporean");
        //(String position, String introduction, String bankAccount, String skills, String email, String password, String name, String nric, Date joinedDate, byte[] profile_pic, String user_type, int companyid, String role, int equityPercentage, int contactNumber, String nationality)
        ArrayList<Mentor> mentors = MentorDAO.getMentors();
        for(Mentor m: mentors){
            System.out.println(m.getName());
        }
        
//        Mentor m = MentorDAO.getMentorByEmail("hello@hotmail.com");
//        System.out.println(m.getEmail());
//        System.out.println(m.getPassword());
//        System.out.println(m.getName());
//        System.out.println(m.getNric());
//        System.out.println(m.getJoinedDate());
//        System.out.println(m.getProfile_pic());
//        System.out.println(m.getUser_type());
//        System.out.println(m.getCompanyid());
//        System.out.println(m.getPosition());
//        System.out.println(m.getIntroduction());
        
//        ArrayList<Mentor> mentors = MentorDAO.getMentorsByType("Incubation Manager Mentor");
//        for(Mentor m: mentors){
//            System.out.println(m.getEmail());
//            System.out.println(m.getPassword());
//            System.out.println(m.getName());
//            System.out.println(m.getNric());
//            System.out.println(m.getJoinedDate());
//            System.out.println(m.getProfile_pic());
//            System.out.println(m.getUser_type());
//            System.out.println(m.getCompanyid());
//            System.out.println(m.getPosition());
//            System.out.println(m.getIntroduction());
//            System.out.println(m.getSkills());
//            System.out.println(m.getBankAccount());
//        }
//            ArrayList<String> skillSet = new ArrayList<String>();
//            skillSet.add("Business Development");
//            skillSet.add("Product Management");
//            ArrayList<String> mentorEmails = MentorDAO.getMentorsBySkills(skillSet);
//            for(String email : mentorEmails){
//                System.out.println(email);
//            }
    }
}
