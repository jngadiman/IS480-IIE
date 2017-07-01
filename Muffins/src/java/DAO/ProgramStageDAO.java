/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.Task;
import Utility.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JJAY
 */
public class ProgramStageDAO {
    
    public static HashMap<Integer,String> getStages() {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String stagedesc = "";
        int stagenum = 0;
        HashMap<Integer,String> stages = new HashMap<Integer,String>();
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from program_stages;");
           

            result = stmt.executeQuery();

            while (result.next()) {
                
                stagenum = Integer.parseInt(result.getString("stage_name"));
                stagedesc = result.getString("stage_name");
                
                stages.put(stagenum, stagedesc);
            }
            
            //print += "TASK TABLE"+ taskid + ", " +taskname + ", "+ taskdesc + ", "+ deadline + ", " + programstage + ", "+ iscompleted;
            //System.out.println("TASK TABLE"+ taskid + ", " +taskname + ", "+ taskdesc + ", "+ deadline + ", " + programstage + ", "+ iscompleted);
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return stages;
    }
    
    public static String getStage(int stageNumber) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        String stagedesc = "";
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from program_stages where stage_no = ?;");
            stmt.setInt(1,stageNumber);

            result = stmt.executeQuery();

            while (result.next()) {
             
                stagedesc = result.getString("stage_name");
                
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return stagedesc;
    }
    
    
}
