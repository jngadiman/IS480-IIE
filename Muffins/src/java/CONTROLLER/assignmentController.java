/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.CompanyDAO;
import DAO.MentorDAO;
import DAO.PreferenceDAO;
import DAO.RelationshipDAO;
import DAO.UserDAO;
import MODELS.Company;
import MODELS.Mentor;
import MODELS.Preference;
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
    
    //get all the mentors that have mentored a company with the same industry as the applying startup
    public static ArrayList<Mentor> getRecommendedMentorsByStartupIndustry(int industry_code){
        ArrayList<Mentor> mentors = new ArrayList<Mentor>();
        
        ArrayList<String> allEmails = new ArrayList<String>();
        ArrayList<Integer> companyIDs = CompanyDAO.getAllCompanyIDsByIndustry(industry_code);
        
        for(Integer i : companyIDs){
            ArrayList<String> mentorEmails = RelationshipDAO.getUniqueMentorsByCompany(i);
            for(String email : mentorEmails){
                if(allEmails.isEmpty() || !allEmails.contains(email)){
                    Mentor m = MentorDAO.getMentorByEmail(email);
                    mentors.add(m);
                    allEmails.add(email);
                }
            }
        }
        
        return mentors;
        }   

        public static ArrayList<Mentor> getAllMentorsBySkills(ArrayList<String> skills){
            ArrayList<Mentor> mentors = new ArrayList<Mentor>();

            ArrayList<String> mentorEmails = MentorDAO.getMentorsBySkills(skills);
            for(String email : mentorEmails){
                Mentor m = MentorDAO.getMentorByEmail(email);
                mentors.add(m);
            }

            return mentors;
        }
    
    public static void main(String[] args){
        ArrayList<String> skillSet = new ArrayList<String>();
        skillSet.add("Business Development");
        skillSet.add("Product Management");
        ArrayList<Mentor> mentors = assignmentController.getAllMentorsBySkills(skillSet);
        for(Mentor m : mentors){
             System.out.println(m.getEmail());
             System.out.println(m.getName());
             System.out.println(m.getSkills());
        }
    }
}
