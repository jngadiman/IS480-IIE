/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.*;
import Utility.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jiatung.lim
 */
public class MeetingMinutesDAO {

    
    //add MeetingMinute by row
    public static int addMeetingMinutesRow(MeetingMinutes minutes) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int status = 0;
        
        int taskID = minutes.getTaskID();
        int minutesID = minutes.getMinutesID();
        String title = minutes.getTitle();
        int meetingID = minutes.getMinutesID();
        String mentor = minutes.getMentorEmail();
        String comment = minutes.getComments();
        String submitted_user = minutes.getSubmittedUser();
        int rating = minutes.getMentorRating();
        String ratingComments = minutes.getMentorRatingComment();
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("INSERT INTO meeting_minutes VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");
            stmt.setInt(1, minutesID);
            stmt.setString(2,title);
            stmt.setInt(3,meetingID);
            stmt.setString(4, mentor);
            stmt.setInt(5, taskID);
            stmt.setString(6, comment);
            stmt.setString(7, submitted_user);
            stmt.setInt(8, rating);
            stmt.setString(9, ratingComments);
            
            status = stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MeetingMinutesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return status;
    }
    
    //delete MeetingMinutes per row
     public static boolean deleteMeetingMinutesByRow(int minutesID, int taskID){
        
        Connection conn = null;
        int numRecordsUpdated = 0;
        
        PreparedStatement stmt0 = null;

        try {
            conn = ConnectionManager.getConnection();

            //check the number of bids made by the student
            stmt0 = conn.prepareStatement("DELETE FROM meeting_minutes WHERE minutes_id = ? AND task_id = ?");
            stmt0.setInt(1, minutesID);
            stmt0.setInt(2, taskID);

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
    
     //delete one page of MeetingMinutes
     public static boolean deleteMeetingMinutes(int minutesID){
        
        Connection conn = null;
        int numRecordsUpdated = 0;
        
        PreparedStatement stmt0 = null;

        try {
            conn = ConnectionManager.getConnection();

            //check the number of bids made by the student
            stmt0 = conn.prepareStatement("DELETE FROM meeting_minutes WHERE minutes_id = ?");
            stmt0.setInt(1, minutesID);

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
     
     
//     //get 1 MeetingMinutes row
//     public static ArrayList<String> getMeetingMinutesRow(int minutesID, int taskID) {
//   
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet result = null;
//        String title = "";
//        String meetingID = "";
//        String comment = "";
//        String mentor = "";
//        String user = "";
//        int rating = 0;
//        String ratingComments ="";
//        
//        ArrayList<String> details = new ArrayList<String>();
//        
//        try {
//            conn = ConnectionManager.getConnection();
//            stmt = conn.prepareStatement("select title, meeting_id, mentor, comment, submitted_user, mentor_rating, mentor_rating_comments from meeting_minutes where minutes_id = ? and task_id = ?;");
//            stmt.setInt(1, minutesID);
//            stmt.setInt(2, taskID);
//            
//            result = stmt.executeQuery();
//
//            while (result.next()) {
//                title = result.getString("title");
//                meetingID = result.getString("meeting_id");
//                mentor = result.getString("mentor");
//                comment = result.getString("comment");
//                user = result.getString("submitted_user");
//                rating = result.getInt("mentor_rating");
//                ratingComments = result.getString("mentor_rating_comments");
//                
//                details.add(title);
//                details.add(meetingID);
//                details.add(comment);
//                details.add(user);
//                details.add(mentor);
//            }
//
//        } catch (SQLException ex) {
//            Logger.getLogger(MeetingMinutesDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            ConnectionManager.close(conn, stmt, result);
//        }
//        return details;
//    }
     
     //delete the whole set of MeetingMinutes rowss
     public static boolean deleteMeetingMinutesByID(int minutesID){
        
        Connection conn = null;
        int numRecordsUpdated = 0;
        
        PreparedStatement stmt0 = null;

        try {
            conn = ConnectionManager.getConnection();

            //check the number of bids made by the student
            stmt0 = conn.prepareStatement("DELETE FROM meeting_minutes WHERE minutes_id = ?");
            stmt0.setInt(1, minutesID);

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
     
     //get the whole set of MeetingMinutes rows based on MeetingMinutesID
    public static ArrayList<MeetingMinutes> getMeetingMinutes(int meetingMinutesID){
        ArrayList<MeetingMinutes> meetingMinutes = new ArrayList<MeetingMinutes>();
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        
        MeetingMinutes mm = null;
        int minutesID = 0;
        String title = "";
        int meetingID = 0;
        String mentorEmail = "";
        int taskID = 0;
        String comments = "";
        String submitted_user = "";
        int rating = 0;
        String ratingComments = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from meeting_minutes where minutes_id = ?;");
            stmt.setInt(1,meetingMinutesID);
            
            result = stmt.executeQuery();

            while (result.next()) {
                minutesID = result.getInt("minutes_id");
                title = result.getString("title");
                meetingID = result.getInt("meeting_id");
                mentorEmail = result.getString("mentor");
                taskID = result.getInt("task_id");
                comments = result.getString("comment");
                submitted_user = result.getString("submitted_user");
                rating = result.getInt("mentor_rating");
                ratingComments = result.getString("mentor_rating_comments");
                mm = new MeetingMinutes(minutesID, title, meetingID, mentorEmail, taskID, comments, submitted_user, rating,ratingComments);
                meetingMinutes.add(mm);
            }

        } catch (SQLException ex) {
            Logger.getLogger(MeetingMinutesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return meetingMinutes;
    } 
    
     //get the whole set of MeetingMinutes rows based on MeetingMinutesID
    public static ArrayList<MeetingMinutes> getMeetingMinutesByMeeting(int meetingID){
        ArrayList<MeetingMinutes> meetingMinutes = new ArrayList<MeetingMinutes>();
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        
        MeetingMinutes mm = null;
        int minutesID = 0;
        String title = "";
        
        String mentorEmail = "";
        int taskID = 0;
        String comments = "";
        String submitted_user = "";
        int rating = 0;
        String ratingComments = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from meeting_minutes where meeting_id = ?;");
            stmt.setInt(1,meetingID);
            
            result = stmt.executeQuery();

            while (result.next()) {
                minutesID = result.getInt("minutes_id");
                title = result.getString("title");
                meetingID = result.getInt("meeting_id");
                mentorEmail = result.getString("mentor");
                taskID = result.getInt("task_id");
                comments = result.getString("comment");
                submitted_user = result.getString("submitted_user");
                rating = result.getInt("mentor_rating");
                ratingComments = result.getString("mentor_rating_comments");
                mm = new MeetingMinutes(minutesID, title, meetingID, mentorEmail, taskID, comments, submitted_user, rating,ratingComments);
                meetingMinutes.add(mm);
            }

        } catch (SQLException ex) {
            Logger.getLogger(MeetingMinutesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return meetingMinutes;
    } 
    
    //get MeetingMinutesIDs of given mentor 
    public static ArrayList<Integer> getMeetingMinutesIDsOfMentor(String email) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
       
        int minutesID = 0;
        
        
        ArrayList<Integer> minutes = new ArrayList<Integer>();
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select DISTINCT (minutes_id) from meeting_minutes where mentor = ?;");
            stmt.setString(1,email);
            
            result = stmt.executeQuery();

            while (result.next()) {
                
                minutesID = Integer.parseInt(result.getString("minutes_id"));
                minutes.add(minutesID);
            }

        } catch (SQLException ex) {
            Logger.getLogger(MeetingMinutesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return minutes;
    }
    
    //get MeetingMinutes given task id and company id
    public static ArrayList<MeetingMinutes> getMeetingMinutesByTaskNCompany(int task_id, int company_id) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int minutesID = 0;
        String title = "";
        int meetingID = 0;
        String mentor = "";
        int taskID = 0;
        String comment = "";
        String submittedUser = "";
        int rating = 0;
        String ratingComments = "";
        ArrayList<MeetingMinutes> minutesByTask = new ArrayList<MeetingMinutes>();
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from meeting_minutes where task_id = ?;");
            stmt.setInt(1, task_id);
            
            result = stmt.executeQuery();

            while (result.next()) {
                minutesID = result.getInt("minutes_id");
                title = result.getString("title");
                meetingID = result.getInt("meeting_id");
                mentor = result.getString("mentor");
                taskID = result.getInt("task_id");
                comment = result.getString("comment");
                submittedUser = result.getString("submitted_user");
                rating = result.getInt("mentor_rating");
                ratingComments = result.getString("mentor_rating_comments");
                
                
                
                MeetingMinutes mm = new MeetingMinutes(minutesID, title, meetingID, mentor, taskID, comment, submittedUser, rating, ratingComments);
                minutesByTask.add(mm);
            }
            
            for(int i = 0; i < minutesByTask.size(); i++){
                MeetingMinutes mm = minutesByTask.get(i);
                String email = mm.getSubmittedUser();
                User user = UserDAO.getUserByEmail(email);
                int companyID = user.getCompanyid();
                if(companyID != company_id){
                    minutesByTask.remove(mm);
                    i++;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(MeetingMinutesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return minutesByTask;
    }
    
    //get all the Meeting IDs of a given Mentor email
    public static ArrayList<Integer> getMeetingIDsOfMentor(String mentor_email){
        ArrayList<Integer> meetingIDs = new ArrayList<Integer>();
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
       
        int meetingID = 0;
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("SELECT DISTINCT `meeting_id` FROM `meeting_minutes` WHERE `mentor` = ?;");
            
            stmt.setString(1, mentor_email);
            
            result = stmt.executeQuery();

            while (result.next()) {
                
                meetingID = Integer.parseInt(result.getString("meeting_id"));
                meetingIDs.add(meetingID);
            }

        } catch (SQLException ex) {
            Logger.getLogger(MeetingMinutesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return meetingIDs;
    }
    
    //get all the Task IDs of unique meeting minutes id
    public static ArrayList<Integer> getTaskIDsOfMM(int minutesID){
        ArrayList<Integer> taskIDs = new ArrayList<Integer>();
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
       
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("SELECT DISTINCT `task_id` FROM `meeting_minutes` WHERE `minutes_id` = ?;");
            
            stmt.setInt(1, minutesID);
            
            result = stmt.executeQuery();

            while (result.next()) {
                
                int id = Integer.parseInt(result.getString("task_id"));
                taskIDs.add(id);
            }

        } catch (SQLException ex) {
            Logger.getLogger(MeetingMinutesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return taskIDs;
    }
    
    //returns the last ID based on the last MeetingMinutes ID in the db
    public static int getLastID(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int minutes_id = 0;
        int next = 1;
        
        try{
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from meeting_minutes order by minutes_id desc;");
            result = stmt.executeQuery();
            result.next();
            minutes_id = result.getInt("minutes_id");
            next = minutes_id+1;
        } catch (SQLException ex) {
            Logger.getLogger(MeetingMinutesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return next;
    }
    
     //get MeetingMinutes given meeting ids and mentor
    public static ArrayList<MeetingMinutes> getMeetingMinutesOfMentorByMeetingIDs(int meetingID, String mentor_email) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int minutesID = 0;
        String title = "";
        String mentor = "";
        int taskID = 0;
        String comment = "";
        String submittedUser = "";
        int rating = 0;
        String ratingComments = "";
        
        ArrayList<MeetingMinutes> minutes = new ArrayList<MeetingMinutes>();
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from meeting_minutes where mentor= ? and meeting_id = ?;");
            stmt.setString(1, mentor_email);
            stmt.setInt(2, meetingID);
            
            result = stmt.executeQuery();

            while (result.next()) {
                minutesID = result.getInt("minutes_id");
                title = result.getString("title");
                meetingID = result.getInt("meeting_id");
                mentor = result.getString("mentor");
                taskID = result.getInt("task_id");
                comment = result.getString("comment");
                submittedUser = result.getString("submitted_user");
                rating = result.getInt("mentor_rating");
                ratingComments = result.getString("mentor_rating_comments");
                MeetingMinutes mm = new MeetingMinutes(minutesID, title, meetingID, mentor, taskID, comment, submittedUser, rating, ratingComments);
                minutes.add(mm);
            }
            
            

        } catch (SQLException ex) {
            Logger.getLogger(MeetingMinutesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return minutes;
       
    }
    
    public static int getAverageMentorRatingCount(String mentor_email){
        
        int count = 0;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
       
        int minutes_id = 0;
        int rating = 0;
        int totalMinutes = 0;
        int totalRating = 0;
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("SELECT DISTINCT `minutes_id`, `mentor_rating`FROM `meeting_minutes` WHERE `mentor`= ?");
            
            stmt.setString(1, mentor_email);
            
            result = stmt.executeQuery();

            while (result.next()) {
                
                minutes_id = Integer.parseInt(result.getString("minutes_id"));
                rating = Integer.parseInt(result.getString("mentor_rating"));
                totalRating+=rating;
                totalMinutes++;
            }
            
            count = totalRating/totalMinutes;
        } catch (SQLException ex) {
            Logger.getLogger(MeetingMinutesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return count;
    }
//    public static ArrayList<Integer> getCompletedTasksByMeetingMinutes(int minutesID) {
//   
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet result = null;
//        
//        int task = 0;
//        
//        
//        ArrayList<Integer> tasks = new ArrayList<Integer>();
//        
//        
//        try {
//            conn = ConnectionManager.getConnection();
//            stmt = conn.prepareStatement("select task_id from meeting_minutes where minutes_id = ?;");
//            stmt.setInt(1,minutesID);
//            
//            result = stmt.executeQuery();
//
//            while (result.next()) {
//                task = Integer.parseInt(result.getString("task_id"));
//                tasks.add(task);
//            }
//
//        } catch (SQLException ex) {
//            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            ConnectionManager.close(conn, stmt, result);
//        }
//        return tasks;
//    }
    
    
    
// LEGGIT THINK GOT BETTER METHOD TO QUERY I TRY LATER       
//    public static ArrayList<MeetingMinutes> getMeetingMinutesOfMentor(Mentor m) {
//   
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet result = null;
//        
//        String mentor = m.getEmail();
//        
//        String title = "";
//        String currentTitle = "";
//        int meetingID = 0;
//        ArrayList<Integer> taskids = new ArrayList<Integer>();
//        int task = 0; 
//        String comment = "";
//        String submittedUser = "";
//        
//        
//        ArrayList<MeetingMinutes> minutes = new ArrayList<MeetingMinutes>();
//        
//        
//        try {
//            conn = ConnectionManager.getConnection();
//            stmt = conn.prepareStatement("select * from MeetingMinutes where mentor = ?;");
//            stmt.setString(1,mentor);
//            
//            result = stmt.executeQuery();
//
//            while (result.next()) {
//                
//                title = result.getString("title");
//                if(!currentTitle.equals(title)){
//                    meetingID = Integer.parseInt(result.getString("meeting_id"));
//                    task = Integer.parseInt(result.getString("task_id"));
//                    taskids.add(task);
//                    comment = result.getString("comment");
//                    submittedUser = result.getString("submitted_user");
//                    
//                }
//                
//                minutes.add(new MeetingMinutes(title, meetingID, mentor, completedTasks, comment, submittedUser));
//                
//                
//                
//            }
//
//        } catch (SQLException ex) {
//            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            ConnectionManager.close(conn, stmt, result);
//        }
//        return minutes;
//    }

    public static void main(String[] args){
        //MeetingMinutes mm = new MeetingMinutes(3, "Meeting #3", 3, "mentor3@hotmail.com", 4, "done", "b.wee.2008@smu.edu.sg");
//        ArrayList<MeetingMinutes> meetingMinutes = MeetingMinutesDAO.getMeetingMinutes(1);
//
//        for(MeetingMinutes mm : meetingMinutes){
//            System.out.println(mm.getMinutesID()); 
//            System.out.println(mm.getTitle());
//            System.out.println(mm.getMeeting_id()); 
//            System.out.println(mm.getMentor_email()); 
//            System.out.println(mm.getTask_id()); 
//            System.out.println(mm.getComments());
//            System.out.println(mm.getSubmitted_user()); 
//            System.out.println(mm.getMentorRating());
//        }
        
        boolean status = MeetingMinutesDAO.deleteMeetingMinutes(6);

//            int id = MeetingMinutesDAO.getLastID();
//            System.out.println(id);
        //Date deadline = new Date();
//        for(String task:minutesID){
//           System.out.println(task); 
//        }
        
    }
        
}
