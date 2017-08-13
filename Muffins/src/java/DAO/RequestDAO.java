/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.Request;
import Utility.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hui Min
 */
public class RequestDAO {
    //NOT DONE YET
    //to return Request object based on the requestID
    public static Request getRequestByRequestID(int requestID){
        Request r = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int request_id = 0;
        int company_id = 0;
        String mentor_email = "";
        String type = "";
        String admin_email = "";
        String status = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Relationship where rls_id = ?;");
            stmt.setInt(1, requestID);
            result = stmt.executeQuery();
            
            while (result.next()) {
                request_id = Integer.parseInt(result.getString("rls_id"));
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                type = result.getString("type");
                admin_email = result.getString("admin_email");
                status = result.getString("status");
            }
            
            r = new Request(request_id, company_id, mentor_email, type, admin_email, status);
        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return r;
    }
    
    //NOT DONE YET
    //to return all the Requests objects in the DB
    public static ArrayList<Request> getAllRequests(){
        ArrayList<Request> requests = new ArrayList<>();
        Request r = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int request_id = 0;
        int company_id = 0;
        String mentor_email = "";
        String type = "";
        String admin_email = "";
        String status = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Relationship;");
            result = stmt.executeQuery();

            while (result.next()) {
                request_id = Integer.parseInt(result.getString("rls_id"));
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                type = result.getString("type");
                admin_email = result.getString("admin_email");
                status = result.getString("status");
                r = new Request(request_id, company_id, mentor_email, type, admin_email, status);
                requests.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return requests;
    }
    
    //NOT DONE YET
    //to return all Requests for a specific Mentor based on mentor Email
    public static ArrayList<Request> getAllRequestsForMentor(String mentorEmail){
        ArrayList<Request> mentorRequests = new ArrayList<>();
        Request r = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int request_id = 0;
        int company_id = 0;
        String mentor_email = "";
        String type = "";
        String admin_email = "";
        String status = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Relationship where mentor_email = ?;");
            stmt.setString(1, mentorEmail);
            result = stmt.executeQuery();

            while (result.next()) {
                request_id = Integer.parseInt(result.getString("rls_id"));
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                type = result.getString("type");
                admin_email = result.getString("admin_email");
                status = result.getString("status");
                r = new Request(request_id, company_id, mentor_email, type, admin_email, status);
                mentorRequests.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return mentorRequests;
    }
    
    //NOT DONE YET
    //to return all Requests done by a Company based on Company ID
    public static ArrayList<Request> getRequestByCompany(int companyID){
        ArrayList<Request> requests = new ArrayList<>();
        Request r = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int request_id = 0;
        int company_id = 0;
        String mentor_email = "";
        String type = "";
        String admin_email = "";
        String status = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Relationship where company_id = ?;");
            stmt.setInt(1, companyID);
            result = stmt.executeQuery();

            while (result.next()) {
                request_id = Integer.parseInt(result.getString("rls_id"));
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                type = result.getString("type");
                admin_email = result.getString("admin_email");
                status = result.getString("status");
                r = new Request(request_id, company_id, mentor_email, type, admin_email, status);
                requests.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return requests;
    }
    
    //to return all Requests that involves a certain Admin based on Admin Email
    public static ArrayList<Request> getAllRequestsByAdmin(String adminEmail){
        ArrayList<Request> requests = new ArrayList<>();
        Request r = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int request_id = 0;
        int company_id = 0;
        String mentor_email = "";
        String type = "";
        String admin_email = "";
        String status = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Relationship where admin_email = ?;");
            stmt.setString(1, adminEmail);
            result = stmt.executeQuery();

            while (result.next()) {
                request_id = Integer.parseInt(result.getString("rls_id"));
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                type = result.getString("type");
                admin_email = result.getString("admin_email");
                status = result.getString("status");
                r = new Request(request_id, company_id, mentor_email, type, admin_email, status);
                requests.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return requests;
    }
    
    //to return all Requests that has a status of value of statusStr
    public static ArrayList<Request> getAllRequestsByStatus(String statusStr){
        ArrayList<Request> requests = new ArrayList<>();
        Request r = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int request_id = 0;
        int company_id = 0;
        String mentor_email = "";
        String type = "";
        String admin_email = "";
        String status = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Relationship where status = ?;");
            stmt.setString(1, statusStr);
            result = stmt.executeQuery();

            while (result.next()) {
                request_id = Integer.parseInt(result.getString("rls_id"));
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                type = result.getString("type");
                admin_email = result.getString("admin_email");
                status = result.getString("status");
                r = new Request(request_id, company_id, mentor_email, type, admin_email, status);
                requests.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return requests;
    }
    
    //to return all Requests that has a status of value of statusStr
    public static ArrayList<Request> getAllRequestsByType(String typeStr){
        ArrayList<Request> requests = new ArrayList<>();
        Request r = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int request_id = 0;
        int company_id = 0;
        String mentor_email = "";
        String type = "";
        String admin_email = "";
        String status = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Relationship where type = ?;");
            stmt.setString(1, typeStr);
            result = stmt.executeQuery();

            while (result.next()) {
                request_id = Integer.parseInt(result.getString("rls_id"));
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                type = result.getString("type");
                admin_email = result.getString("admin_email");
                status = result.getString("status");
                r = new Request(request_id, company_id, mentor_email, type, admin_email, status);
                requests.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return requests;
    }
    
        public static int addRequest(Request r){
        int result = 0;
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet count = null;
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("INSERT INTO relationship VALUES (?, ?, ?, ?, ?, ?);");
            stmt.setInt(1, r.getRequestID());
            stmt.setInt(2, r.getCompanyID());
            stmt.setString(3, r.getMentorEmail());
            stmt.setString(4, r.getType());
            stmt.setString(5, r.getAdminEmail());
            stmt.setString(6, r.getStatus());
            
            result = stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, count);
        }
        
        return result;
    }
    
    public static int updateRequest(int requestID, String status){
        int result = 0;
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("UPDATE relationship SET  admin_email = ?, status = ? WHERE rls_id = ?;");
            stmt.setString(1, "w@smu.edu.sg");
            stmt.setString(2, status);
            stmt.setInt(3, requestID);
            
            result = stmt.executeUpdate();
          
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }
    
    public static int getNextRequestID(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet count = null;
        int requestID = 0;
        
        try{
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select count(*) from relationship;");
            count = stmt.executeQuery();
            count.next();
            requestID = count.getInt(1)+1;
        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, count);
        }
        
        return requestID;
    }
    
    
    public static void main(String[] args){
        ArrayList<Request> requests = RequestDAO.getAllRequestsByType("open");
        for(Request r: requests){
            System.out.println(r.getRequestID());
            System.out.println(r.getCompanyID());
            System.out.println(r.getMentorEmail());        
            System.out.println(r.getType());
            System.out.println(r.getAdminEmail());
            System.out.println(r.getStatus());
        }
    }
}

