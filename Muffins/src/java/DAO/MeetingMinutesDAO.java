/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.*;
import Utility.ConnectionManager;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jiatung.lim
 */
public class MeetingMinutesDAO {
    public static ArrayList<Integer> getMeetingMinutesIDsOfMentor(Mentor m) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        
        String mentor = m.getEmail();
        
        int minutesID = 0;
        
        
        ArrayList<Integer> minutes = new ArrayList<Integer>();
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select unique (minutes_id) from MeetingMinutes where mentor = ?;");
            stmt.setString(1,mentor);
            
            result = stmt.executeQuery();

            while (result.next()) {
                
                minutesID = Integer.parseInt(result.getString("minutes_id"));
                minutes.add(minutesID);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return minutes;
    }
    
    public static ArrayList<Integer> getCompletedTasksByMeetingMinutes(int minutesID) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        
        int task = 0;
        
        
        ArrayList<Integer> tasks = new ArrayList<Integer>();
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select completed_task from MeetingMinutes where minutes_id = ?;");
            stmt.setInt(1,minutesID);
            
            result = stmt.executeQuery();

            while (result.next()) {
                task = Integer.parseInt(result.getString("task_id"));
                tasks.add(task);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return tasks;
    }
    
    public static ArrayList<String> getMeetingMinutesDetails(int minutesID) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String title = "";
        String meetingID = "";
        String comment = "";
        String submittedUser = "";
        ArrayList<String> details = new ArrayList<String>();
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select title, meeting_id, comment, submitted_user from MeetingMinutes where unique (minutes_id) = ?;");
            stmt.setInt(1,minutesID);
            
            result = stmt.executeQuery();

            while (result.next()) {
                title = result.getString("title");
                meetingID = result.getString("meeting_id");
                comment = result.getString("comment");
                submittedUser = result.getString("submitted_user");
                details.add(title);
                details.add(meetingID);
                details.add(comment);
                details.add(submittedUser);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return details;
    }
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
    
     public static int addMeetingMinutes(MeetingMinutes minutes) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int status = 0;
        
        ArrayList<Task> completedTasks = minutes.getTasksToComplete();
        int minutesID = minutes.getMinutesID();
        String title = minutes.getTitle();
        int meeting = minutes.getM().getMeetingID();
        String mentor = minutes.getMentor().getEmail();
        String comment = minutes.getComments();
        String submittedUser = minutes.getSubmittedUser().getEmail();
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("INSERT INTO meetingMinutes VALUES (?, ?, ?, ?, ?, ?, ?);");

            for (Task t: completedTasks){
                stmt.setInt(1, minutesID);
                stmt.setString(2,title);
                stmt.setInt(3,meeting);
                stmt.setString(4,mentor);
                stmt.setInt(5,t.getTaskId());
                stmt.setString(6,comment);
                stmt.setString(7,submittedUser);
                status = stmt.executeUpdate();
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return status;
    }
        
}
