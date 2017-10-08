/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.CompanyDAO;
import DAO.PreferenceDAO;
import MODELS.Company;
import MODELS.Preference;
import MODELS.Relationship;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Hui Min
 */
public class preferenceController {
    public static String addPreference(Preference p){
        String status = "";
        int result = PreferenceDAO.addPreference(p);
        
        if(result == 0){
            status = "Preference could not be added!";
        }else{
            status = "Preference has been sent successfully!";
        }
        
        return status;
    }
    
    public static String editPreference(Preference p){
        int result = PreferenceDAO.editPreference(p);
        String status = "";
        
        if(result == 1){
            status = "Preference has been edited!";
            Relationship r = new Relationship(relationshipController.getNextRlsID(), p.getCompany_id(), p.getMentor_email(),"incubation", p.getStart_date(), p.getEnd_date(), "requesting");
            status += relationshipController.addRelationship(r);
        }else{
            status = "Preference could not be edited!";
        }
        
        return status;
    }
    
    public static String deletePreference(int companyID, String mentorEmail){
        String status = "";
        boolean result = PreferenceDAO.deletePreference(companyID, mentorEmail);
        
        if(result){
            status = "Preference has been removed!";
        }else{
            status = "Preference has not been removed!";
        }
        
        return status;
    }
    
    public static Preference getPreference(int companyID, String mentorEmail){
        Preference p = PreferenceDAO.getPreference(companyID, mentorEmail);
        return p;
    }
    
    public static ArrayList<Preference> getUnapprovedPreferences(){
        ArrayList<Preference> preferences = PreferenceDAO.getUnApprovedPreferences();
        return preferences;
    }
    
    public static ArrayList<Preference> getAllPreferences(){
        ArrayList<Preference> preferences = PreferenceDAO.getAllPreferences();
        return preferences;
    }
    
    public static ArrayList<Preference> getPreferencesOfCompany(int companyID){
        ArrayList<Preference> preferences = PreferenceDAO.getPreferencesOfCompany(companyID);
        return preferences;
    }       
    
    public static ArrayList<Company> getCompaniesWPreference(){
        ArrayList<Company> companies = new ArrayList<Company>();
        ArrayList<Preference> preferences = PreferenceDAO.getAllPreferences();
        for(Preference p: preferences){
            int company_id = p.getCompany_id();
            Company c = CompanyDAO.getCompany(company_id);
            companies.add(c);
        }
        
        return companies;
    }
    
    public static Preference getPreferenceByCompany(int companyID){
        Preference p = PreferenceDAO.getPreferenceByCompany(companyID);
        return p;
    }
    
    public static void main(String[] args){
//        Preference p = new Preference(4, "mentor2@hotmail.com", new Date(), new Date(), "Revenue Model", new Date());
//        String status = preferenceController.editPreference(p);
//        System.out.println(status);
        Preference p = preferenceController.getPreferenceByCompany(7);
        System.out.println(p.getCompany_id());
        System.out.println(p.getMentor_email());
        System.out.println(p.getStart_date());
        System.out.println(p.getEnd_date());
        System.out.println(p.getNeed());
        System.out.println(p.getDate_sent());
//        ArrayList<Preference> preferences = preferenceController.getUnapprovedPreferences();
//        for(Preference p: preferences){
//            System.out.println(p.getCompany_id());
//            System.out.println(p.getMentor_email());
//            System.out.println(p.getStart_date());
//            System.out.println(p.getEnd_date());
//            System.out.println(p.getNeed());
//            System.out.println(p.getDate_sent());
//        }
    }
}
