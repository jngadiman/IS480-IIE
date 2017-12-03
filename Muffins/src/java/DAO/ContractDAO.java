/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import CONTROLLER.contractController;
import Utility.ConnectionManager;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;
import MODELS.Contract;
import java.util.logging.Level;
import javax.sql.rowset.serial.SerialBlob;
/**
 *
 * @author Hui Min
 */
public class ContractDAO {
    public static Contract getContract(int relationshipID){
        Contract c = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int rlsID = 0;
        String rlsIDStr = "";
        Blob rlsContractFile = null;
        byte[] contractFile = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from contract where rlsID = ?;");
            stmt.setInt(1, relationshipID);
            result = stmt.executeQuery();
            
            while (result.next()) {
                rlsIDStr = result.getString("rlsID");
                if(rlsIDStr != null && !rlsIDStr.isEmpty()){
                    rlsID = Integer.parseInt(rlsIDStr);
                }else{
                    rlsID = 0;
                }
                rlsContractFile = result.getBlob("contractFile");
                if(rlsContractFile != null){
                    contractFile = rlsContractFile.getBytes(1, (int) rlsContractFile.length());
                }else{
                    contractFile = null;
                }
                
                c = new Contract(relationshipID, contractFile);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return c;
    }
    
    public static int addContract(Contract c){
        String status = "";
        int numRecordsUpdated = 0;
        int rlsID = c.getRlsID();
        byte[] contractFile = c.getContractFile();
        
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            
            //insert company to database
            stmt = conn.prepareStatement("Insert into Contract values (?, ?)");

            //set id
            stmt.setInt(1, rlsID);
            
            //set contract file
            if(contractFile != null){
                //convert byte[] to Blob object before putting into db
                Blob blob = new SerialBlob(contractFile);

                stmt.setBlob(2, blob);
            }else{
                stmt.setBlob(2, (Blob) null);
            }
            
            numRecordsUpdated = stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return numRecordsUpdated;
    }
    
    public static int editContract(Contract c){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        
        int result = 0;
        
        try {
            conn = ConnectionManager.getConnection();
            
            String status = "";
            
            stmt = conn.prepareStatement("UPDATE Contract SET contractFile = ? WHERE rlsID = ?;");
            
            if(c.getContractFile() != null){
                //convert byte[] to Blob object before putting into db
                Blob blob = new SerialBlob(c.getContractFile());

                stmt.setBlob(1, blob);
            }else{
                stmt.setBlob(1, (Blob) null);
            }   
            
            stmt.setInt(2, c.getRlsID());
            
            result = stmt.executeUpdate();
            //task = new Task(taskName, desc, deadline, stage,companyID, isCompleted);
          
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }
    
    public static void main(String[] args){
        Contract c = contractController.getContract(4);
        System.out.println(c.getRlsID());
        System.out.println(c.getContractFile());
    }
}
