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
        String location = "";
        Date startTime = null;
        Date endTime = null;
        String stringAttendees = "";
        int menteeCompanyID = 0;
       
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd hh:ss");
        String status = "";
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from meeting where meeting_id = ?;");
            stmt.setInt(1,meetingID);
            
            result = stmt.executeQuery();

            while (result.next()) {
                meetingID = Integer.parseInt(result.getString("meeting_id"));
                meetingName = result.getString("meeting_name");
                location = result.getString("location");
                
                try {
                    startTime = dateformat.parse(result.getString("start_time"));
                    endTime = dateformat.parse(result.getString("end_time"));
                }catch(ParseException e){
                    e.printStackTrace();
                }
                stringAttendees = result.getString("attendees");
                
                status = result.getString("status");
                
                menteeCompanyID = result.getInt("mentee_company_id");
               
                meeting = new Meeting(meetingID, meetingName, location, startTime, endTime, stringAttendees, status, menteeCompanyID);
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
    
    //public static ArrayList<Integer> getMeetingOfCompanyByMonthNYear(int month, int year, int company_id){
    public static ArrayList<Integer> getMeetingOfCompanyByPeriod(Date start, Date end, int company_id){    
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int meetingID = 0;
        ArrayList<Integer> meetingIDs = new ArrayList<Integer>();
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
         
//        LocalDate startMonth = YearMonth.of(year,month).atDay(1); //2015-12-01
//        LocalDate endMonth = YearMonth.of(year,month).atEndOfMonth(); //2015-12-31
//        
        
        String startDateStr = dateformat.format(start);
        String endDateStr = dateformat.format(end);
       
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
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
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
            Logger.getLogger(MeetingDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return meetingIDs;
    }
    
    public static ArrayList<Integer> getMeetingIDsOfAttendees(String email) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int meetingID = 0;
        ArrayList<Integer> meetingIDs = new ArrayList<Integer>();
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select meeting_id from meeting where attendees like '%"+email+"%' ;");
            //stmt.setString(1,email);
            
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
    
    //get meeting ids by the status
    public static ArrayList<Integer> getMeetingIDsByStatus(String status) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int meetingID = 0;
        ArrayList<Integer> meetingIDs = new ArrayList<Integer>();
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select meeting_id from meeting where status = ?;");
            stmt.setString(1,status);
            
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
    
    //get meeting ids by the type of meeting
//    public static ArrayList<Integer> getMeetingIDsByType(String type) {
//   
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet result = null;
//        int meetingID = 0;
//        ArrayList<Integer> meetingIDs = new ArrayList<Integer>();
//        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//        
//        
//        try {
//            conn = ConnectionManager.getConnection();
//            stmt = conn.prepareStatement("select meeting_id from meeting where meeting_type = ?;");
//            stmt.setString(1,type);
//            
//            result = stmt.executeQuery();
//
//            while (result.next()) {
//                meetingID = Integer.parseInt(result.getString("meeting_id"));
//                meetingIDs.add(meetingID);
//                
//               
//            }
//
//        } catch (SQLException ex) {
//            Logger.getLogger(MeetingDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            ConnectionManager.close(conn, stmt, result);
//        }
//        return meetingIDs;
//    }
    
    public static String addMeeting(Meeting meeting) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        int result = 0;
        ResultSet count = null;
        String resultStr="";
        
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("INSERT INTO meeting VALUES (?, ?, ?, ?, ?, ?, ?, ?);");
            stmt.setInt(1,meeting.getMeetingID());
            stmt.setString(2,meeting.getMeetingName());
            stmt.setString(3,meeting.getLocation());
            if(meeting.getStartTime()!=null){
                stmt.setString(4, df.format(meeting.getStartTime()));
            }else{
                stmt.setString(4, null);
            }
            
            if(meeting.getEndTime()!=null){
                stmt.setString(5, df.format(meeting.getEndTime()));
            }else{
                stmt.setString(5, null);
            }
            
            stmt.setString(6,meeting.getAttendees());
            
            stmt.setString(7,meeting.getStatus());
            stmt.setInt(8,meeting.getMenteeCompany());
            
            result = stmt.executeUpdate();
            
            if(result==1){
                resultStr = "Success";
            }else{
                resultStr = "Failed";
            }
            

        } catch (SQLException ex) {
            Logger.getLogger(MeetingDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, count);
        }
        return resultStr;
    }
    
    public static int getLastID(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int meeting_id = 0;
        int next = 1;
        
        try{
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from meeting order by meeting_id desc;");
            result = stmt.executeQuery();
            result.next();
            meeting_id = result.getInt("meeting_id");
            next = meeting_id+1;
        } catch (SQLException ex) {
            Logger.getLogger(MeetingDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return next;
    }
    
    public static int changeStatusOfMeeting(String status, int meetingID) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        
        int result = 0;
        
        
        try {
            conn = ConnectionManager.getConnection();
            
           
           
            stmt = conn.prepareStatement("UPDATE meeting SET  status = ? WHERE meeting_id = ?;");
            stmt.setString(1, status);
            stmt.setInt(2, meetingID);
            
            
            result = stmt.executeUpdate();
            
          
        } catch (SQLException ex) {
            Logger.getLogger(MeetingDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }
    //get all meetings of the company w EIR
    public static ArrayList<Integer> getMeetingIDsOfCompanyWEIR(int companyID, String eirEmail) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int meetingID = 0;
        ArrayList<Integer> meetingIDs = new ArrayList<Integer>();
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        boolean status = false;
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select meeting_id from meeting where mentee_company_id = ? AND attendees LIKE ?");
            stmt.setInt(1,companyID);
            stmt.setString(2,"%" + eirEmail + "%");
            result = stmt.executeQuery();

            while (result.next()) {
                meetingID = result.getInt("meeting_id");
                meetingIDs.add(meetingID);
            }

        } catch (SQLException ex) {
            Logger.getLogger(MeetingDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return meetingIDs;
    }
    
    //get all meetings of w EIR
    public static ArrayList<Integer> getMeetingIDsOfEIR(String eirEmail) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int meetingID = 0;
        ArrayList<Integer> meetingIDs = new ArrayList<Integer>();
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        boolean status = false;
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select meeting_id from meeting where attendees LIKE ?;");
            stmt.setString(1,"%" + eirEmail + "%");
            result = stmt.executeQuery();
            
            while (result.next()) {
                meetingID = result.getInt("meeting_id");
                System.out.println("meetingID: " + meetingID);
                meetingIDs.add(meetingID);
            }

        } catch (SQLException ex) {
            Logger.getLogger(MeetingDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return meetingIDs;
    }
    
    //get the nearest 2 upcoming meetings
//    public static ArrayList<Integer> getMeetingIDsOfCompany(int companyID) {
//   
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet result = null;
//        int meetingID = 0;
//        ArrayList<Integer> meetingIDs = new ArrayList<Integer>();
//        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//        boolean status = false;
//        
//        try {
//            conn = ConnectionManager.getConnection();
//            stmt = conn.prepareStatement("select meeting_id from meeting where mentee_company_id = ?;");
//            stmt.setInt(1,companyID);
//            
//            result = stmt.executeQuery();
//
//            while (result.next()) {
//                meetingID = Integer.parseInt(result.getString("meeting_id"));
//                meetingIDs.add(meetingID);
//                
//               
//            }
//
//        } catch (SQLException ex) {
//            Logger.getLogger(MeetingDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            ConnectionManager.close(conn, stmt, result);
//        }
//        return meetingIDs;
//    }
    
    
    public static void main(String[] args){
       // Meeting m = new Meeting(5, "meetingname", "Incubation", new Date(), new Date(), "example@gmail.com,people@gmail.com", "accepted", 3);
//        ArrayList<Integer> meetings = MeetingDAO.getMeetingOfCompanyByMonthNYear(9, 2017, 3);
        String email = "incogiieportal@gmail.com";
        ArrayList<Integer> meetings = MeetingDAO.getMeetingIDsOfEIR(email);
        System.out.println(meetings.size());
        for(Integer id:meetings){
            System.out.println("MEETING ID = "+id);
        }
        
        //MeetingDAO.addMeeting(m);
        
    }
    
}
