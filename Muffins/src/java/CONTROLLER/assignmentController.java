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
    
    public static ArrayList<Company> getCompaniesWNoMentorNPref(){
        ArrayList<Company> companies = new ArrayList<Company>();
        
        ArrayList<Integer> allCompanyIDs = CompanyDAO.getAllCompanyIDs();
        ArrayList<Integer> companyIDsWPref = PreferenceDAO.getAllCompanyIDsWPreference();
        ArrayList<Integer> companyIDsWMentor = RelationshipDAO.getCompanyIDsWithMentor();
        
        if(companyIDsWPref != null && companyIDsWPref.size() != 0){
            for(int i = allCompanyIDs.size()- 1; i >= 0; i--){
                Integer company_id = allCompanyIDs.get(i);
                for(int j = companyIDsWPref.size()-1; i >= 0; i--){
                    Integer companyID = companyIDsWPref.get(j);
                    if(company_id == companyID){
                        allCompanyIDs.remove(company_id);
                    }
                }
            }
        }
        
        if(companyIDsWMentor != null && companyIDsWMentor.size() != 0){
            for(int i = allCompanyIDs.size()- 1; i >= 0; i--){
                Integer company_id = allCompanyIDs.get(i);
                for(int j = companyIDsWMentor.size()-1; i >= 0; i--){
                    Integer companyID = companyIDsWMentor.get(j);
                    if(company_id == companyID){
                        allCompanyIDs.remove(company_id);
                    }
                }
            }
        }
        for(Integer i : allCompanyIDs){
            Company c = CompanyDAO.getCompany(i);
            companies.add(c);
        }
         
        return companies;
    }
        
    public static void main(String[] args){
        ArrayList<Company> companies = assignmentController.getCompaniesWNoMentorNPref();
        for(Company c : companies){
            System.out.println(c.getName());
        }
        
//        ArrayList<String> skillSet = new ArrayList<String>();
//        skillSet.add("Business Development");
//        skillSet.add("Product Management");
//        ArrayList<Mentor> mentors = assignmentController.getAllMentorsBySkills(skillSet);
//        for(Mentor m : mentors){
//             System.out.println(m.getEmail());
//             System.out.println(m.getName());
//             System.out.println(m.getSkills());
//        }
    }
}
