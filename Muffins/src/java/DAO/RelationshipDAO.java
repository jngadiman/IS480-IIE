/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.Relationship;
import Utility.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hui Min
 */
public class RelationshipDAO {
    
    //to return Relationship object based on the rlsID
    public static Relationship getRelationship(int rlsID){
        Relationship r = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        
        int company_id = 0;
        String mentor_email = "";
        String type = "";
        Date start = null;
        Date end = null;
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                
        String status = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Relationship where rls_id = ?;");
            stmt.setInt(1, rlsID);
            result = stmt.executeQuery();
            
            while (result.next()) {
                
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                type = result.getString("type");
                
                String start_date =result.getString("start_date");
                String end_date =result.getString("end_date");
                if(start_date!=null && end_date!=null){
                    try {
                        start = dateformat.parse(start_date);
                        end = dateformat.parse(end_date);
                    }catch(ParseException e){
                        e.printStackTrace();
                    }
                }
                
                status = result.getString("status");
                
            }
            
            r = new Relationship(rlsID, company_id, mentor_email, type, start, end, status);
        } catch (SQLException ex) {
            Logger.getLogger(RelationshipDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return r;
    }
    
    //NOT DONE YET
    //to return all the Relationship objects in the DB
    public static ArrayList<Relationship> getAllRelationships(){
        ArrayList<Relationship> relationships = new ArrayList<Relationship>();
        Relationship r = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int rlsID = 0;
        int company_id = 0;
        String mentor_email = "";
        String type = "";
        String admin_email = "";
        String status = "";
        
        Date start = null;
        Date end = null;
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Relationship;");
            result = stmt.executeQuery();

            while (result.next()) {
                rlsID = Integer.parseInt(result.getString("rls_id"));
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                type = result.getString("type");
                String start_date =result.getString("start_date");
                String end_date =result.getString("end_date");
                if(start_date!=null && end_date!=null){
                    try {
                        start = dateformat.parse(start_date);
                        end = dateformat.parse(end_date);
                    }catch(ParseException e){
                        e.printStackTrace();
                    }
                }
                
                status = result.getString("status");
                r = new Relationship(rlsID, company_id, mentor_email, type, start, end, status);
                relationships.add(r);
            }
            
            

        } catch (SQLException ex) {
            Logger.getLogger(RelationshipDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return relationships;
    }
    
    
    //to return all Relationships for a specific Mentor based on mentor Email
    public static ArrayList<Relationship> getAllRelationshipsForMentor(String mentorEmail){
        ArrayList<Relationship> mentorRequests = new ArrayList<Relationship>();
        Relationship r = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int rlsID = 0;
        int company_id = 0;
        String mentor_email = "";
        String type = "";
        String admin_email = "";
        String status = "";
        Date start = null;
        Date end = null;
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Relationship where mentor_email = ?;");
            stmt.setString(1, mentorEmail);
            result = stmt.executeQuery();

            while (result.next()) {
                rlsID = Integer.parseInt(result.getString("rls_id"));
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                type = result.getString("type");
                String start_date =result.getString("start_date");
                String end_date =result.getString("end_date");
                if(start_date!=null && end_date!=null){
                    try {
                        start = dateformat.parse(start_date);
                        end = dateformat.parse(end_date);
                    }catch(ParseException e){
                        e.printStackTrace();
                    }
                }
                
                status = result.getString("status");
                r = new Relationship(rlsID, company_id, mentor_email, type, start, end, status);
                mentorRequests.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RelationshipDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return mentorRequests;
    }
    
    
    //to return all Relationships of a Company based on Company ID
    public static ArrayList<Relationship> getRelationshipsByCompany(int companyID){
        ArrayList<Relationship> relationships = new ArrayList<Relationship>();
        Relationship r = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int rlsID = 0;
        int company_id = 0;
        String mentor_email = "";
        String type = "";
        String admin_email = "";
        String status = "";
        Date start = null;
        Date end = null;
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Relationship where company_id = ?;");
            stmt.setInt(1, companyID);
            result = stmt.executeQuery();

            while (result.next()) {
                rlsID = Integer.parseInt(result.getString("rls_id"));
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                type = result.getString("type");
                String start_date =result.getString("start_date");
                String end_date =result.getString("end_date");
                if(start_date!=null && end_date!=null){
                    try {
                        start = dateformat.parse(start_date);
                        end = dateformat.parse(end_date);
                    }catch(ParseException e){
                        e.printStackTrace();
                    }
                }
                
                status = result.getString("status");
                r = new Relationship(rlsID, company_id, mentor_email, type, start, end, status);
                relationships.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RelationshipDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return relationships;
    }
    
    //to return all Requests that has a status of value of statusStr
    public static ArrayList<Relationship> getAllRelationshipsByStatus(String statusStr){
        ArrayList<Relationship> relationships = new ArrayList<Relationship>();
        Relationship r = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int rlsID = 0;
        int company_id = 0;
        String mentor_email = "";
        String type = "";
        String admin_email = "";
        String status = "";
        Date start = null;
        Date end = null;
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Relationship where status = ?;");
            stmt.setString(1, statusStr);
            result = stmt.executeQuery();

            while (result.next()) {
                rlsID = Integer.parseInt(result.getString("rls_id"));
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                type = result.getString("type");
                String start_date =result.getString("start_date");
                String end_date =result.getString("end_date");
                if(start_date!=null && end_date!=null){
                    try {
                        start = dateformat.parse(start_date);
                        end = dateformat.parse(end_date);
                    }catch(ParseException e){
                        e.printStackTrace();
                    }
                }
                
                status = result.getString("status");
                r = new Relationship(rlsID, company_id, mentor_email, type, start, end, status);
                relationships.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RelationshipDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return relationships;
    }
    
    //to return all Requests that has a status of value of statusStr
    public static ArrayList<Relationship> getAllRequestsByType(String typeStr){
        ArrayList<Relationship> relationships = new ArrayList<Relationship>();
        Relationship r = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int rlsID = 0;
        int company_id = 0;
        String mentor_email = "";
        String type = "";
        String admin_email = "";
        String status = "";
        Date start = null;
        Date end = null;
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Relationship where type = ?;");
            stmt.setString(1, typeStr);
            result = stmt.executeQuery();

            while (result.next()) {
                rlsID = Integer.parseInt(result.getString("rls_id"));
                company_id = Integer.parseInt(result.getString("company_id"));
                mentor_email = result.getString("mentor_email");
                type = result.getString("type");
                String start_date =result.getString("start_date");
                String end_date =result.getString("end_date");
                if(start_date!=null && end_date!=null){
                    try {
                        start = dateformat.parse(start_date);
                        end = dateformat.parse(end_date);
                    }catch(ParseException e){
                        e.printStackTrace();
                    }
                }
                
                status = result.getString("status");
                r = new Relationship(rlsID, company_id, mentor_email, type, start, end, status);
                relationships.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RelationshipDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return relationships;
    }
    
        public static int addRelationship(Relationship r){
        int result = 0;
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet count = null;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("INSERT INTO relationship VALUES (?, ?, ?, ?, ?, ?, ?);");
            stmt.setInt(1, r.getRelationshipID());
            stmt.setInt(2, r.getCompanyID());
            stmt.setString(3, r.getMentorEmail());
            stmt.setString(4, r.getType());
            stmt.setString(5, df.format(r.getStart_date()));
            stmt.setString(6, df.format(r.getEnd_date()));
            stmt.setString(7, r.getStatus());
            
            result = stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RelationshipDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, count);
        }
        
        return result;
    }
    
    public static int changeRelationshipStatus(int rlsID, String status){
        int result = 0;
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("UPDATE relationship SET status = ? WHERE rls_id = ?;");
            stmt.setString(1, status);
            stmt.setInt(2, rlsID);
            
            result = stmt.executeUpdate();
          
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }
    
    public static boolean deleteRelationshipByID(int rlsID){
        
        if (rlsID == 0) {
            return false;
        }

        Connection conn = null;
        int numRecordsUpdated = 0;
        
        PreparedStatement stmt0 = null;

        try {
            conn = ConnectionManager.getConnection();

            //check the number of bids made by the student
            stmt0 = conn.prepareStatement("DELETE FROM relationship WHERE rls_id = ?");
            stmt0.setInt(1, rlsID);

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

    public static int getNextRelationshipID(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int rlsID = 0;
        int next = 0;
        
        try{
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from relationship order by rls_id desc;");
            result = stmt.executeQuery();
            result.next();
            rlsID = result.getInt("rls_id");
            next = rlsID+1;
        } catch (SQLException ex) {
            Logger.getLogger(RelationshipDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return next;
    }
    
    
    public static void main(String[] args){
        //Relationship r = new Relationship(RelationshipDAO.getNextRequestID(), 3, "hello@hotmail.com", "incubator", null, "requesting");
        int result = RelationshipDAO.getNextRelationshipID();
        
        System.out.println(result);
        
    }
}

