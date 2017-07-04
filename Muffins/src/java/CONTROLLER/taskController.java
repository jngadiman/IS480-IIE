/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import MODELS.Task;
import DAO.ProgramStageDAO;
import DAO.TaskDAO;
import java.util.ArrayList;

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
    
    public static void main(String[] args){
        ArrayList<Task> tasks = taskController.displayTasksByStage(1);
        for(Task t: tasks){
            System.out.println(t.getName());
            System.out.println(t.getDescription());
            System.out.println(t.getDeadline());
            System.out.println(t.getStage());
            System.out.println(t.getCompanyID());
            System.out.println(t.isIsCompleted());
        }
    }
        
}
