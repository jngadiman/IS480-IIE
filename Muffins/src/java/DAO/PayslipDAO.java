/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import CONTROLLER.companyController;
import CONTROLLER.mentorController;
import MODELS.Company;
import MODELS.Mentor;
import MODELS.Payslip;
import MODELS.Relationship;
import Utility.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JJAY
 */
public class PayslipDAO {
    
    public static int addPayslip(Payslip payslip) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet count = null;
        int result = 0;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        
        try {
            conn = ConnectionManager.getConnection();
            
            
            stmt = conn.prepareStatement("INSERT INTO payment_voucher VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
            stmt.setInt(1, payslip.getVoucherNumber());
            stmt.setString(2, payslip.getMentor_email());
            stmt.setInt(3, payslip.getMentee_company());
            stmt.setString(4, df.format(payslip.getStart_period()));
            stmt.setString(5, df.format(payslip.getEnd_period()));
            stmt.setString(6, payslip.getTypeOfPayment());
            stmt.setString(7, payslip.getMethodToDeliverCheque());
            stmt.setDouble(8, payslip.getAmount());
            stmt.setString(9, payslip.getCostCentre());
            stmt.setString(10, payslip.getGstTotalAmtPayable());
            stmt.setString(11, payslip.getInternalOrder());
            stmt.setString(12, payslip.getPath());
            result = stmt.executeUpdate();
          
            
        } catch (SQLException ex) {
            Logger.getLogger(PayslipDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, count);
        }
        return result;
    }
    
    public static Payslip getPayslip(int voucher_no) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        
        String mentor_email = "";
        int mentee_company = 0;
        Date start = null;
        Date end = null;        
        String payment_type = "";
        String delivery = "";
        double amount = 0;
        String cost_centre = "";
        String gst = "";
        String order = "";
        String voucher_path = "";
        
        Payslip payslip = null;
        
        try {
            conn = ConnectionManager.getConnection();
            
            
            stmt = conn.prepareStatement("SELECT * FROM payment_voucher WHERE voucher_no = ?;");
            stmt.setInt(1, voucher_no);
            
            result = stmt.executeQuery();
            
            while (result.next()){
                voucher_no = Integer.parseInt(result.getString("voucher_no"));
                mentor_email = result.getString("mentor_email");
                mentee_company = Integer.parseInt(result.getString("mentee_company_id"));
                String startDate = result.getString("start_period");
                String endDate = result.getString("end_period");
                if(startDate!=null && endDate!=null){
                    try {
                        start = df.parse(startDate);
                        end = df.parse(endDate);
                    }catch(ParseException e){
                        e.printStackTrace();
                    }
                }
                
//                payment_type = result.getString("payment_type");
//                delivery = result.getString("delivery");
                amount = Double.parseDouble(result.getString("amount"));
                voucher_path = result.getString("voucher_path");
//                cost_centre = result.getString("cost_centre");
//                gst = result.getString("gst");
//                order = result.getString("order");
//                Company c = companyController.getCompany(mentee_company);
//                String mentee_company_name = "";
//                if(c!=null){
//                    mentee_company_name = c.getName();
//                }
//                String eventName = "Business Mentorship Payment – ("+mentee_company_name+") for period "+startDate+" to "+endDate; 
//                String reason = "Business Mentorship Payment – ("+mentee_company_name+") for period "+startDate+" to "+endDate; 
                
                payslip = new Payslip(voucher_no, mentor_email, mentee_company, start,end, amount, voucher_path);
            }
            
            
            
          
            
        } catch (SQLException ex) {
            Logger.getLogger(PayslipDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return payslip;
    }
    
    public static ArrayList<Payslip> getPayslipsInMonthYear(int month, int year) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        LocalDate startMonth = YearMonth.of(year,month).atDay(1); //2015-12-01
        LocalDate endMonth = YearMonth.of(year,month).atEndOfMonth(); //2015-12-31
        
        Date startDate = java.sql.Date.valueOf(startMonth) ;
        Date endDate = java.sql.Date.valueOf(endMonth) ;
        
        int voucher_no = 0;
        String mentor_email = "";
        int mentee_company = 0;
        Date start = null;
        Date end = null;        
        
        double amount = 0;
        String voucher_path = "";
        
        
        ArrayList<Payslip> payslips = new ArrayList<Payslip>();
        
        try {
            conn = ConnectionManager.getConnection();
            
            
            stmt = conn.prepareStatement("SELECT * FROM payment_voucher WHERE start_period >= ? and end_period <= ?;");
            stmt.setString(1, df.format(startDate));
            stmt.setString(2, df.format(endDate));
            
            result = stmt.executeQuery();
            
            while (result.next()){
                voucher_no = Integer.parseInt(result.getString("voucher_no"));
                mentor_email = result.getString("mentor_email");
                mentee_company = Integer.parseInt(result.getString("mentee_company_id"));
                String start_period = result.getString("start_period");
                String end_period = result.getString("end_period");
                if(start_period!=null && end_period!=null){
                    try {
                        start = df.parse(start_period);
                        end = df.parse(end_period);
                    }catch(ParseException e){
                        e.printStackTrace();
                    }
                }
                amount = Double.parseDouble(result.getString("amount"));
                voucher_path = result.getString("voucher_path");
                Payslip payslip = new Payslip(voucher_no, mentor_email, mentee_company, start,end, amount, voucher_path);
                payslips.add(payslip);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(PayslipDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return payslips;
    }
    
    public static ArrayList<Payslip> getPayslipsOfMentorNCompany(String mentor, int company) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//        LocalDate startMonth = YearMonth.of(year,month).atDay(1); //2015-12-01
//        LocalDate endMonth = YearMonth.of(year,month).atEndOfMonth(); //2015-12-31
        
//        Date startDate = java.sql.Date.valueOf(startMonth) ;
//        Date endDate = java.sql.Date.valueOf(endMonth) ;
        
        int voucher_no = 0;
        String mentor_email = "";
        int mentee_company = 0;
        Date start = null;
        Date end = null;        
        
        double amount = 0;
        String voucher_path = "";
        
        
        ArrayList<Payslip> payslips = new ArrayList<Payslip>();
        
        try {
            conn = ConnectionManager.getConnection();
            
            
            stmt = conn.prepareStatement("SELECT * FROM payment_voucher WHERE mentor_email = ? and mentee_company_id = ?;");
            stmt.setString(1, mentor);
            stmt.setInt(2, company);
            
            result = stmt.executeQuery();
            
            while (result.next()){
                voucher_no = Integer.parseInt(result.getString("voucher_no"));
                mentor_email = result.getString("mentor_email");
                mentee_company = Integer.parseInt(result.getString("mentee_company_id"));
                String start_period = result.getString("start_period");
                String end_period = result.getString("end_period");
                if(start_period!=null && end_period!=null){
                    try {
                        start = df.parse(start_period);
                        end = df.parse(end_period);
                    }catch(ParseException e){
                        e.printStackTrace();
                    }
                }
                amount = Double.parseDouble(result.getString("amount"));
                voucher_path = result.getString("voucher_path");

                Payslip payslip = new Payslip(voucher_no, mentor_email, mentee_company, start,end, amount, voucher_path);
                payslips.add(payslip);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(PayslipDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return payslips;
    }
    
    public static void addVoucherPath(int voucher_id, String path){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet count = null;
        int result = 0;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        
        try {
            conn = ConnectionManager.getConnection();
            
            
            stmt = conn.prepareStatement("UPDATE payment_voucher SET voucher_path = ? WHERE voucher_no = ?;");
            stmt.setString(1, path);
            stmt.setInt(2, voucher_id);
            
            result = stmt.executeUpdate();
          
            
        } catch (SQLException ex) {
            Logger.getLogger(PayslipDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, count);
        }
       
    
    }
    
    public static int getLastPaymentVoucherID(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int voucher_no = 0;
        int next = 0;
        
        try{
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from payment_voucher order by voucher_no desc;");
            result = stmt.executeQuery();
            result.next();
            voucher_no = result.getInt("voucher_no");
            next = voucher_no+1;
        } catch (SQLException ex) {
            Logger.getLogger(PayslipDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return next;
    }
    
    
}
