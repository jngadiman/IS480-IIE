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
/**
 *
 * @author Hui Min
 */
public class UserDAO {
    public static ArrayList<User> getAllUsers(){
        ArrayList<User> users = new ArrayList<>();
        User u = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String username = "";
        String password = "";
        String name = "";
        String email = "";
        String nric = "";
        String user_type = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from User;");
            result = stmt.executeQuery();

            while (result.next()) {
                username = result.getString("username");
                password = result.getString("password");
                name = result.getString("name");
                email = result.getString("email");
                nric = result.getString("nric");
                user_type = result.getString("user_type");
                u = new User(username, password, name, email, nric, user_type);
                users.add(u);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return users;
    }
    
    public static ArrayList<User> getAllMentors(){
        ArrayList<User> users = new ArrayList<>();
        User u = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String username = "";
        String password = "";
        String name = "";
        String email = "";
        String nric = "";
        String user_type = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from User where user_type = 'mentor';");
            result = stmt.executeQuery();

            while (result.next()) {
                username = result.getString("username");
                password = result.getString("password");
                name = result.getString("name");
                email = result.getString("email");
                nric = result.getString("nric");
                user_type = result.getString("user_type");
                u = new User(username, password, name, email, nric, user_type);
                users.add(u);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return users;
    }
    
    public static ArrayList<User> getAllMentees(){
        ArrayList<User> users = new ArrayList<>();
        User u = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String username = "";
        String password = "";
        String name = "";
        String email = "";
        String nric = "";
        String user_type = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from User where user_type = 'light_mentee' OR user_type = 'regular_mentee';");
            result = stmt.executeQuery();

            while (result.next()) {
                username = result.getString("username");
                password = result.getString("password");
                name = result.getString("name");
                email = result.getString("email");
                nric = result.getString("nric");
                user_type = result.getString("user_type");
                u = new User(username, password, name, email, nric, user_type);
                users.add(u);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return users;
    }
    
    public static ArrayList<User> getAllLightMentees(){
        ArrayList<User> users = new ArrayList<>();
        User u = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String username = "";
        String password = "";
        String name = "";
        String email = "";
        String nric = "";
        String user_type = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from User where user_type = 'light_mentee';");
            result = stmt.executeQuery();

            while (result.next()) {
                username = result.getString("username");
                password = result.getString("password");
                name = result.getString("name");
                email = result.getString("email");
                nric = result.getString("nric");
                user_type = result.getString("user_type");
                u = new User(username, password, name, email, nric, user_type);
                users.add(u);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return users;
    }
    
    public static ArrayList<User> getAllRegularMentees(){
        ArrayList<User> users = new ArrayList<>();
        User u = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String username = "";
        String password = "";
        String name = "";
        String email = "";
        String nric = "";
        String user_type = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from User where user_type = 'regular_mentee';");
            result = stmt.executeQuery();

            while (result.next()) {
                username = result.getString("username");
                password = result.getString("password");
                name = result.getString("name");
                email = result.getString("email");
                nric = result.getString("nric");
                user_type = result.getString("user_type");
                u = new User(username, password, name, email, nric, user_type);
                users.add(u);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return users;
    }
    
    public static User getUserByUsername(String userName){
        User u = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String username = "";
        String password = "";
        String name = "";
        String email = "";
        String nric = "";
        String user_type = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from User where username = ?;");
            stmt.setString(1, userName);
            result = stmt.executeQuery();

            while (result.next()) {
                username = result.getString("username");
                password = result.getString("password");
                name = result.getString("name");
                email = result.getString("email");
                nric = result.getString("nric");
                user_type = result.getString("user_type");
            }
            
            u = new User(username, password, name, email, nric, user_type);

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return u;
    }
    
    public static User getUserByEmail(String parseEmail){
        System.out.println("USER IN DAO = "+parseEmail);
        User u = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String username = "";
        String password = "";
        String email = "";
        String name = "";
        String nric = "";
        String user_type = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from User where email = ?;");
            stmt.setString(1, parseEmail);
            result = stmt.executeQuery();
            
            while (result.next()) {
                username = result.getString("username");
                password = result.getString("password");
                name = result.getString("name");
                email = result.getString("email");
                nric = result.getString("nric");
                user_type = result.getString("user_type");
            }
            
            u = new User(username, password, name, email, nric, user_type);
            System.out.println("USER IN DAO CURRENT USER = "+u.getName());
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return u;
    }
    
    public static String addUser(User user){
        String status = "";
        
        String userName = user.getUserName();
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
        String email = user.getEmail();
        String nric = user.getNric();
        String user_type = user.getUser_type();
        
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            
            //insert user to database
            stmt = conn.prepareStatement("Insert into User values (?, ?, ?, ?, ?, ?)");

            //set username
            stmt.setString(1, userName);

            //set password
            stmt.setString(2, dbpwd);

            //set name
            stmt.setString(3, name);

            //set email
            stmt.setString(4, email);
            
            //set email
            stmt.setString(5, nric);
            
            //set email
            stmt.setString(6, user_type);
            
            int numRecordsUpdated = stmt.executeUpdate();
            
            if(numRecordsUpdated > 0){
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
                status = "Password is updated!";
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


    
    public static void main(String[] args){
        Date startDate = new Date();
        Company company = new Company(3, "Mcdonalds", "sells fast food", "to be able to be a top notch fast food company", "to be happiness to our customers", "FnB", startDate);
        User u = new User("hello", "1234", "hello", "hello@hotmail.com", "S9272235Y", "light_mentee", company);
        String status = UserDAO.addUser(u);
        
    }
    
}
