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
    
    public static Task displayTask(int taskID, int companyID){
       return TaskDAO.getTask(taskID, companyID);
       
    }
    
    public static int getNextTaskID(){
        int taskID = TaskDAO.getNextTaskID();
        return taskID;
    }
    
    public static boolean deleteTask(int taskID, int company){
        
        boolean taskDeleted = TaskDAO.deleteTaskByID(taskID, company);
       
        return taskDeleted;
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
    
     public static String editTaskOfCompany(int taskID, String taskName, Date deadline, int stage, int companyID, boolean isCompleted){
       
       
        
        String returnMsg = "";
        int result = TaskDAO.editTask(taskID, taskName, deadline, stage, companyID, isCompleted);
        System.out.println(result);
        if(result == 0){
            returnMsg = "An error have occured, kindly try again!";
        }else{
            returnMsg = "Task had been edited successfully";
        }
        
        return returnMsg;
        
    }
     
    public static String completeTask(int task_id, int company){
        String returnMsg = "";
        int result = TaskDAO.completeTask(task_id, company);
        System.out.println(result);
        if(result == 0){
            returnMsg = "An error have occured, kindly try again!";
        }else{
            returnMsg = "Task had been edited successfully";
        }
        return returnMsg;
    }
     public static ArrayList<Task> getAllPredefinedTasks(int company_id){
        ArrayList<Task> tasks = TaskDAO.getAllPredefinedTasks(company_id);
        
        return tasks;
    }
     public static ArrayList<Task> getAllPredefinedTasksByStage(int company_id, int stageNo){
        ArrayList<Task> tasks = TaskDAO.getAllPredefinedTasksByStage(company_id, stageNo);
        
        return tasks;
    }
    
    public static void main(String[] args){
        ArrayList<Task> tasks = taskController.displayTasksByStageAndCompany(1, 15);
        for(Task t: tasks){
            System.out.println(t.getName());
        }
    }
        
}
