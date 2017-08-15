/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.CompanyDAO;
import DAO.MenteeDAO;
import DAO.UserDAO;
import MODELS.Company;
import MODELS.Mentee;
import MODELS.User;
import java.util.Date;

/**
 *
 * @author Hui Min
 */
public class registrationController {
    public static String addUser(User user){
        String status = UserDAO.addUser(user);
        return status;
    }
    
    public static int getNextCompanyID(){
        int companyID = CompanyDAO.getNextCompanyID();
        return companyID;
    }
    
    public static String addCompany(Company c){
        String status = CompanyDAO.addCompany(c);
        System.out.println("controller: " + c.getStartDate());
        return status;
    }
    
    public static int addMentee(Mentee m){
        int result = MenteeDAO.addMentee(m);
        
        return result;
    }
    
    public static void main(String[] args){
        int companyID = registrationController.getNextCompanyID();
        System.out.println(companyID);
    }
    
    
}
