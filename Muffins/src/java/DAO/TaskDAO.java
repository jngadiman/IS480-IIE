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
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author JJAY
 */
public class TaskDAO {

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
                isCompleted = result.getString("is_completed");
                iscompleted = isCompleted.equals("Y");
                Task task = new Task(taskname, deadline, taskdesc, iscompleted, programstage);
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
    
    public static ArrayList<Task> getTasks(int programStage) {

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
                isCompleted = result.getString("is_completed");
                iscompleted = isCompleted.equals("Y");
                
                Task task = new Task(taskname, deadline, taskdesc, iscompleted, programstage);
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
        ArrayList<Task> tasks = TaskDAO.getAllTasks();
        for(Task t: tasks){
            System.out.println(t.getName());
            System.out.println(t.getDescription());
            System.out.println(t.getDeadline());
            System.out.println(t.getStage());
            System.out.println(t.isIsCompleted());
        }
    }

}
