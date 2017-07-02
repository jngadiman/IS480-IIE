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
/**
 *
 * @author Hui Min
 */
public class CompanyDAO {
    public static Company getCompany(String companyID){
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
        Date startDate = new Date();
        int currentstage = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Company where company_id = ?;");
            stmt.setString(1, companyID);
            result = stmt.executeQuery();

            while (result.next()) {
                company_id = Integer.parseInt(result.getString("company_id"));
                company_name = result.getString("company_name");
                company_description = result.getString("company_description");
                vision = result.getString("vision");
                mission = result.getString("mission");
                industry = result.getString("industry");
                start_date = result.getString("start_date");  
                try{
                    DateFormat format = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH);
                    startDate = format.parse(start_date);
                }catch(ParseException e){
                    e.printStackTrace();
                }  
                currentstage = Integer.parseInt(result.getString("current_stage"));
            }
                        c = new Company(company_id, company_name, company_description, vision, mission, industry, startDate, currentstage);

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
        Date startDate = new Date();
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
                try{
                    DateFormat format = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH);
                    startDate = format.parse(start_date);
                }catch(ParseException e){
                    e.printStackTrace();
                }
                currentstage = Integer.parseInt(result.getString("current_stage"));

                c = new Company(company_id, company_name, company_description, vision, mission, industry, startDate, currentstage);
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
        Date startDate = new Date();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Company where current_stage = null;");
            result = stmt.executeQuery();

            while (result.next()) {
                company_id = Integer.parseInt(result.getString("company_id"));
                company_name = result.getString("company_name");
                company_description = result.getString("company_description");
                vision = result.getString("vision");
                mission = result.getString("mission");
                industry = result.getString("industry");
                start_date = result.getString("start_date");  
                try{
                    DateFormat format = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH);
                    startDate = format.parse(start_date);
                }catch(ParseException e){
                    e.printStackTrace();
                }  
                c = new Company(company_id, company_name, company_description, vision, mission, industry, startDate);
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
        Date startDate = new Date();
        int currentstage = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Company where current_stage != null;");
            result = stmt.executeQuery();

            while (result.next()) {
                company_id = Integer.parseInt(result.getString("company_id"));
                company_name = result.getString("company_name");
                company_description = result.getString("company_description");
                vision = result.getString("vision");
                mission = result.getString("mission");
                industry = result.getString("industry");
                start_date = result.getString("start_date");  
                try{
                    DateFormat format = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH);
                    startDate = format.parse(start_date);
                }catch(ParseException e){
                    e.printStackTrace();
                }
                currentstage = Integer.parseInt(result.getString("current_stage"));
                c = new Company(company_id, company_name, company_description, vision, mission, industry, startDate, currentstage);
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
        Date startDate = new Date();
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
                try{
                    DateFormat format = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH);
                    startDate = format.parse(start_date);
                }catch(ParseException e){
                    e.printStackTrace();
                } 
                currentstage = Integer.parseInt(result.getString("current_stage"));
                c = new Company(company_id, company_name, company_description, vision, mission, industry, startDate, currentstage);
                companies.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return companies;
    }
}
