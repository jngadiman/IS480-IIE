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
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return minutes;
    }
    
    //get the meeting minutes of the company
    public static ArrayList<Integer> getMeetingMinutesIDsOfCompany(int meetingID) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
       
        int minutesID = 0;
        
        
        ArrayList<Integer> minutes = new ArrayList<Integer>();
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select DISTINCT (minutes_id) from meeting_minutes where meeting_id = ?;");
            stmt.setInt(1,meetingID);
            
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
            stmt = conn.prepareStatement("select task_id from meeting_minutes where minutes_id = ?;");
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
    
    
    public static ArrayList<String> getMeetingMinutesDetails(int minutesID, int taskID) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String title = "";
        String meetingID = "";
        String comment = "";
        String mentor = "";
        String user = "";
        
        ArrayList<String> details = new ArrayList<String>();
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select title, meeting_id, comment, submitted_user, mentor from meeting_minutes where minutes_id = ? and task_id = ?;");
            stmt.setInt(1, minutesID);
            stmt.setInt(2, taskID);
            
            result = stmt.executeQuery();

            while (result.next()) {
                title = result.getString("title");
                meetingID = result.getString("meeting_id");
                comment = result.getString("comment");
                user = result.getString("submitted_user");
                mentor = result.getString("mentor");
                details.add(title);
                details.add(meetingID);
                details.add(comment);
                details.add(user);
                details.add(mentor);
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
    
    public static int getLastID() {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        
        
        int count = 0;
        
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select count(DISTINCT minutes_id) from meeting_minutes;");
            result = stmt.executeQuery();
            result.next();
            count = result.getInt(1)+1; 


        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return count;
    }
    
    
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
        String submitted_user = minutes.getSubmittedUser().getEmail();
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("INSERT INTO meeting_minutes VALUES (?, ?, ?, ?, ?, ?, ?);");

            for (Task t: completedTasks){
                stmt.setInt(1, minutesID);
                stmt.setString(2,title);
                stmt.setInt(3,meeting);
                stmt.setString(4,mentor);
                stmt.setInt(5,t.getTaskId());
                stmt.setString(6,comment);
                stmt.setString(7,submitted_user);
                status = stmt.executeUpdate();
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return status;
    }

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
    
    // not done yet, cus of the MeetingMinutes constructor 
    public static ArrayList<MeetingMinutes> getMeetingMinutesByTask(int task_id) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int minutesID = 0;
        String title = "";
        int meetingID = 0;
        String mentor = "";
        int taskID = 0;
        String comment = "";
        String user = "";
        
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
                user = result.getString("submitted_user");
                
                //MeetingMinutes mm = new MeetingMinutes(minutesID, title, meetingID, mentor, taskID, comment, user);
                //minutesByTask.add(mm);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return minutesByTask;
    }
      public static void main(String[] args){
        boolean minutesID = MeetingMinutesDAO.deleteMeetingMinutesByID(3);
        //Date deadline = new Date();
//        for(String task:minutesID){
//           System.out.println(task); 
//        }

        System.out.println(minutesID); 
        
    }
        
}
