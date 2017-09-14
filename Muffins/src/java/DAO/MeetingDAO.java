/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.Company;
import MODELS.Meeting;
import Utility.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
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
 * @author jiatung.lim
 */
public class MeetingDAO {
    public static Meeting getMeeting(int meetingID) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        Meeting meeting = null;
        String meetingName = "";
        String meetingType = "";
        Date startTime = null;
        Date endTime = null;
        String stringAttendees = "";
        String menteeCompanyID = "";
        String [] attendees = null;
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd hh:ss");
        boolean status = false;
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from meeting where meeting_id = ?;");
            stmt.setInt(1,meetingID);
            
            result = stmt.executeQuery();

            while (result.next()) {
                meetingID = Integer.parseInt(result.getString("meeting_id"));
                meetingName = result.getString("meeting_name");
                meetingType = result.getString("meeting_type");
                
                try {
                    startTime = dateformat.parse(result.getString("start_time"));
                    endTime = dateformat.parse(result.getString("end_time"));
                }catch(ParseException e){
                    e.printStackTrace();
                }
                stringAttendees = result.getString("attendees");
                attendees = stringAttendees.split(",");
                String statusString = result.getString("status");
                if(statusString.toUpperCase().equals("approved")){
                    status = true;
                }else{
                    status = false;
                }
                
                menteeCompanyID = result.getString("mentee_company_id");
                Company menteeCompany = CompanyDAO.getCompany(Integer.parseInt(menteeCompanyID));
                meeting = new Meeting(meetingID, meetingName, meetingType, startTime, endTime, attendees, status, menteeCompany);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return meeting;
    }
    
    public static ArrayList<Integer> getMeetingOfCompanyByMonthNYear(int month, int year, int company_id){
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int meetingID = 0;
        ArrayList<Integer> meetingIDs = new ArrayList<Integer>();
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
         
        LocalDate startMonth = YearMonth.of(year,month).atDay(1); //2015-12-01
        LocalDate endMonth = YearMonth.of(year,month).atEndOfMonth(); //2015-12-31
        
        String startDateStr = startMonth+" 00:00:00";
        String endDateStr = endMonth+" 23:59:59";
       
//        Date startDate = new Date();
//        Date endDate = new Date();
        
//        try{
//            startDate = dateformat.parse(startDateStr);
//            endDate = dateformat.parse(endDateStr);
//            System.out.println("STARTDATE = "+startDate);
//            System.out.println("STARTDATE FOMATTED = "+dateformat.format(startDate));
//        }catch(ParseException e){
//            e.printStackTrace();
//        }
        Timestamp startDate = java.sql.Timestamp.valueOf(startDateStr) ;
        Timestamp endDate = java.sql.Timestamp.valueOf(endDateStr) ;
        System.out.println("STARTDATE = "+startDate);
        System.out.println("ENDDATE = "+endDate);
        System.out.println("STARTDATE FOMATTED = "+dateformat.format(startDate));
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select meeting_id from meeting where start_time >= ? and end_time <= ? and mentee_company_id = ?;");
            
            stmt.setTimestamp(1, startDate);
            stmt.setTimestamp(2, endDate);
            
            stmt.setInt(3, company_id);
            result = stmt.executeQuery();

            while (result.next()) {
                meetingID = Integer.parseInt(result.getString("meeting_id"));
                meetingIDs.add(meetingID);
                
               
            }

        } catch (SQLException ex) {
            Logger.getLogger(MeetingDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return meetingIDs;
        
    }
    
    public static ArrayList<Integer> getMeetingIDsOfCompany(int companyID) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int meetingID = 0;
        ArrayList<Integer> meetingIDs = new ArrayList<Integer>();
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd hh:ss");
        boolean status = false;
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select meeting_id from meeting where mentee_company_id = ?;");
            stmt.setInt(1,companyID);
            
            result = stmt.executeQuery();

            while (result.next()) {
                meetingID = Integer.parseInt(result.getString("meeting_id"));
                meetingIDs.add(meetingID);
                
               
            }

        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return meetingIDs;
    }
    
    public static void main(String[] args){
        ArrayList<Integer> meetings = MeetingDAO.getMeetingOfCompanyByMonthNYear(9, 2017, 3);
        for(int id:meetings){
            System.out.println("MEETING ID = "+id);
        }
    }
    
}
