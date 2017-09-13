/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.Company;
import Utility.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import MODELS.User;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Blob;
import javax.sql.rowset.serial.SerialBlob;
/**
 *
 * @author Hui Min
 */
public class UserDAO {
    public static ArrayList<User> getAllUsers(){
        ArrayList<User> users = new ArrayList<User>();
        User u = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String password = "";
        String name = "";
        String nric = "";
        Date joinedDate = null;
        Blob profile_pic = null;
        byte[] profilePic = null;
        String user_type = "";
        int company_id = 0;
        String position = "";
        int equity_percentage = 0;
        int contact_number = 0;
        String nationality = "";
        

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from user;");
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                password = result.getString("password");
                name = result.getString("name");
                nric = result.getString("nric");
                joinedDate = result.getDate("joined_date");
                profile_pic = result.getBlob("profile_pic");
                user_type = result.getString("user_type");
                company_id = Integer.parseInt(result.getString("company_id"));
                position = result.getString("position");
                if(result.getString("equity_percentage") != null){
                    equity_percentage = Integer.parseInt(result.getString("equity_percentage"));
                }else{
                    equity_percentage = 0;
                }
                contact_number = Integer.parseInt(result.getString("contact_number"));
                nationality = result.getString("nationality");
                if(profile_pic != null){
                    profilePic = profile_pic.getBytes(1, (int) profile_pic.length());
                }else{
                    profilePic = null;
                }
                
                u = new User(email, password, name, nric, joinedDate, profilePic, user_type, company_id, position, equity_percentage, contact_number, nationality);
                users.add(u);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return users;
    }
    
    //get all mentors
    public static ArrayList<User> getAllMentors(){
        ArrayList<User> users = new ArrayList<User>();
        User u = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String password = "";
        String name = "";
        String nric = "";
        Date joinedDate = null;
        Blob profile_pic = null;
        byte[] profilePic = null;
        String user_type = "";
        int company_id = 0;
        String position = "";
        int equity_percentage = 0;
        int contact_number = 0;
        String nationality = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from user where user_type = 'Entrepreneur Mentor' or user_type = 'Incubation Manager Mentor' or user_type = 'Venture Capitalist Mentor' or user_type='Industry Professional Mentor' ORDER BY `name` asc ;");
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                password = result.getString("password");
                name = result.getString("name");
                nric = result.getString("nric");
                joinedDate = result.getDate("joined_date");
                profile_pic = result.getBlob("profile_pic");
                user_type = result.getString("user_type");
                company_id = Integer.parseInt(result.getString("company_id"));
                position = result.getString("position");
                if(result.getString("equity_percentage") != null){
                    equity_percentage = Integer.parseInt(result.getString("equity_percentage"));
                }else{
                    equity_percentage = 0;
                }
                contact_number = Integer.parseInt(result.getString("contact_number"));
                nationality = result.getString("nationality");
                if(profile_pic != null){
                    profilePic = profile_pic.getBytes(1, (int) profile_pic.length());
                }else{
                    profilePic = null;
                }
                
                u = new User(email, password, name, nric, joinedDate, profilePic, user_type, company_id, position, equity_percentage, contact_number, nationality);
                users.add(u);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return users;
    }
    
    public static ArrayList<User> getAllMentees(){
        ArrayList<User> users = new ArrayList<User>();
        User u = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String password = "";
        String name = "";
        String nric = "";
        Date joinedDate = null;
        Blob profile_pic = null;
        byte[] profilePic = null;
        String user_type = "";
        int company_id = 0;
        String position = "";
        int equity_percentage = 0;
        int contact_number = 0;
        String nationality = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from user where user_type = 'regular_mentee' or user_type = 'light_mentee';");
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                password = result.getString("password");
                name = result.getString("name");
                nric = result.getString("nric");
                joinedDate = result.getDate("joined_date");
                profile_pic = result.getBlob("profile_pic");
                user_type = result.getString("user_type");
                company_id = Integer.parseInt(result.getString("company_id"));
                position = result.getString("position");
                if(result.getString("equity_percentage") != null){
                    equity_percentage = Integer.parseInt(result.getString("equity_percentage"));
                }else{
                    equity_percentage = 0;
                }
                contact_number = Integer.parseInt(result.getString("contact_number"));
                nationality = result.getString("nationality");
                if(profile_pic != null){
                    profilePic = profile_pic.getBytes(1, (int) profile_pic.length());
                }else{
                    profilePic = null;
                }
                
                u = new User(email, password, name, nric, joinedDate, profilePic, user_type, company_id, position, equity_percentage, contact_number, nationality);
                users.add(u);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return users;
    }
    
      public static ArrayList<User> getIncubatorMentors(){
        ArrayList<User> users = new ArrayList<User>();
        User u = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String password = "";
        String name = "";
        String nric = "";
        Date joinedDate = null;
        Blob profile_pic = null;
        byte[] profilePic = null;
        String user_type = "";
        int company_id = 0;
        String position = "";
        int equity_percentage = 0;
        int contact_number = 0;
        String nationality = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from user where user_type = 'both' and user_type = 'Incubation Mentor';");
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                password = result.getString("password");
                name = result.getString("name");
                nric = result.getString("nric");
                joinedDate = result.getDate("joined_date");
                profile_pic = result.getBlob("profile_pic");
                user_type = result.getString("user_type");
                company_id = Integer.parseInt(result.getString("company_id"));
                position = result.getString("position");
                if(result.getString("equity_percentage") != null){
                    equity_percentage = Integer.parseInt(result.getString("equity_percentage"));
                }else{
                    equity_percentage = 0;
                }
                contact_number = Integer.parseInt(result.getString("contact_number"));
                nationality = result.getString("nationality");
                if(profile_pic != null){
                    profilePic = profile_pic.getBytes(1, (int) profile_pic.length());
                }else{
                    profilePic = null;
                }
                
                u = new User(email, password, name, nric, joinedDate, profilePic, user_type, company_id, position, equity_percentage, contact_number, nationality);
                users.add(u);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return users;
    }
    
      public static ArrayList<User> getOpenMentors(){
        ArrayList<User> users = new ArrayList<User>();
        User u = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String password = "";
        String name = "";
        String nric = "";
        Date joinedDate = null;
        Blob profile_pic = null;
        byte[] profilePic = null;
        String user_type = "";
        int company_id = 0;
        String position = "";
        int equity_percentage = 0;
        int contact_number = 0;
        String nationality = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from user where user_type = 'both' and user_type = 'Open Mentorship Mentor' ;");
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                password = result.getString("password");
                name = result.getString("name");
                nric = result.getString("nric");
                joinedDate = result.getDate("joined_date");
                profile_pic = result.getBlob("profile_pic");
                user_type = result.getString("user_type");
                company_id = Integer.parseInt(result.getString("company_id"));
                position = result.getString("position");
                if(result.getString("equity_percentage") != null){
                    equity_percentage = Integer.parseInt(result.getString("equity_percentage"));
                }else{
                    equity_percentage = 0;
                }
                contact_number = Integer.parseInt(result.getString("contact_number"));
                nationality = result.getString("nationality");
                if(profile_pic != null){
                    profilePic = profile_pic.getBytes(1, (int) profile_pic.length());
                }else{
                    profilePic = null;
                }
                //position, equity_percentage, contact_number, nationality
                u = new User(email, password, name, nric, joinedDate, profilePic, user_type, company_id, position, equity_percentage, contact_number, nationality);
                users.add(u);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return users;
    }
    
    public static ArrayList<User> getAllLightMentees(){
        ArrayList<User> users = new ArrayList<User>();
        User u = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String password = "";
        String name = "";
        String nric = "";
        Date joinedDate = null;
        Blob profile_pic = null;
        byte[] profilePic = null;
        String user_type = "";
        int company_id = 0;
        String position = "";
        int equity_percentage = 0;
        int contact_number = 0;
        String nationality = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from user where user_type = 'light_mentee';");
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                password = result.getString("password");
                name = result.getString("name");
                nric = result.getString("nric");
                joinedDate = result.getDate("joined_date");
                profile_pic = result.getBlob("profile_pic");
                user_type = result.getString("user_type");
                company_id = Integer.parseInt(result.getString("company_id"));
                position = result.getString("position");
                if(result.getString("equity_percentage") != null){
                    equity_percentage = Integer.parseInt(result.getString("equity_percentage"));
                }else{
                    equity_percentage = 0;
                }
                contact_number = Integer.parseInt(result.getString("contact_number"));
                nationality = result.getString("nationality");
                if(profile_pic != null){
                    profilePic = profile_pic.getBytes(1, (int) profile_pic.length());
                }else{
                    profilePic = null;
                }
                
                u = new User(email, password, name, nric, joinedDate, profilePic, user_type, company_id, position, equity_percentage, contact_number, nationality);
                users.add(u);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return users;
    }
    
    public static ArrayList<User> getAllRegularMentees(){
        ArrayList<User> users = new ArrayList<User>();
        User u = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String password = "";
        String name = "";
        String nric = "";
        Date joinedDate = null;
        Blob profile_pic = null;
        byte[] profilePic = null;
        String user_type = "";
        int company_id = 0;
        String position = "";
        int equity_percentage = 0;
        int contact_number = 0;
        String nationality = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from user where user_type = 'regular_mentee';");
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                password = result.getString("password");
                name = result.getString("name");
                nric = result.getString("nric");
                joinedDate = result.getDate("joined_date");
                profile_pic = result.getBlob("profile_pic");
                user_type = result.getString("user_type");
                company_id = Integer.parseInt(result.getString("company_id"));
                position = result.getString("position");
                if(result.getString("equity_percentage") != null){
                    equity_percentage = Integer.parseInt(result.getString("equity_percentage"));
                }else{
                    equity_percentage = 0;
                }
                contact_number = Integer.parseInt(result.getString("contact_number"));
                nationality = result.getString("nationality");
                if(profile_pic != null){
                    profilePic = profile_pic.getBytes(1, (int) profile_pic.length());
                }else{
                    profilePic = null;
                }
                
                u = new User(email, password, name, nric, joinedDate, profilePic, user_type, company_id, position, equity_percentage, contact_number, nationality);
                users.add(u);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return users;
    }
    
    public static User getUserByEmail(String parseEmail){
        System.out.println("USER IN DAO = "+parseEmail);
        User u = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";
        String password = "";
        String name = "";
        String nric = "";
        Date joinedDate = null;
        Blob profile_pic = null;
        byte[] profilePic = null;
        String user_type = "";
        int company_id = 0;
        String position = "";
        int equity_percentage = 0;
        int contact_number = 0;
        String nationality = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from user where email = ?;");
            stmt.setString(1, parseEmail);
            result = stmt.executeQuery();
            
            while (result.next()) {
                email = result.getString("email");
                password = result.getString("password");
                name = result.getString("name");
                nric = result.getString("nric");
                joinedDate = result.getDate("joined_date");
                profile_pic = result.getBlob("profile_pic");
                user_type = result.getString("user_type");
                company_id = Integer.parseInt(result.getString("company_id"));
                position = result.getString("position");
                if(result.getString("equity_percentage") != null){
                    equity_percentage = Integer.parseInt(result.getString("equity_percentage"));
                }else{
                    equity_percentage = 0;
                }
                contact_number = Integer.parseInt(result.getString("contact_number"));
                nationality = result.getString("nationality");
                
                if(profile_pic != null){
                    profilePic = profile_pic.getBytes(1, (int) profile_pic.length());
                }else{
                    profilePic = null;
                }
                
                u = new User(email, password, name, nric, joinedDate, profilePic, user_type, company_id, position, equity_percentage, contact_number, nationality);
            
            }
            //System.out.println("USER IN DAO CURRENT USER = "+u.getName());
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return u;
    }
    
    public static int editUser(User u){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        
        int result = 0;
        
        try {
            conn = ConnectionManager.getConnection();
            
            stmt = conn.prepareStatement("UPDATE user SET name = ?, nric = ?, joined_date = ?, profile_pic = ?, user_type = ?, company_id = ?, position = ?, equity_percentage = ?, contact_number = ?, nationality = ?  WHERE email = ?;");
            stmt.setString(1, u.getName());
            stmt.setString(2, u.getNric());
            
            Date joinedDate = u.getJoinedDate();
            java.sql.Date sqlDate = new java.sql.Date(joinedDate.getTime());
            stmt.setDate(3, sqlDate);
            
            if(u.getProfile_pic() != null){
                Blob blob = new SerialBlob(u.getProfile_pic());
            
                stmt.setBlob(4, blob);
            }else{
                stmt.setBlob(4, (Blob) null);
            }
            
            /*
            stmt.setString(4, u.getUser_type());
            stmt.setInt(5, u.getCompanyid());
            stmt.setString(6, u.getRole());
            stmt.setInt(7, u.getEquityPercentage());
            stmt.setInt(8, u.getContactNumber());
            stmt.setString(9, u.getNationality());
            stmt.setString(10, u.getEmail());
            */
            
            stmt.setString(5, u.getUser_type());
            stmt.setInt(6, u.getCompanyid());
            stmt.setString(7, u.getRole());
            stmt.setInt(8, u.getEquityPercentage());
            stmt.setInt(9, u.getContactNumber());
            stmt.setString(10, u.getNationality());
            stmt.setString(11, u.getEmail());
            
            
            result = stmt.executeUpdate();
            //task = new Task(taskName, desc, deadline, stage,companyID, isCompleted);
          
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }
    
    public static int addUser(User user){
        
        int status = 0;
        String email = user.getEmail();
        String password = user.getPassword();
        System.out.println("USERDAO ADD USER EMAIL: "+ email);
        System.out.println("USERDAO ADD USER PASSWORD: "+ password);
        String dbpwd = "";
        
        MessageDigest crypt = null;
        try {
            crypt = MessageDigest.getInstance("SHA-256");
            crypt.reset();
            crypt.update(password.getBytes("UTF-8"));
            //newly hash password
            dbpwd = new BigInteger(1, crypt.digest()).toString(16);
            System.out.println("HASHED PASSWORD IN USERDAO "+ dbpwd);

        } catch (UnsupportedEncodingException | NoSuchAlgorithmException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String name = user.getName();
        String nric = user.getNric();
        Date joinedDate = user.getJoinedDate();
        String user_type = user.getUser_type();
        byte[] profilePic = user.getProfile_pic();
        
        int company_id = user.getCompanyid();
        Blob blob = null;
        
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            
            //insert user to database
            stmt = conn.prepareStatement("Insert into user values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            //set email
            stmt.setString(1, email);

            //set password
            stmt.setString(2, dbpwd);

            //set name
            stmt.setString(3, name);

            //set nric
            stmt.setString(4, nric);
            
            //set joined date
            java.sql.Date sqlDate = new java.sql.Date(joinedDate.getTime());
            stmt.setDate(5, sqlDate);
            
            if(profilePic != null){
                blob = new SerialBlob(profilePic);
            
                stmt.setBlob(6, blob);
            }else{
                stmt.setBlob(6, (Blob) null);
            }
            
            //set user_type
            stmt.setString(7, user.getUser_type());
            
            //set company id
            stmt.setInt(8, user.getCompanyid());
            
            //set position
            stmt.setString(9, user.getRole());
            
            //set equity
            stmt.setInt(10, user.getEquityPercentage());
            
            //set contact
            stmt.setInt(11, user.getContactNumber());
            
            //set nationality
            stmt.setString(12, user.getNationality());
            
           
            status = stmt.executeUpdate();
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
        return status;
    }
    
    public static String updateUserPassword(String email, String password){
        String status = "";
        
        String dbpwd = "";
        
        MessageDigest crypt = null;
        try {
            crypt = MessageDigest.getInstance("SHA-256");
            crypt.reset();
            crypt.update(password.getBytes("UTF-8"));
            //newly hash password
            dbpwd = new BigInteger(1, crypt.digest()).toString(16);

        } catch (UnsupportedEncodingException | NoSuchAlgorithmException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            
            //insert user to database
            stmt = conn.prepareStatement("UPDATE user SET password = ? WHERE email = ?");

            //set password
            stmt.setString(1, dbpwd);

            //set email
            stmt.setString(2, email);

            int numRecordsUpdated = stmt.executeUpdate();
            
            if(numRecordsUpdated > 0){
                status = "Password has been changed!";
            }else{
                status = "An error occured, please try again!";
            }

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
        return status;
    }
    
    public static ArrayList<Integer> getAllMenteeCompanyIDs(){
        ArrayList<Integer> companyIDs = new ArrayList<Integer>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int company_id = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("SELECT DISTINCT `company_id` FROM `user` WHERE `user_type` = 'regular_mentee' OR `user_type` = 'light_mentee';");
            result = stmt.executeQuery();

            while (result.next()) {
                company_id = Integer.parseInt(result.getString("company_id"));
                companyIDs.add(company_id);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return companyIDs;
    }
    
    public static ArrayList<Integer> getLightCompanyIDs(){
        ArrayList<Integer> companyIDs = new ArrayList<Integer>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int company_id = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("SELECT DISTINCT `company_id` FROM `user` WHERE `user_type`= 'light_mentee';");
            result = stmt.executeQuery();

            while (result.next()) {
                company_id = Integer.parseInt(result.getString("company_id"));
                companyIDs.add(company_id);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return companyIDs;
        
    }
    
    public static ArrayList<Integer> getRegularCompanyIDs(){
        ArrayList<Integer> companyIDs = new ArrayList<Integer>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int company_id = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("SELECT DISTINCT `company_id` FROM `user` WHERE `user_type`= 'regular_mentee';");
            result = stmt.executeQuery();

            while (result.next()) {
                company_id = Integer.parseInt(result.getString("company_id"));
                companyIDs.add(company_id);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return companyIDs;
        
    }
    
    public static ArrayList<String> getUserEmailsOfCompany(int company_id){
        ArrayList<String> menteeEmails = new ArrayList<String>();
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String email = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select email from user where company_id = ?;");
            stmt.setInt(1, company_id);
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                menteeEmails.add(email);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return menteeEmails;
    }
    
    public static ArrayList<User> getShareholdersOfCompany(int company_id){
        ArrayList<User> shareholders = new ArrayList<User>();
        
        return shareholders;
    }
    
    public static boolean deleteUser(String email){
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int records = 0;
        
        
            try {
                conn = ConnectionManager.getConnection();
                stmt = conn.prepareStatement("DELETE * FROM `user` WHERE `email` = ?;");
                stmt.setString(1, email);
                
                records = stmt.executeUpdate();
                
                
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                ConnectionManager.close(conn, stmt, result);
            }
            if (records != 1){
            return false;
        }
        return true;
            
        
    }
    
    public static void main(String[] args){
       ArrayList<User> mentees = UserDAO.getAllMentors();
       System.out.println("test");
        for(User m: mentees){
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
        }
    }
    
}
