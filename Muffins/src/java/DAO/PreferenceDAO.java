/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.Preference;
import Utility.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;

/**
 *
 * @author Hui Min
 */
public class PreferenceDAO {
    public static ArrayList<Preference> getAllPreferences(){
        ArrayList<Preference> preferences = new ArrayList<Preference>();
        Preference p = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int company_id = 0;
        String mentor_email = "";
        String startDate = "";
        Date start_date = new Date();
        String endDate = "";
        Date end_date = new Date();
        String dateSent = "";
        Date date_sent = new Date();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from mentor_preference;");
            result = stmt.executeQuery();

            while (result.next()) {
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                startDate = result.getString("start_date");
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    start_date = dateformat.parse(startDate);
                }catch(ParseException e){
                    e.printStackTrace();
                } 
                endDate = result.getString("end_date");
                try {
                    end_date = dateformat.parse(endDate);
                }catch(ParseException e){
                    e.printStackTrace();
                } 
                dateSent = result.getString("date_sent");
                if(dateSent != null && !dateSent.isEmpty()){
                    try {
                        date_sent = dateformat.parse(dateSent);
                    }catch(ParseException e){
                        e.printStackTrace();
                    } 
                }else{
                    date_sent = null;
                }
                p = new Preference(company_id, mentor_email, start_date, end_date,date_sent);
                preferences.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(PreferenceDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return preferences;
    }
    
    public static Preference getPreference(int companyID, String mentorEmail){
        Preference p = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int company_id = 0;
        String mentor_email = "";
        String startDate = "";
        Date start_date = new Date();
        String endDate = "";
        Date end_date = new Date();
        String dateSent = "";
        Date date_sent = new Date();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from mentor_preference where company_id = ? AND mentor_email = ?;");
            stmt.setInt(1, companyID);
            stmt.setString(2, mentorEmail);
            result = stmt.executeQuery();
            
            while (result.next()) {
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                startDate = result.getString("start_date");
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    start_date = dateformat.parse(startDate);
                }catch(ParseException e){
                    e.printStackTrace();
                } 
                endDate = result.getString("end_date");
                try {
                    end_date = dateformat.parse(endDate);
                }catch(ParseException e){
                    e.printStackTrace();
                } 
                dateSent = result.getString("date_sent");
                if(dateSent != null && !dateSent.isEmpty()){
                    try {
                        date_sent = dateformat.parse(dateSent);
                    }catch(ParseException e){
                        e.printStackTrace();
                    } 
                }else{
                    date_sent = null;
                }
            }
            
            p = new Preference(company_id, mentor_email, start_date, end_date,date_sent);
        } catch (SQLException ex) {
            Logger.getLogger(PreferenceDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return p;
    }
    
    public static int addPreference(Preference p) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet count = null;
        int result = 0;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        try {
            conn = ConnectionManager.getConnection();
            
            stmt = conn.prepareStatement("INSERT INTO mentor_preference (company_id, mentor_email, start_date, end_date, date_sent)" + "VALUES (?, ?, ?, ?, ?);");
            stmt.setInt(1, p.getCompany_id());
            stmt.setString(2, p.getMentor_email());
            stmt.setString(3, df.format(p.getStart_date()));
            stmt.setString(4, df.format(p.getEnd_date()));
            stmt.setString(5, df.format(p.getDate_sent()));
            
            result = stmt.executeUpdate();
          
        } catch (SQLException ex) {
            Logger.getLogger(PreferenceDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, count);
        }
        
        return result;
    }
    
    public static boolean deletePreference(int companyID, String mentorEmail){
        Connection conn = null;
        int numRecordsUpdated = 0;
        
        PreparedStatement stmt0 = null;

        try {
            conn = ConnectionManager.getConnection();

            //check the number of bids made by the student
            stmt0 = conn.prepareStatement("DELETE FROM mentor_preference WHERE company_id = ? AND mentor_email = ?");
            stmt0.setInt(1, companyID);
            stmt0.setString(2, mentorEmail);

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
    
    public static ArrayList<Preference> getPreferencesOfCompany(int companyID){
        ArrayList<Preference> preferences = new ArrayList<Preference>();
        Preference p = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int company_id = 0;
        String mentor_email = "";
        String startDate = "";
        Date start_date = new Date();
        String endDate = "";
        Date end_date = new Date();
        String dateSent = "";
        Date date_sent = new Date();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from mentor_preference where company_id = ?;");
            stmt.setInt(1, companyID);
            result = stmt.executeQuery();
            
            while (result.next()) {
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                startDate = result.getString("start_date");
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    start_date = dateformat.parse(startDate);
                }catch(ParseException e){
                    e.printStackTrace();
                } 
                endDate = result.getString("end_date");
                try {
                    end_date = dateformat.parse(endDate);
                }catch(ParseException e){
                    e.printStackTrace();
                } 
                dateSent = result.getString("date_sent");
                if(dateSent != null && !dateSent.isEmpty()){
                    try {
                        date_sent = dateformat.parse(dateSent);
                    }catch(ParseException e){
                        e.printStackTrace();
                    } 
                }else{
                    date_sent = null;
                }
                
                p = new Preference(company_id, mentor_email, start_date, end_date,date_sent);
                preferences.add(p);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(PreferenceDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return preferences;
    }
    
    public static void main(String[] args){
        //Preference p = new Preference(5, "mentor3@hotmail.com", new Date(), new Date(), new Date());
//        boolean success = PreferenceDAO.deletePreference(5, "mentor3@hotmail.com");
//        System.out.println(success);
        ArrayList<Preference> preferences = PreferenceDAO.getPreferencesOfCompany(1);
        for(Preference p: preferences){
            System.out.println(p.getCompany_id());
            System.out.println(p.getMentor_email());
            System.out.println(p.getStart_date());
            System.out.println(p.getEnd_date());
            System.out.println(p.getDate_sent());
        }
    }
}
