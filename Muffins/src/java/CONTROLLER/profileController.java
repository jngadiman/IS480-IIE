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
import java.util.HashMap;

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
        System.out.println("controller: " + u.getProfile_pic());
        if(result == 1){
            status = "Changes have been saved successfully!";
        }else{
            status = "Changes could not be saved!";
        }
        
        return status;
    }
    
    public static String editMentee(Mentee m){
        String status = "";
        int userResult = UserDAO.editUser(m);
        System.out.println("controller: " + m.getProfile_pic());
        System.out.println("profileController editMentee: " + m.getNationality());
        int result = MenteeDAO.editMenteeDetails(m);
        if(result == 1&& userResult == 1){
            status = "Changes have been saved successfully!";
        }else{
            status = "Changes could not be saved!";
        }
        
        return status;
    }
    
    public static String editMentor(Mentor m){
        String status = "";
        int userResult = UserDAO.editUser(m);
        int result = MentorDAO.editMentorDetails(m);
        if(result == 1&& userResult == 1){
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
    
    public static User getUser(String email){
        User user = UserDAO.getUserByEmail(email);
        return user;
    }
    
    public static String getFoundersContactNumber(Company comp){
        String contact = "";
        String [] stakeholders = comp.getStakeholders();
        
        if(stakeholders!=null){
            for(String email: stakeholders){
                User temp = profileController.getUser(email);
                if(temp!=null){
                    int number = temp.getContactNumber();
                    String name = temp.getName();
                    contact+= name+ " ( "+number+") \n";
                }
                
                
                
            }
        }
        return contact;
    }
    
    public static String getFoundersEmails(Company comp){
        String emails = "";
        String [] stakeholders = comp.getStakeholders();
        
        for(int x = 0; x<stakeholders.length; x++ ){
            String s = stakeholders[x].trim();
            if (x == (stakeholders.length - 1) ){
                emails+=s;
            }else{
                emails += s+",";
            }
            
        }
        return emails;
    }
    
    public static void main(String[] args){
//        Mentee m = new Mentee("huimin1@hotmail.com", "abc123", "huimin1", "S7657328Y", null, "mentee", 1, "light" , "economics", 2010, "huimin@hotmail.com");
//        String result = profileController.editMentee(m);
//        System.out.println(result);
          Company company = companyController.getCompany(7);
           System.out.println("FOUNDERS CONTACT "+ profileController.getFoundersEmails(company));
           
        
    }
    
}
