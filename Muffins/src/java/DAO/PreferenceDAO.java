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
        String need = "";
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
                
                if(startDate != null && !startDate.isEmpty()){
                    try {
                        start_date = dateformat.parse(startDate);
                    }catch(ParseException e){
                        e.printStackTrace();
                    } 
                }else{
                    start_date = null;
                }
                
                endDate = result.getString("end_date");
                if(endDate != null && !endDate.isEmpty()){
                    try {
                        end_date = dateformat.parse(endDate);
                    }catch(ParseException e){
                        e.printStackTrace();
                    } 
                }else{
                    end_date = null;
                }
                
                need = result.getString("reason");
                
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
                p = new Preference(company_id, mentor_email, start_date, end_date, need, date_sent);
                preferences.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(PreferenceDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return preferences;
    }
    
    public static ArrayList<Preference> getUnApprovedPreferences(){
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
        String need = "";
        String dateSent = "";
        Date date_sent = new Date();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from mentor_preference WHERE `start_date` IS NULL AND `end_date` IS NULL;");
            result = stmt.executeQuery();

            while (result.next()) {
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                startDate = result.getString("start_date");
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                
                if(startDate != null && !startDate.isEmpty()){
                    try {
                        start_date = dateformat.parse(startDate);
                    }catch(ParseException e){
                        e.printStackTrace();
                    } 
                }else{
                    start_date = null;
                }
                
                endDate = result.getString("end_date");
                if(endDate != null && !endDate.isEmpty()){
                    try {
                        end_date = dateformat.parse(endDate);
                    }catch(ParseException e){
                        e.printStackTrace();
                    } 
                }else{
                    end_date = null;
                }
                
                need = result.getString("reason");
                
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
                p = new Preference(company_id, mentor_email, start_date, end_date, need, date_sent);
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
        String need = "";
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
                if(startDate != null && !startDate.isEmpty()){
                    try {
                        start_date = dateformat.parse(startDate);
                    }catch(ParseException e){
                        e.printStackTrace();
                    } 
                }else{
                    start_date = null;
                }
                
                endDate = result.getString("end_date");
                if(endDate != null && !endDate.isEmpty()){
                    try {
                        end_date = dateformat.parse(endDate);
                    }catch(ParseException e){
                        e.printStackTrace();
                    } 
                }else{
                    end_date = null;
                }
                
                need = result.getString("reason");
                
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
                
                p = new Preference(company_id, mentor_email, start_date, end_date, need, date_sent);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PreferenceDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return p;
    }
    
    public static Preference getPreferenceByCompany(int companyID){
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
        String need = "";
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
                if(startDate != null && !startDate.isEmpty()){
                    try {
                        start_date = dateformat.parse(startDate);
                    }catch(ParseException e){
                        e.printStackTrace();
                    } 
                }else{
                    start_date = null;
                }
                
                endDate = result.getString("end_date");
                if(endDate != null && !endDate.isEmpty()){
                    try {
                        end_date = dateformat.parse(endDate);
                    }catch(ParseException e){
                        e.printStackTrace();
                    } 
                }else{
                    end_date = null;
                }
                
                need = result.getString("reason");
                
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
                
                p = new Preference(company_id, mentor_email, start_date, end_date, need, date_sent);
            }
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
            
            stmt = conn.prepareStatement("INSERT INTO mentor_preference (company_id, mentor_email, start_date, end_date, reason, date_sent)" + "VALUES (?, ?, ?, ?, ?, ?);");
            stmt.setInt(1, p.getCompanyID());
            stmt.setString(2, p.getMentorEmail());
            
            if(p.getStartDate() != null){
                stmt.setString(3, df.format(p.getStartDate()));
            }else{
                stmt.setString(3, null);
            }
            
            if(p.getEndDate() != null){
                stmt.setString(4, df.format(p.getEndDate()));
            }else{
                stmt.setString(4, null);
            }
            
            stmt.setString(5, p.getNeed());
            
            if(p.getDate_sent() != null){
                stmt.setString(6, df.format(p.getDate_sent()));
            }else{
                stmt.setString(6, null);
            }
            
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
    
    public static int editPreference(Preference p) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        int result = 0;
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
        
        try {
            conn = ConnectionManager.getConnection();
            
            
            stmt = conn.prepareStatement("UPDATE mentor_preference SET  mentor_email = ?, start_date = ?, end_date = ?, reason = ?, date_sent = ? WHERE company_id = ?;");
            stmt.setString(1, p.getMentorEmail());
            if(p.getStartDate() != null){
                stmt.setString(2, df.format(p.getStartDate()));
            }else{
                stmt.setString(2, null);
            }
            if(p.getEndDate() != null){
                stmt.setString(3, df.format(p.getEndDate()));
            }else{
                stmt.setString(3, null);
            }
            stmt.setString(4, p.getNeed());
            
            if(p.getDate_sent() != null){
                stmt.setString(5, df.format(p.getDate_sent()));
            }else{
                stmt.setString(5, null);
            }
            stmt.setInt(6, p.getCompanyID());
            
            result = stmt.executeUpdate();
            //task = new Task(taskName, desc, deadline, stage,companyID, isCompleted);
          
        } catch (SQLException ex) {
            Logger.getLogger(PreferenceDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
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
        String need = "";
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
                if(startDate != null && !startDate.isEmpty()){
                    try {
                        start_date = dateformat.parse(startDate);
                    }catch(ParseException e){
                        e.printStackTrace();
                    } 
                }else{
                    start_date = null;
                }
                
                endDate = result.getString("end_date");
                if(endDate != null && !endDate.isEmpty()){
                    try {
                        end_date = dateformat.parse(endDate);
                    }catch(ParseException e){
                        e.printStackTrace();
                    } 
                }else{
                    end_date = null;
                }
                
                need = result.getString("reason");
                
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
                
                p = new Preference(company_id, mentor_email, start_date, end_date, need, date_sent);
                preferences.add(p);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(PreferenceDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return preferences;
    }
    
    public static ArrayList<Integer> getAllCompanyIDsWPreference(){
        ArrayList<Integer> companyIDs = new ArrayList<Integer>(); 
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int company_id = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select company_id from mentor_preference order by company_id asc;");
            result = stmt.executeQuery();
            
            while (result.next()) {
                company_id = Integer.parseInt(result.getString("company_id"));
                companyIDs.add(company_id);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(PreferenceDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return companyIDs;
    }
            
    public static void main(String[] args){
//        Preference p = new Preference(5, "mentor3@hotmail.com", new Date(), new Date(), "Refine Revenue Model only", new Date());
//        int success = PreferenceDAO.editPreference(p);
//        System.out.println(success);
//        ArrayList<Preference> preferences = PreferenceDAO.getUnApprovedPreferences();
//        for(Preference p: preferences){
            Preference p = PreferenceDAO.getPreferenceByCompany(7);
            System.out.println(p.getCompanyID());
            System.out.println(p.getMentorEmail());
            System.out.println(p.getStartDate());
            System.out.println(p.getEndDate());
            System.out.println(p.getNeed());
            System.out.println(p.getDate_sent());
//        }
//        ArrayList<Integer> companyIDs = PreferenceDAO.getAllCompanyIDsWPreference();
//        for(Integer i: companyIDs){
//            System.out.println(i);
//        }
    }
}
