/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.TaskDAO;
import java.util.Date;

/**
 *
 * @author Hui Min
 */
public class minutesController {
    public static String updateDeadline(int taskID, Date deadline){
        int result = TaskDAO.updateDeadlineForTask(taskID, deadline);
        String status = "";
        
        if(result == 1){
            status = "Deadline is updated!";
        }else{
            status = "Deadline is not updated!";
        }
        
        return status;
    }
    
    public static void main(String[] args){
        String status = minutesController.updateDeadline(102, new Date());
        System.out.println(status);
    }
}
