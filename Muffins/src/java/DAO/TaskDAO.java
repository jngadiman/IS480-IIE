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
    
    public static Task getTask(int taskid, int companyID){
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String taskname = "";
        String deadLine = "";
        Date deadline = new Date();
        int programstage = 0;
        
        String isCompleted = "";
        boolean iscompleted = true;
        Task task = null;
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from task where task_id = ? and company_id =?;"); 
            stmt.setInt(1,taskid);
            stmt.setInt(2,companyID);
            
            result = stmt.executeQuery();

            while (result.next()) {
                taskid = Integer.parseInt(result.getString("task_id"));
                taskname = result.getString("task_name");
              
                
                deadLine = result.getString("task_deadline");
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                if(deadLine!=null){
                    try {
                    deadline = dateformat.parse(deadLine);
                    }catch(ParseException e){
                        e.printStackTrace();
                    }
                }else{
                    deadline = null;
                }
                
                
                programstage = Integer.parseInt(result.getString("program_stage"));
                companyID = Integer.parseInt(result.getString("company_id"));
                isCompleted = result.getString("is_completed");
                
                
                if(isCompleted.equals("Y")){
                    iscompleted = true;
                }else{
                    iscompleted = false;
                }
                
                task = new Task(taskid, taskname, deadline, programstage, companyID, iscompleted);
                System.out.println("TASK OBJECT IN DAO "+task);
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

        ArrayList<Task> tasks = new ArrayList<Task>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int taskid = 0;
        String taskname = "";
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
                deadLine = result.getString("task_deadline");
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                if(deadLine!=null){
                    try {
                    deadline = dateformat.parse(deadLine);
                    }catch(ParseException e){
                        e.printStackTrace();
                    }
                }else{
                    deadline = null;
                }
                
                programstage = Integer.parseInt(result.getString("program_stage"));
                companyID = Integer.parseInt(result.getString("company_id"));
                isCompleted = result.getString("is_completed");
                iscompleted = isCompleted.equals("Y");
                Task task = new Task(taskid, taskname, deadline, programstage, companyID, iscompleted);
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

        ArrayList<Task> tasks = new ArrayList<Task>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int taskid = 0;
        String taskname = "";
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
                deadLine = result.getString("task_deadline");
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                if(deadLine!=null){
                    try {
                    deadline = dateformat.parse(deadLine);
                    }catch(ParseException e){
                        e.printStackTrace();
                    }
                }else{
                    deadline = null;
                }
                
                programstage = Integer.parseInt(result.getString("program_stage"));
                companyID = Integer.parseInt(result.getString("company_id"));
                isCompleted = result.getString("is_completed");
                iscompleted = isCompleted.equals("Y");
                
                Task task = new Task(taskid, taskname, deadline, programstage, companyID, iscompleted);
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

        ArrayList<Task> tasks = new ArrayList<Task>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int taskid = 0;
        String taskname = "";
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
                deadLine = result.getString("task_deadline");
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                if(deadLine!=null){
                    try {
                    deadline = dateformat.parse(deadLine);
                    }catch(ParseException e){
                        e.printStackTrace();
                    }
                }else{
                    deadline = null;
                }
                
                programstage = Integer.parseInt(result.getString("program_stage"));
                companyID = Integer.parseInt(result.getString("company_id"));
                isCompleted = result.getString("is_completed");
                iscompleted = isCompleted.equals("Y");

                Task task = new Task(taskid, taskname, deadline, programstage, companyID, iscompleted);
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

        ArrayList<Task> tasks = new ArrayList<Task>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int taskid = 0;
        String taskname = "";
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
                deadLine = result.getString("task_deadline");
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                if(deadLine!=null){
                    try {
                    deadline = dateformat.parse(deadLine);
                    }catch(ParseException e){
                        e.printStackTrace();
                    }
                }else{
                    deadline = null;
                }
                
                programstage = Integer.parseInt(result.getString("program_stage"));
                companyID = Integer.parseInt(result.getString("company_id"));
                isCompleted = result.getString("is_completed");
                iscompleted = isCompleted.equals("Y");

                Task task = new Task(taskid, taskname, deadline, programstage, companyID, iscompleted);
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
    
    public static boolean deleteTaskByID(int taskID, int company){
        
        if (taskID == 0) {
            return false;
        }

        Connection conn = null;
        int numRecordsUpdated = 0;
        
        PreparedStatement stmt0 = null;

        try {
            conn = ConnectionManager.getConnection();

            //check the number of bids made by the student
            stmt0 = conn.prepareStatement("DELETE FROM task WHERE task_id = ? AND company_id = ?");
            stmt0.setInt(1, taskID);
            stmt0.setInt(2, company);

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
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        try {
            conn = ConnectionManager.getConnection();
            String status = "";
            if(task.isIsCompleted()){
                status = "Y";
            }else{
                status = "N";
            }
            
            stmt = conn.prepareStatement("INSERT INTO task (task_id, task_name, task_deadline, program_stage, company_id, is_completed)" + "VALUES (?, ?, ?, ?, ?, ?);");
            stmt.setInt(1, task.getTaskId());
            stmt.setString(2, task.getName());
            if(task.getDeadline()!=null){
                stmt.setString(3, df.format(task.getDeadline()));
            }else{
                stmt.setString(3, null);
            }
            
            //System.out.println("DEADLINEEEE"+ df.format(task.getDeadline()));
            stmt.setInt(4, task.getStage());
            stmt.setInt(5, task.getCompanyID());
            stmt.setString(6, status);
            
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
    
    public static int editTask(int taskid, String taskName, Date deadline, int stage, int companyID, boolean isCompleted) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        Task task = null;
        int result = 0;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        
        try {
            conn = ConnectionManager.getConnection();
            
            String status = "";
            if(isCompleted){
                status = "Y";
            }else{
                status = "N";
            }
            stmt = conn.prepareStatement("UPDATE task SET  task_name = ?,  task_deadline = ?, program_stage = ?, company_id = ?, is_completed = ? WHERE task_id = ?;");
            stmt.setString(1, taskName);
            stmt.setString(2, df.format(deadline));
            stmt.setInt(3, stage);
            stmt.setInt(4, companyID);
            stmt.setString(5, status);
            stmt.setInt(6, taskid);
            
            result = stmt.executeUpdate();
            //task = new Task(taskName, desc, deadline, stage,companyID, isCompleted);
          
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }
    
    public static int getNextTaskID(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int task_id = 0;
        int next = 0;
        
        try{
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from task order by task_id desc;");
            result = stmt.executeQuery();
            result.next();
            task_id = result.getInt("task_id");
            next = task_id+1;
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return next;
    }
    
    public static int completeTask(int task_id, int company) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        
        int result = 0;
        
        
        try {
            conn = ConnectionManager.getConnection();
            
           
           
            stmt = conn.prepareStatement("UPDATE task SET  is_completed = ? WHERE task_id = ? AND company_id = ?;");
            stmt.setString(1, "Y");
            stmt.setInt(2, task_id);
            stmt.setInt(3, company);
            
            
            result = stmt.executeUpdate();
            
          
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }
    
    public static int unCompleteTask(int task_id, int company) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        
        int result = 0;
        
        
        try {
            conn = ConnectionManager.getConnection();
            
           
           
            stmt = conn.prepareStatement("UPDATE task SET  is_completed = ? WHERE task_id = ? AND company_id = ?;");
            stmt.setString(1, "N");
            stmt.setInt(2, task_id);
            stmt.setInt(3, company);
            
            
            result = stmt.executeUpdate();
            
          
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }
    
    public static int updateDeadlineForTask(int task_id, int company, Date deadline){
        int result = 0;
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        Task task = null;
        
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        
        try {
            conn = ConnectionManager.getConnection();
            
            String status = "";
            stmt = conn.prepareStatement("UPDATE task SET  task_deadline = ? WHERE task_id = ? AND company_id = ?;");
            stmt.setString(1, df.format(deadline));
            stmt.setInt(2, task_id);
            stmt.setInt(3, company);
            
            result = stmt.executeUpdate();
            //task = new Task(taskName, desc, deadline, stage,companyID, isCompleted);
          
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        
        return result;
    }        
    
    
    public static ArrayList<Task> getAllPredefinedTasks(int company_id) {

        ArrayList<Task> tasks = new ArrayList<Task>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int taskid = 0;
        String taskname = "";
        
        int programstage = 0;
        
        
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from predefined_task order by task_id;"); 

            result = stmt.executeQuery();

            while (result.next()) {
                taskid = Integer.parseInt(result.getString("task_id"));
                taskname = result.getString("task_name");
                programstage = Integer.parseInt(result.getString("program_stage"));
                
                Task task = new Task(taskid, taskname, null, programstage, company_id, false);
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
            
    public static void main(String[] args){
        int result= TaskDAO.updateDeadlineForTask(101, 7, new Date());
        System.out.println(result);
    }

}
