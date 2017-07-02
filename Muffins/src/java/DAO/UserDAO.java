/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Utility.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import MODELS.User;
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
    
    public static void main(String[] args){
        User u = UserDAO.getUserByUsername("profKang");
            System.out.println(u.getUserName());
            System.out.println(u.getPassword());
            System.out.println(u.getName());
            System.out.println(u.getEmail());
            System.out.println(u.getNric());
            System.out.println(u.getUser_type());
    }
    
}
