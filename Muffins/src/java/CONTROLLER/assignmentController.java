/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.RelationshipDAO;
import MODELS.Relationship;
import java.util.ArrayList;

/**
 *
 * @author Hui Min
 */
public class assignmentController {
    public static ArrayList<Relationship> getRlsOfCompany(int company_id){
        ArrayList<Relationship> requestsOfCompany = RelationshipDAO.getRelationshipsByCompany(company_id);
        return requestsOfCompany;
    }
    
    public static String addRelationship(Relationship r){
        String status = "";
        int result = RelationshipDAO.addRelationship(r);
        
        if(result == 1){
            status = "Mentor has been assigned to Mentee!";
        }else{
            status = "Please try again!";
        }
        return status;
    }
    
    public static int getNextRlsID(){
        int requestID = RelationshipDAO.getNextRelationshipID();
        return requestID;
    }
    
    public static int changeRelationshipStatus(int rlsID, String status){
        int result = RelationshipDAO.changeRelationshipStatus(rlsID, status);
        
        return result;
    }
    
    public static ArrayList<Relationship> getAllRelationshipByStatus(String status){
        ArrayList<Relationship> relationship = RelationshipDAO.getAllRelationshipsByStatus(status);
        
        return relationship;
    }
    
    public static ArrayList<Relationship> getAllRelationship(){
        ArrayList<Relationship> relationship = RelationshipDAO.getAllRelationships();
        
        return relationship;
    }
    
    public static Relationship getRelationship(int rlsID){
        Relationship r = RelationshipDAO.getRelationship(rlsID);
        return r;
    }
}
