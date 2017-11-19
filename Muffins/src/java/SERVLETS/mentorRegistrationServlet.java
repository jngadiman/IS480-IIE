/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.companyController;
import CONTROLLER.loginController;
import CONTROLLER.mentorController;
import CONTROLLER.profileController;
import CONTROLLER.registrationController;
import MODELS.Company;
import MODELS.Mentee;
import MODELS.Mentor;
import MODELS.User;
import Utility.EmailSender;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author JJAY
 */
@WebServlet(name = "mentorRegistrationServlet", urlPatterns = {"/mentorRegistrationServlet"})
public class mentorRegistrationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HashMap<String, String> errorMessages = new HashMap<String, String>();

        String user_type = request.getParameter("user_type");
        String email = request.getParameter("email");
        if (email == null || email.equals("")) {
            errorMessages.put("email", "Email cannot be blank!");

        } else if (!email.contains("@")) {
            errorMessages.put("email", "Email is not valid, it should contain @!");
        }

        String name = request.getParameter("name");
        if (name == null || name.equals("")) {
            errorMessages.put("name", "Name cannot be blank!");
        }

        //password needs to random and sent to email of person
        String nric = request.getParameter("nric");
        String alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        if (nric != null && !nric.equals("")) {
            if (nric.length() != 9 || alphabets.indexOf(nric.charAt(0)) == -1 || alphabets.indexOf(nric.charAt(8)) == -1) {
                errorMessages.put("nric", "Invalid NRIC!");
            }

        }
        byte[] profilePic = null;
        InputStream inputStream = null; // input stream of the upload file
        Part filePart = request.getPart("profile_pic");
        if (filePart.getSubmittedFileName() != null && !filePart.getSubmittedFileName().isEmpty()) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            profilePic = IOUtils.toByteArray(inputStream);
        } else {
            profilePic = null;
        }

        String nationality = request.getParameter("nationality");

        String contact = request.getParameter("contact");
        int number = 0;
        if (contact != null && !(contact.equals(""))) {
            number = Integer.parseInt(contact);
        }

        String compName = request.getParameter("companyName");
        int companyID = companyController.getNextID();
        
        String position = request.getParameter("designation");
        String skills = request.getParameter("skills");
        String introduction = request.getParameter("introduction");

        //bank account
        String mailAddress = request.getParameter("mailAddress");
        String accountName = request.getParameter("accountName");
        String accountNo = request.getParameter("accountNo");
        String bankName = request.getParameter("bankName");
        String swiftCode = request.getParameter("swiftCode");
        String bankAddress = request.getParameter("bankAddress");
        String bankAccount = mailAddress + ";" + accountName + ";" + accountNo + ";" + bankName + ";" + swiftCode + ";" + bankAddress;

        if (!errorMessages.isEmpty()) {
            request.setAttribute("errorMessages", errorMessages);
            request.setAttribute("status", "An error occured, please try again!");
            RequestDispatcher rd = request.getRequestDispatcher("mentorRegistration.jsp");
            rd.forward(request, response);
        } else {
            String [] stakeHolders = {email};
            Company company = new Company(companyID, compName,stakeHolders);
            String status = registrationController.addCompany(company);
            if (status.equals("Success!")) {
                String password = registrationController.randomPassword();
                String[] admin = {"huimin.sim.2015@smu.edu.sg"};
                String[] mentor = {email};
                if (EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", "Dear " + name + ", \n You have been added into SMU IIE as a mentor. Your login details is as follows: \n Email: " + email + " \n Password: " + password + "\n Thank you! ", mentor, "SMU IIE Portal Login Detais")) {
                    System.out.println("email has been sent successfully");
                } else {
                    System.out.println("email could not be sent");
                }
                //public Mentor(String position, String introduction, String bankAccount, String skills, String email, String password, String name, String nric, Date joinedDate, byte[] profile_pic, String user_type, int companyid, String role, int equityPercentage, int contactNumber, String nationality) {x
                User user = new User(email, password, name, nric, new Date(), profilePic, user_type, companyID, position, 0, number, nationality);
                Mentor m = new Mentor(position, introduction, bankAccount, skills, email, password, name, nric, new Date(), profilePic, user_type, companyID, position, 0, number, nationality);
                int userStatus = registrationController.addUser(user);
                

                if (userStatus == 1 ) {
                    String mentorStatus = mentorController.addMentor(m);
                    
                    request.setAttribute("status", "Success!");
                    RequestDispatcher rd = request.getRequestDispatcher("mentorRegistration.jsp");
                    rd.forward(request, response);
                    
                }else{
                    companyController.deleteCompany(companyID);
                    request.setAttribute("status", "User Exist in Database! Kindly use another email.");
                    RequestDispatcher rd = request.getRequestDispatcher("mentorRegistration.jsp");
                    rd.forward(request, response);
                }
                
            }else{
                request.setAttribute("status", "An error occured while trying to add mentor's company, please try again later!");
                RequestDispatcher rd = request.getRequestDispatcher("mentorRegistration.jsp");
                rd.forward(request, response);
            }
             
        }
       

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
