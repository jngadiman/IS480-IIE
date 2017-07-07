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
import MODELS.*;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author JJAY
 */
public class TaskDAO {
    
    public static Task getTask(int taskid){
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String taskname = "";
        String taskdesc = "";
        String deadLine = "";
        Date deadline = new Date();
        int programstage = 0;
        int companyID = 0;
        String isCompleted = "";
        boolean iscompleted = true;
        Task task = null;
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from task where task_id = ?;"); 
            stmt.setInt(1,taskid);
            
            result = stmt.executeQuery();

            while (result.next()) {
                taskid = Integer.parseInt(result.getString("task_id"));
                taskname = result.getString("task_name");
                taskdesc = result.getString("task_description");
                deadLine = result.getString("task_deadline");
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    deadline = dateformat.parse(deadLine);
                }catch(ParseException e){
                    e.printStackTrace();
                }
                programstage = Integer.parseInt(result.getString("program_stage"));
                companyID = Integer.parseInt(result.getString("company_id"));
                isCompleted = result.getString("is_completed");
                iscompleted = isCompleted.equals("Y");
                
                task = new Task(taskname, taskdesc, deadline, programstage, companyID, iscompleted);
            }
            
            //print += "TASK TABLE"+ taskid + ", " +taskname + ", "+ taskdesc + ", "+ deadline + ", " + programstage + ", "+ iscompleted;
            //System.out.println("TASK TABLE"+ taskid + ", " +taskname + ", "+ taskdesc + ", "+ deadline + ", " + programstage + ", "+ iscompleted);
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return task;
       
    }

    public static ArrayList<Task> getAllTasks() {

        ArrayList<Task> tasks = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int taskid = 0;
        String taskname = "";
        String taskdesc = "";
        String deadLine = "";
        Date deadline = new Date();
        int programstage = 0;
        int companyID = 0;
        String isCompleted = "";
        boolean iscompleted = true;
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from task order by task_id;"); 

            result = stmt.executeQuery();

            while (result.next()) {
                taskid = Integer.parseInt(result.getString("task_id"));
                taskname = result.getString("task_name");
                taskdesc = result.getString("task_description");
                deadLine = result.getString("task_deadline");
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    deadline = dateformat.parse(deadLine);
                }catch(ParseException e){
                    e.printStackTrace();
                }  
                programstage = Integer.parseInt(result.getString("program_stage"));
                companyID = Integer.parseInt(result.getString("company_id"));
                isCompleted = result.getString("is_completed");
                iscompleted = isCompleted.equals("Y");
                Task task = new Task(taskname, taskdesc, deadline, programstage, companyID, iscompleted);
                tasks.add(task);
            }
            
            //print += "TASK TABLE"+ taskid + ", " +taskname + ", "+ taskdesc + ", "+ deadline + ", " + programstage + ", "+ iscompleted;
            //System.out.println("TASK TABLE"+ taskid + ", " +taskname + ", "+ taskdesc + ", "+ deadline + ", " + programstage + ", "+ iscompleted);
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return tasks;
    }
    
    public static ArrayList<Task> getTasksByProgramStage(int programStage) {
        
        if(programStage == 0){
            return null;
        }

        ArrayList<Task> tasks = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int taskid = 0;
        String taskname = "";
        String taskdesc = "";
        String deadLine = "";
        Date deadline = new Date();
        int programstage = 0;
        int companyID = 0;
        String isCompleted = "";
        boolean iscompleted = true;
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from task where program_stage = ? order by task_id;");
            stmt.setInt(1,programStage);

            result = stmt.executeQuery();

            while (result.next()) {
                taskid = Integer.parseInt(result.getString("task_id"));
                taskname = result.getString("task_name");
                taskdesc = result.getString("task_description");
                deadLine = result.getString("task_deadline");
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    deadline = dateformat.parse(deadLine);
                }catch(ParseException e){
                    e.printStackTrace();
                }  
                programstage = Integer.parseInt(result.getString("program_stage"));
                companyID = Integer.parseInt(result.getString("company_id"));
                isCompleted = result.getString("is_completed");
                iscompleted = isCompleted.equals("Y");
                
                Task task = new Task(taskname, taskdesc, deadline, programstage, companyID, iscompleted);
                tasks.add(task);
            }
            
            //print += "TASK TABLE"+ taskid + ", " +taskname + ", "+ taskdesc + ", "+ deadline + ", " + programstage + ", "+ iscompleted;
            //System.out.println("TASK TABLE"+ taskid + ", " +taskname + ", "+ taskdesc + ", "+ deadline + ", " + programstage + ", "+ iscompleted);
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return tasks;
    }
    
    public static ArrayList<Task> getTasksByCompany(int company_ID) {
        
        if(company_ID == 0){
            return null;
        }

        ArrayList<Task> tasks = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int taskid = 0;
        String taskname = "";
        String taskdesc = "";
        String deadLine = "";
        Date deadline = new Date();
        int programstage = 0;
        int companyID = 0;
        String isCompleted = "";
        boolean iscompleted = true;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from task where company_id = ? order by task_id;");
            stmt.setInt(1, company_ID);

            result = stmt.executeQuery();

            while (result.next()) {
                taskid = Integer.parseInt(result.getString("task_id"));
                taskname = result.getString("task_name");
                taskdesc = result.getString("task_description");
                deadLine = result.getString("task_deadline");
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    deadline = dateformat.parse(deadLine);
                }catch(ParseException e){
                    e.printStackTrace();
                }  
                programstage = Integer.parseInt(result.getString("program_stage"));
                companyID = Integer.parseInt(result.getString("company_id"));
                isCompleted = result.getString("is_completed");
                iscompleted = isCompleted.equals("Y");

                Task task = new Task(taskname, taskdesc, deadline, programstage, companyID, iscompleted);
                tasks.add(task);
            }
            
            //print += "TASK TABLE"+ taskid + ", " +taskname + ", "+ taskdesc + ", "+ deadline + ", " + programstage + ", "+ iscompleted;
            //System.out.println("TASK TABLE"+ taskid + ", " +taskname + ", "+ taskdesc + ", "+ deadline + ", " + programstage + ", "+ iscompleted);
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        System.out.println(tasks);
        return tasks;
    }
    
    public static ArrayList<Task> getTasksByCompanyAndStage(int programStage, int company_ID) {
        
        if(programStage == 0 || company_ID == 0){
            return null;
        }

        ArrayList<Task> tasks = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int taskid = 0;
        String taskname = "";
        String taskdesc = "";
        String deadLine = "";
        Date deadline = new Date();
        int programstage = 0;
        int companyID = 0;
        String isCompleted = "";
        boolean iscompleted = true;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from task where program_stage = ? and company_id = ? order by task_id;");
            stmt.setInt(1, programStage);
            stmt.setInt(2, company_ID);

            result = stmt.executeQuery();

            while (result.next()) {
                taskid = Integer.parseInt(result.getString("task_id"));
                taskname = result.getString("task_name");
                taskdesc = result.getString("task_description");
                deadLine = result.getString("task_deadline");
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    deadline = dateformat.parse(deadLine);
                }catch(ParseException e){
                    e.printStackTrace();
                }  
                programstage = Integer.parseInt(result.getString("program_stage"));
                companyID = Integer.parseInt(result.getString("company_id"));
                isCompleted = result.getString("is_completed");
                iscompleted = isCompleted.equals("Y");

                Task task = new Task(taskname, taskdesc, deadline, programstage, companyID, iscompleted);
                tasks.add(task);
            }
            
            //print += "TASK TABLE"+ taskid + ", " +taskname + ", "+ taskdesc + ", "+ deadline + ", " + programstage + ", "+ iscompleted;
            //System.out.println("TASK TABLE"+ taskid + ", " +taskname + ", "+ taskdesc + ", "+ deadline + ", " + programstage + ", "+ iscompleted);
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        System.out.println(tasks);
        return tasks;
    }
    
    public static boolean deleteTaskByID(int taskID){
        
        if (taskID == 0) {
            return false;
        }

        Connection conn = null;
        int numRecordsUpdated = 0;
        
        PreparedStatement stmt0 = null;

        try {
            conn = ConnectionManager.getConnection();

            //check the number of bids made by the student
            stmt0 = conn.prepareStatement("DELETE FROM task WHERE task_id = ?");
            stmt0.setInt(1, taskID);

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
    
    public static int addTask(Task task) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet count = null;
        int result = 0;
        int taskid = 0;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select count(*) from task;");
            count = stmt.executeQuery();
            count.next();
            taskid = count.getInt(1)+1;
            String status = "";
            if(task.isIsCompleted()){
                status.equals("Y");
            }else{
                status.equals("N");
            }
            stmt = conn.prepareStatement("INSERT INTO task (task_id, task_name, task_description, task_deadline, program_stage, company_id, is_completed)" + "VALUES (?, ?, ?, ?, ?, ?, ?);");
            stmt.setInt(1, taskid);
            stmt.setString(2, task.getName());
            stmt.setString(3, task.getDescription());
            stmt.setString(4, df.format(task.getDeadline()));
            stmt.setInt(5, task.getStage());
            stmt.setInt(6, task.getCompanyID());
            stmt.setString(7, status);
            
            result = stmt.executeUpdate();
          
            //print += "TASK TABLE"+ taskid + ", " +taskname + ", "+ taskdesc + ", "+ deadline + ", " + programstage + ", "+ iscompleted;
            //System.out.println("TASK TABLE"+ taskid + ", " +taskname + ", "+ taskdesc + ", "+ deadline + ", " + programstage + ", "+ iscompleted);
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, count);
        }
        return result;
    }
    
    public static int editTask(int taskid, String taskName, Date deadline, String desc, boolean isCompleted, int stage, int companyID) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        Task task = null;
        int result = 0;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        try {
            conn = ConnectionManager.getConnection();
            
            String status = "";
            if(isCompleted){
                status.equals("Y");
            }else{
                status.equals("N");
            }
            stmt = conn.prepareStatement("UPDATE task SET  task_name = ?, task_description = ?, task_deadline = ?, program_stage = ?, company_id = ?, is_completed = ? WHERE task_id = ?;");
            stmt.setString(1, taskName);
            stmt.setString(2, desc);
            stmt.setString(3, df.format(deadline));
            stmt.setInt(4, stage);
            stmt.setInt(5, companyID);
            stmt.setString(6, status);
            stmt.setInt(7, taskid);
            
            result = stmt.executeUpdate();
            //task = new Task(taskName, desc, deadline, stage,companyID, isCompleted);
          
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }
    public static void main(String[] args){
        Task t = TaskDAO.getTask(2);
        
        System.out.println(t.getName());
        System.out.println(t.getDescription());
        System.out.println(t.getDeadline());
        System.out.println(t.getStage());
        System.out.println(t.getCompanyID());
        System.out.println(t.isIsCompleted());
    }

}
