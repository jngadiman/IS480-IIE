/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.CompanyDAO;
import DAO.RelationshipDAO;
import DAO.UserDAO;
import MODELS.Company;
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
    
    public static ArrayList<Company> getNoMentorCompanies(){
        ArrayList<Company> noMentorCompanies = new ArrayList<Company>();
        ArrayList<Integer> companiesWMentor = RelationshipDAO.getCompanyIDsWithMentor();
        ArrayList<Integer> companies = UserDAO.getRegularCompanyIDs();
        
        for(int i = 0; i < companies.size(); i++){
            Integer company_id = companies.get(i);
            for(Integer j: companiesWMentor){
                if(company_id == j){
                    companies.remove(company_id);
                    i++;
                }
            }
        }
        
        for(Integer i: companies){
            Company c = CompanyDAO.getCompany(i);
            noMentorCompanies.add(c);
        }
        
        return noMentorCompanies;
    }
    
    public static void main(String[] args){
        ArrayList<Company> companies = assignmentController.getNoMentorCompanies();
        for(Company c : companies){
             System.out.println(c.getId());
             System.out.println(c.getName());
             System.out.println(c.getAcraFile());
        }
    }
}
