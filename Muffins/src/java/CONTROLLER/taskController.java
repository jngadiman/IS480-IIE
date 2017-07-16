/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import MODELS.*;
import DAO.*;
import java.util.*;

/**
 *
 * @author Hui Min
 */
public class taskController {
    
    public static ArrayList<Task> displayTasksByStageAndCompany(int programStage, int company_id){
        ArrayList<Task> tasks = TaskDAO.getTasksByCompanyAndStage(programStage, company_id);
        
        return tasks;
    }
    
    public static ArrayList<Task> displayTasksByStage(int programStage){
        ArrayList<Task> tasks = TaskDAO.getTasksByProgramStage(programStage);
        
        return tasks;
    }
    
    public static ArrayList<Task> displayTasksByCompany(int company_id){
        ArrayList<Task> tasks = TaskDAO.getTasksByCompany(company_id);
        
        return tasks;
    }
    
    public static Task displayTask(int taskID){
        Task task = null;
        
        if(taskID == 0){
            return task;
        }
        task = TaskDAO.getTask(taskID);
        return task;
    }
    
    public static String deleteTask(int taskID){
        String returnMsg = "";
        boolean taskDeleted = TaskDAO.deleteTaskByID(taskID);
        
        if(taskDeleted){
            returnMsg = "Task ID: " + taskID + " has been deleted successfully.";
        }else{
            returnMsg = "Task ID: " + taskID + " has not been deleted.";
        }
        
        return returnMsg;
    }
    
    public static HashMap<ArrayList<Task>, String> addTaskToCompany(int taskid, String taskName, Date deadline, String desc, boolean isCompleted, int stage, int companyID){
        
        Task task = new Task(taskid, taskName, desc, deadline, stage, companyID, isCompleted);
       
        TaskDAO taskDAO = new TaskDAO();
        HashMap map = new HashMap<ArrayList<Task>, String>();
        String returnMsg = "";
        int result = taskDAO.addTask(task);
        
        if(result == 0){
            returnMsg = "An error have occured, kindly try again!"; 
            map.put( "", returnMsg);
        }else{
            returnMsg = "Task had been added successfully";
            map.put( taskDAO.getTasksByCompanyAndStage(stage, companyID), returnMsg);
        }
        return map;
        
    }
    
     public static String editTaskOfCompany(int taskID, String taskName, String desc, Date deadline, int stage, int companyID, boolean isCompleted){
       
       
        TaskDAO taskDAO = new TaskDAO();
        String returnMsg = "";
        int result = taskDAO.editTask(taskID, taskName, desc, deadline, stage, companyID, isCompleted);
        System.out.println(result);
        if(result == 0){
            returnMsg = "An error have occured, kindly try again!";
        }else{
            returnMsg = "Task had been edited successfully";
        }
        
        return returnMsg;
        
    }
    
    public static void main(String[] args){
        Date date = new Date();
        Task task = new Task(1, "nsdklanvcq", "csklnnvcan-abcd", date, 1, 1, false);
        System.out.println(taskController.editTaskOfCompany(task.getTaskId(), task.getName(), task.getDescription(), task.getDeadline(), 1, 1, false));
        
    }
        
}
