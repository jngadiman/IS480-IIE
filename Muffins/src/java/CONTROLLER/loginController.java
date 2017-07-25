/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAO;
import MODELS.Company;
import MODELS.User;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JJAY
 */
public class loginController {
    //to validate the user before logging in
    public static User validateUser(String email, String password) {
        System.out.println("USER EMAIL IN CONTROLLER = "+email );
        User user = UserDAO.getUserByEmail(email);
        System.out.println("USER IN CONTROLLER = "+user.getName() );
        if (user != null) {
            MessageDigest crypt = null;
            try {
                String userPassword = user.getPassword();
                System.out.println(userPassword);
                crypt = MessageDigest.getInstance("SHA-256");
                crypt.reset();
                crypt.update(password.getBytes("UTF-8"));
                String hashPassword = new BigInteger(1, crypt.digest()).toString(16);
                //String userPassword = user.getPassword();
                System.out.println(hashPassword);
                if (userPassword.equals(hashPassword)) {
                    return user;
                } else {
                    return null;
                }
            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(loginController.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(loginController.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            }
        }
        return null;
    }
    
    public static User checkUser(String email){
        User user = UserDAO.getUserByEmail(email);
        return user;
    }
    
    public static String updateUserPassword(String email, String password){
        String result = UserDAO.updateUserPassword(email,password);
        return result;
    }
    
    public static String addUser(User user){
        String status = UserDAO.addUser(user);
        return status;
    }
    
    
    
    public static void main(String[] args){
        Date startDate = new Date();
        Company company = new Company(3, "Mcdonalds", "sells fast food", "to be able to be a top notch fast food company", "to be happiness to our customers", "FnB", startDate);
        User u = new User("hello123", "1234", "hello123", "hello@hotmail.com", "S9272235Y", "light_mentee", company);
        String status = loginController.addUser(u);
    }
   
}
