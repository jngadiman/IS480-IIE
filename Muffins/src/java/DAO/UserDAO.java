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
        Blob profile_pic = null;
        byte[] profilePic = null;
        String user_type = "";
        int company_id = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from User;");
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                password = result.getString("password");
                name = result.getString("name");
                nric = result.getString("nric");
                profile_pic = result.getBlob("profile_pic");
                user_type = result.getString("user_type");
                company_id = Integer.parseInt(result.getString("company_id"));
                
                if(profile_pic != null){
                    profilePic = profile_pic.getBytes(1, (int) profile_pic.length());
                }
                
                u = new User(email, password, name, nric, profilePic, user_type, company_id);
                users.add(u);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return users;
    }
    
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
        Blob profile_pic = null;
        byte[] profilePic = null;
        String user_type = "";
        int company_id = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from User where user_type = 'mentor';");
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                password = result.getString("password");
                name = result.getString("name");
                nric = result.getString("nric");
                profile_pic = result.getBlob("profile_pic");
                user_type = result.getString("user_type");
                company_id = Integer.parseInt(result.getString("company_id"));
                
                if(profile_pic != null){
                    profilePic = profile_pic.getBytes(1, (int) profile_pic.length());
                }
                
                u = new User(email, password, name, nric, profilePic, user_type, company_id);
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
        Blob profile_pic = null;
        byte[] profilePic = null;
        String user_type = "";
        int company_id = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from User where user_type = 'mentee';");
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                password = result.getString("password");
                name = result.getString("name");
                nric = result.getString("nric");
                profile_pic = result.getBlob("profile_pic");
                user_type = result.getString("user_type");
                company_id = Integer.parseInt(result.getString("company_id"));
                
                if(profile_pic != null){
                    profilePic = profile_pic.getBytes(1, (int) profile_pic.length());
                }
                
                u = new User(email, password, name, nric, profilePic, user_type, company_id);
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
        Blob profile_pic = null;
        byte[] profilePic = null;
        String user_type = "";
        int company_id = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from User where user_type = 'light_mentee';");
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                password = result.getString("password");
                name = result.getString("name");
                nric = result.getString("nric");
                profile_pic = result.getBlob("profile_pic");
                user_type = result.getString("user_type");
                company_id = Integer.parseInt(result.getString("company_id"));
                
                if(profile_pic != null){
                    profilePic = profile_pic.getBytes(1, (int) profile_pic.length());
                }
                
                u = new User(email, password, name, nric, profilePic, user_type, company_id);
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
        Blob profile_pic = null;
        byte[] profilePic = null;
        String user_type = "";
        int company_id = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from User where user_type = 'regular_mentee';");
            result = stmt.executeQuery();

            while (result.next()) {
                email = result.getString("email");
                password = result.getString("password");
                name = result.getString("name");
                nric = result.getString("nric");
                profile_pic = result.getBlob("profile_pic");
                user_type = result.getString("user_type");
                company_id = Integer.parseInt(result.getString("company_id"));
                
                if(profile_pic != null){
                    profilePic = profile_pic.getBytes(1, (int) profile_pic.length());
                }

                u = new User(email, password, name, nric, profilePic, user_type, company_id);
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
        Blob profile_pic = null;
        byte[] profilePic = null;
        String user_type = "";
        int company_id = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from User where email = ?;");
            stmt.setString(1, parseEmail);
            result = stmt.executeQuery();
            
            while (result.next()) {
                email = result.getString("email");
                password = result.getString("password");
                name = result.getString("name");
                nric = result.getString("nric");
                profile_pic = result.getBlob("profile_pic");
                user_type = result.getString("user_type");
                company_id = Integer.parseInt(result.getString("company_id"));
                
                if(profile_pic != null){
                profilePic = profile_pic.getBytes(1, (int) profile_pic.length());
                }
                u = new User(email, password, name, nric, profilePic, user_type, company_id);
            
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
            
            stmt = conn.prepareStatement("UPDATE User SET name = ?, nric = ?, profile_pic = ?, user_type = ?, company_id = ? WHERE email = ?;");
            stmt.setString(1, u.getName());
            stmt.setString(2, u.getNric());
            
            if(u.getProfile_pic() != null){
                Blob blob = new SerialBlob(u.getProfile_pic());
            
                stmt.setBlob(3, blob);
            }else{
                stmt.setBlob(3, (Blob) null);
            }
            
            stmt.setString(4, u.getUser_type());
            stmt.setInt(5, u.getCompanyid());
            stmt.setString(6, u.getEmail());
            
            result = stmt.executeUpdate();
            //task = new Task(taskName, desc, deadline, stage,companyID, isCompleted);
          
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }
    
    public static String addUser(User user){
        String status = "";
        
        String email = user.getEmail();
        String password = user.getPassword();
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
        
        String name = user.getName();
        String nric = user.getNric();
        String user_type = user.getUser_type();
        byte[] profilePic = user.getProfile_pic();
        
        int company_id = user.getCompanyid();
        Blob blob = null;
        
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            
            //insert user to database
            stmt = conn.prepareStatement("Insert into User values (?, ?, ?, ?, ?, ?, ?)");

            //set email
            stmt.setString(1, email);

            //set password
            stmt.setString(2, dbpwd);

            //set name
            stmt.setString(3, name);

            //set nric
            stmt.setString(4, nric);
            
            if(profilePic != null){
                blob = new SerialBlob(profilePic);
            
                stmt.setBlob(5, blob);
            }else{
                stmt.setBlob(5, (Blob) null);
            }
            
            //set user_type
            stmt.setString(6, user_type);
            
            //set company_id
            stmt.setInt(7, company_id);
            
            int numRecordsUpdated = stmt.executeUpdate();
            
            if(numRecordsUpdated == 1){
                status = "Success!";
            }else{
                status = "Fail!";
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
            stmt = conn.prepareStatement("UPDATE User SET password = ? WHERE email = ?");

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
            stmt = conn.prepareStatement("SELECT DISTINCT `company_id` FROM `User` WHERE `user_type`= 'light_mentee';");
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
            stmt = conn.prepareStatement("SELECT DISTINCT `company_id` FROM `User` WHERE `user_type`= 'regular_mentee';");
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
            stmt = conn.prepareStatement("select email from User where company_id = ?;");
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
    
    public static void main(String[] args){
       User u = new User("admin@smu.edu.sg", "password", "jiatung", "S3300328Y", null, "admin", 2);
       int result = UserDAO.editUser(u);
       System.out.println(result);
    }
    
}
