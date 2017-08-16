/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.CompanyDAO;
import DAO.MenteeDAO;
import DAO.MentorDAO;
import DAO.UserDAO;
import MODELS.Company;
import MODELS.Mentee;
import MODELS.Mentor;
import MODELS.User;
import java.util.Date;

/**
 *
 * @author Hui Min
 */
public class profileController {
    public static User displayUserDetails(String email){
        User u = UserDAO.getUserByEmail(email);
        return u;   
    }
    
    public static String editUserDetails(User u){
        String status = "";
        int result = UserDAO.editUser(u);
        if(result == 1){
            status = "Changes have been saved successfully!";
        }else{
            status = "Changes could not be saved!";
        }
        
        return status;
    }
    
    public static String editMentee(Mentee m){
        String status = "";
        
        int result = MenteeDAO.editMenteeDetails(m);
        if(result == 1){
            status = "Changes have been saved successfully!";
        }else{
            status = "Changes could not be saved!";
        }
        
        return status;
    }
    
    public static String editMentor(Mentor m){
        String status = "";

        int result = MentorDAO.editMentorDetails(m);
        if(result == 1){
            status = "Changes have been saved successfully!";
        }else{
            status = "Changes could not be saved!";
        }

        return status;
    }
    
    public static Company displayCompanyDetails(int companyID){
        Company c = CompanyDAO.getCompany(companyID);
        return c;
    }
    
    public static String editCompanyDetails(Company c){
        String status = "";
        int result = CompanyDAO.editCompanyDetails(c);
        if(result > 0){
            status = "Success!";
        }else{
            status = "Fail!";
        }
        return status;
    }
    
    public static void main(String[] args){
        Mentee m = new Mentee("huimin1@hotmail.com", "abc123", "huimin1", "S7657328Y", null, "mentee", 1, "light" , "economics", 2010, "huimin@hotmail.com");
        String result = profileController.editMentee(m);
        System.out.println(result);
        
        
//        Company c = profileController.displayCompanyDetails(1);
//        System.out.println(c.getId());
//        System.out.println(c.getName());
//        System.out.println(c.getDescription());
//        System.out.println(c.getVision());
//        System.out.println(c.getMission());
//        System.out.println(c.getIndustry());
//        System.out.println(c.getStartDate());
//        System.out.println(c.getCurrentStage());
//        Date startDate = new Date();
//        Company c = new Company(1, "kfc", "sells chicken", "to sell as many chicken as possible", "to sell the best quality chicken ever!", "FnB", startDate, 1);
//        String status = profileController.editCompanyDetails(c);
//        System.out.println(status);

//        User u = profileController.displayUserDetails("kobebeef@msn.com");
//        System.out.println(u.getEmail());
//        System.out.println(u.getPassword());
//        System.out.println(u.getName());
//        System.out.println(u.getNric());
//        System.out.println(u.getProfile_pic());
//        System.out.println(u.getUser_type());
//        System.out.println(u.getCompanyid());

//            User u = new User("kobebeef@msn.com", "food", "Kobe Beef13", "S1234567Z", null, "regular_mentee", 1);
//            String status = profileController.editUserDetails(u);
//            System.out.println(status);
    }
    
}
