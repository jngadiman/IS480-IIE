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
import MODELS.Company;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.lang.Object;
import java.sql.Blob;
import javax.sql.rowset.serial.SerialBlob;
/**
 *
 * @author Hui Min
 */
public class CompanyDAO {
    public static Company getCompany(int companyID){
        Company c = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int company_id = 0;
        String company_name = "";
        String company_description = "";
        String vision = "";
        String mission = "";
        String industry = "";
        String start_date = "";
        Blob company_logo = null;
        byte[] companyLogo = null;
        Date date = new Date();
        int currentstage = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Company where company_id = ?;");
            stmt.setInt(1, companyID);
            result = stmt.executeQuery();

            while (result.next()) {
                company_id = Integer.parseInt(result.getString("company_id"));
                company_name = result.getString("company_name");
                company_description = result.getString("company_description");
                vision = result.getString("vision");
                mission = result.getString("mission");
                industry = result.getString("industry");
                start_date = result.getString("start_date");  
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    date = dateformat.parse(start_date);
                }catch(ParseException e){
                    e.printStackTrace();
                }
                if(result.getString("current_stage") != null){
                    currentstage = Integer.parseInt(result.getString("current_stage"));
                }else{
                    currentstage = 0;
                }
                company_logo = result.getBlob("company_logo");
                if(company_logo != null){
                    companyLogo = company_logo.getBytes(1, (int) company_logo.length());
                }else{
                    companyLogo = null;
                }
                
                c = new Company(company_id, company_name, company_description, vision, mission, industry, date, currentstage, companyLogo);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return c;
    }

    public static ArrayList<Company> getAllCompanies(){
        ArrayList<Company> companies = new ArrayList<Company>();
        Company c = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int company_id = 0;
        String company_name = "";
        String company_description = "";
        String vision = "";
        String mission = "";
        String industry = "";
        String start_date = "";
        Date date = new Date();
        int currentstage = 0;
        Blob company_logo = null;
        byte[] companyLogo = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Company;");
            result = stmt.executeQuery();

            while (result.next()) {
                company_id = Integer.parseInt(result.getString("company_id"));
                company_name = result.getString("company_name");
                company_description = result.getString("company_description");
                vision = result.getString("vision");
                mission = result.getString("mission");
                industry = result.getString("industry");
                start_date = result.getString("start_date");  
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    date = dateformat.parse(start_date);
                }catch(ParseException e){
                    e.printStackTrace();
                }  
                if(result.getString("current_stage") != null){
                    currentstage = Integer.parseInt(result.getString("current_stage"));
                }else{
                    currentstage = 0;
                }
                company_logo = result.getBlob("company_logo");
                if(company_logo != null){
                    companyLogo = company_logo.getBytes(1, (int) company_logo.length());
                }else{
                    companyLogo = null;
                }
                
                c = new Company(company_id, company_name, company_description, vision, mission, industry, date, currentstage, companyLogo);
                companies.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return companies;
    }

    public static ArrayList<Company> getCompaniesInStage(int stage){
        ArrayList<Company> companies = new ArrayList<Company>();
        Company c = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int company_id = 0;
        String company_name = "";
        String company_description = "";
        String vision = "";
        String mission = "";
        String industry = "";
        String start_date = "";
        Date date = new Date();
        int currentstage = 0;
        Blob company_logo = null;
        byte[] companyLogo = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Company where current_stage = ?;");
            stmt.setInt(1, stage);
            result = stmt.executeQuery();

            while (result.next()) {
                company_id = Integer.parseInt(result.getString("company_id"));
                company_name = result.getString("company_name");
                company_description = result.getString("company_description");
                vision = result.getString("vision");
                mission = result.getString("mission");
                industry = result.getString("industry");
                start_date = result.getString("start_date");  
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    date = dateformat.parse(start_date);
                }catch(ParseException e){
                    e.printStackTrace();
                } 
                if(result.getString("current_stage") != null){
                    currentstage = Integer.parseInt(result.getString("current_stage"));
                }else{
                    currentstage = 0;
                }
                company_logo = result.getBlob("company_logo");
                if(company_logo != null){
                    companyLogo = company_logo.getBytes(1, (int) company_logo.length());
                }else{
                    companyLogo = null;
                }
                        
                c = new Company(company_id, company_name, company_description, vision, mission, industry, date, currentstage, companyLogo);
                companies.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return companies;
    }
    
    public static ArrayList<String> getAllCompanyNames(ArrayList<Integer> companyIDs){
        ArrayList<String> companyNames = new ArrayList<String>();
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int company_id = 0;
        String company_name = "";
        
        for(Integer i: companyIDs){
            try {
                conn = ConnectionManager.getConnection();
                stmt = conn.prepareStatement("SELECT `company_name` FROM `Company` WHERE `company_id` = ? ");
                stmt.setInt(1, i);
                result = stmt.executeQuery();

                while (result.next()) {
                    company_name = result.getString("company_name");
                    companyNames.add(company_name);
                }

            } catch (SQLException ex) {
                Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                ConnectionManager.close(conn, stmt, result);
            }
        }
        return companyNames;
    }
    
    public static int editCompanyDetails(Company c){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        
        int result = 0;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        try {
            conn = ConnectionManager.getConnection();
            
            String status = "";
            
            stmt = conn.prepareStatement("UPDATE Company SET  company_name = ?, company_description = ?, vision = ?, mission = ?, industry = ?, start_date = ?, current_stage = ?, company_logo = ? WHERE company_id = ?;");
            stmt.setString(1, c.getName());
            stmt.setString(2, c.getDescription());
            stmt.setString(3, c.getVision());
            stmt.setString(4, c.getMission());
            stmt.setString(5, c.getIndustry());
            stmt.setString(6, df.format(c.getStartDate()));
            stmt.setInt(7, c.getCurrentStage());
            
            if(c.getCompanyLogo() != null){
                //convert byte[] to Blob object before putting into db
                Blob blob = new SerialBlob(c.getCompanyLogo());

                stmt.setBlob(8, blob);
            }else{
                stmt.setBlob(8, (Blob) null);
            }   
            
            stmt.setInt(9, c.getId());
            
            
            result = stmt.executeUpdate();
            //task = new Task(taskName, desc, deadline, stage,companyID, isCompleted);
          
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }
    
    public static String addCompany(Company c){
        String status = "";
        
        int id = c.getId();
        String name = c.getName();
        String description = c.getDescription();
        String vision = c.getVision();
        String mission = c.getMission();
        String industry = c.getIndustry();
        Date start_date = c.getStartDate();
        int current_stage = c.getCurrentStage();
        byte[] companyLogo = c.getCompanyLogo();
        
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            
            //insert company to database
            stmt = conn.prepareStatement("Insert into Company values (?, ?, ?, ?, ?, ?, ?, ?, ?)");

            //set id
            stmt.setInt(1, id);

            //set name
            stmt.setString(2, name);

            //set description
            stmt.setString(3, description);

            //set vision
            stmt.setString(4, vision);
            
            //set mission
            stmt.setString(5, mission);
            
            //set industry
            stmt.setString(6, industry);
            
            //set start_date
            stmt.setString(7, df.format(start_date));
            
            //set current_stage
            stmt.setInt(8, current_stage);
            
            if(companyLogo != null){
                //convert byte[] to Blob object before putting into db
                Blob blob = new SerialBlob(companyLogo);

                stmt.setBlob(9, blob);
            }else{
                stmt.setBlob(9, (Blob) null);
            }   
            
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
    
    public static int getNextCompanyID(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet count = null;
        int companyID = 0;
        
        try{
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select count(*) from company;");
            count = stmt.executeQuery();
            count.next();
            companyID = count.getInt(1)+1;
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, count);
        }
        
        return companyID;
    }
    
    public static void main(String[] args){
        Date startDate = new Date();
        Company c = new Company(8, "cheers", "sells food", "to be able to sell food everywhere", "to bring you the best quality foods to you", "FnB", startDate, 2, null);
        String result = CompanyDAO.addCompany(c);
        System.out.println(result);
    }
}
