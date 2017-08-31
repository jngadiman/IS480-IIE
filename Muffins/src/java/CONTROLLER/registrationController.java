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
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

/**
 *
 * @author Hui Min
 */
public class registrationController {
    
    public static ArrayList<User> getAllUsers(){
        ArrayList<User> users = UserDAO.getAllUsers();
        return users;
    }
    public static int addUser(User user){
        int status = UserDAO.addUser(user);
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
    
    public static String randomPassword() {
        String CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!~@#$%^&*()";
        StringBuilder strBuilder = new StringBuilder();
        Random rnd = new SecureRandom();
        while (strBuilder.length() < 10) { // length of the random string.
            int index = (int) (rnd.nextFloat() * CHARS.length());
            strBuilder.append(CHARS.charAt(index));
        }
        String randomPwd = strBuilder.toString();
        return randomPwd;
    }
    public static void main(String[] args){
        int companyID = registrationController.getNextCompanyID();
        System.out.println(companyID);
    }
    
    
}
