/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.ContractDAO;
import MODELS.Contract;

/**
 *
 * @author Hui Min
 */
public class contractController {
    public static Contract getContract(int rlsID){
        Contract c = ContractDAO.getContract(rlsID);
        return c;
    }
    
    public static String addContract(Contract c){
        String status = "";
        int result = ContractDAO.addContract(c);
        
        if(result == 1){
            status = "Contract has been uploaded!";
        }else{
            status = "Contract could not be uploaded!";
        }
        
        return status;
    }
    
    public static String editContract(Contract c){
        String status = "";
        int result = ContractDAO.editContract(c);
        
        if(result == 1){
            status = "Contract has been uploaded!";
        }else{
            status = "Contract could not be uploaded!";
        }
        
        return status;
    }
}
