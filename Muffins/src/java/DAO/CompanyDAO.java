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
                if(result.getString("current_stage") == null){
                    c = new Company(company_id, company_name, company_description, vision, mission, industry, date);
                }else{
                    currentstage = Integer.parseInt(result.getString("current_stage"));
                    c = new Company(company_id, company_name, company_description, vision, mission, industry, date, currentstage);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return c;
    }

    public static ArrayList<Company> getAllCompanies(){
        ArrayList<Company> companies = new ArrayList<>();
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
                if(result.getString("current_stage") == null){
                    c = new Company(company_id, company_name, company_description, vision, mission, industry, date);
                }else{
                    currentstage = Integer.parseInt(result.getString("current_stage"));
                    c = new Company(company_id, company_name, company_description, vision, mission, industry, date, currentstage);
                }
                companies.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return companies;
    }

    public static ArrayList<Company> getLightCompanies(){

        ArrayList<Company> companies = new ArrayList<>();
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
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Company where current_stage IS NULL;");
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
                c = new Company(company_id, company_name, company_description, vision, mission, industry, date);
                companies.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return companies;
    }

    public static ArrayList<Company> getRegularCompanies(){
        ArrayList<Company> companies = new ArrayList<>();
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

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Company where current_stage IS NOT NULL;");
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
                currentstage = Integer.parseInt(result.getString("current_stage"));
                c = new Company(company_id, company_name, company_description, vision, mission, industry, date, currentstage);
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
        ArrayList<Company> companies = new ArrayList<>();
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
                currentstage = Integer.parseInt(result.getString("current_stage"));
                c = new Company(company_id, company_name, company_description, vision, mission, industry, date, currentstage);
                companies.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return companies;
    }
    
    public static void main(String[] args){
        Company c = CompanyDAO.getCompany(2);
        System.out.println(c.getId());
        System.out.println(c.getName());
        System.out.println(c.getDescription());
        System.out.println(c.getVision());
        System.out.println(c.getMission());
        System.out.println(c.getIndustry());
        System.out.println(c.getStartDate());
        System.out.println(c.getCurrentStage());
    }
}
