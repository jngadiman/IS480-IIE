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
    
    public static HashMap<ArrayList<Task>, String> addTaskToCompany(String taskName, Date deadline, String desc, boolean isCompleted, int stage, int companyID){
        
        Task task = new Task(taskName, desc, deadline, stage, companyID, isCompleted);
       
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
    
    public static HashMap<ArrayList<Task>, String> editTaskOfCompany(int taskID, String taskName, Date deadline, String desc, boolean isCompleted, int stage, int companyID){
       
       
        TaskDAO taskDAO = new TaskDAO();
        HashMap map = new HashMap<Task, String>();
        String returnMsg = "";
        int result = taskDAO.editTask(taskID, taskName, deadline, desc, isCompleted, stage,companyID);
        
        if(result == 0){
            returnMsg = "An error have occured, kindly try again!"; 
            map.put( "", returnMsg);
        }else{
            returnMsg = "Task had been edited successfully";
            map.put(taskDAO.getTasksByCompanyAndStage(stage, companyID), returnMsg);
        }
        return map;
        
    }
    
    public static void main(String[] args){
        HashMap<ArrayList<Task>, String> tasks = taskController.editTaskOfCompany(3, "byeeee", new Date(),"testing", true, 3, 122);
        if (tasks!= null){
            for(ArrayList<Task> temp: tasks.keySet()){
                for(Task t: temp){
                    System.out.println(t.getName());
                System.out.println(t.getDescription());
                System.out.println(t.getDeadline());
                System.out.println(t.getStage());
                System.out.println(t.getCompanyID());
                System.out.println(t.isIsCompleted());
                }
                 
            }
        }else{
            System.out.println("NOPE"); 
        }
    }
        
}
