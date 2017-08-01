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
    
    public static int getNextTaskID(){
        int taskID = TaskDAO.getNextTaskID();
        return taskID;
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
    
    public static String addTaskToCompany(Task task){
        String returnMsg = "";
        int result = TaskDAO.addTask(task);
        
        if(result == 0){
            returnMsg = "An error have occured, kindly try again!"; 
        }else{
            returnMsg = "Task had been added successfully";
        }
        return returnMsg;
        
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
        int taskID = taskController.getNextTaskID();
        Date deadline = new Date();
        Task task = new Task(taskID, "eat, sleep, play!", "eat yummy food, sleep like a pig and play like nobody's business!", deadline, 1, 2, true);
        String result = taskController.addTaskToCompany(task);
        System.out.println(result);
    }
        
}
