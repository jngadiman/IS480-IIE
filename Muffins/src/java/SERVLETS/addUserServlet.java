/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.companyController;
import CONTROLLER.loginController;
import CONTROLLER.profileController;
import CONTROLLER.registrationController;
import DAO.CompanyDAO;
import MODELS.Company;
import MODELS.Mentee;
import MODELS.User;
import java.util.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author JJAY
 */
@WebServlet(name = "addUserServlet", urlPatterns = {"/addUserServlet"})
public class addUserServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        User currentUser;
        HashMap<String, String> errorMessages = new HashMap<String, String>();

        //companyID from register page
        String comp = request.getParameter("company");
        int companyID = 0;
        String founders = "";
        Company company = null;
        if (comp != null && !(comp.equals(""))) {
            companyID = Integer.parseInt(comp);
            company = companyController.getCompany(companyID);
            founders = profileController.getFoundersEmails(company);
        } else {
            return;
        }

        String name = request.getParameter("name");
        if (name == null || name.equals("")) {
            errorMessages.put("name", "Name cannot be blank!");
        }


        String email = request.getParameter("email");
        if (email == null || email.equals("")) {
            errorMessages.put("email", "Email cannot be blank!");

        } else if (!email.contains("@")) {
            errorMessages.put("email", "Email is not valid, it should contain @!");
        } else if (!founders.contains(email)) {
            errorMessages.put("email", "Email is not applicable for " + company.getName() + "!");
        }
        String accessCode = request.getParameter("access_code");

        if (accessCode == null || accessCode.equals("")) {
            errorMessages.put("accessCode", "Invalid Access Code");
        } else {
            accessCode = accessCode.trim();
            System.out.println("ACCESS CODE IS ----- "+ accessCode);
        }
        String password = request.getParameter("password");
        String confirmPwd = request.getParameter("confirm_password");
        if (password == null || password.equals("") || confirmPwd == null || confirmPwd.equals("")) {
            errorMessages.put("passwords", "Passwords cannot be blank!");
        } else {
            password = password.trim();
            confirmPwd = confirmPwd.trim();
            if (password.length() < 8 || password.length() > 24) {
                errorMessages.put("passwords", "Password must be between 8-24 characters long!");
            } else if (!password.equals(confirmPwd)) {
                errorMessages.put("passwords", "Password do not match!");
            }
        }

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

        String role = request.getParameter("role");
        String equityPercentage = request.getParameter("percentage");
        int equity = 0;
        if (equityPercentage != null && !equityPercentage.equals("")) {
            equity = Integer.parseInt(equityPercentage);
            if (equity <= 0 || equity > 100) {
                errorMessages.put("percentage", "Please enter a number from 1 to 100!");
            }
        }

        String contact = request.getParameter("contact");
        String nationality = request.getParameter("nationality");
        String user_type = request.getParameter("user_type");
        String course = request.getParameter("course");
        if (course.equals("-- select one --")) {
            course = "";
        }
        String yrOfGrad = request.getParameter("yrOfGrad");
        String errorMsg = "";

        int yearOfGrad = 0;
        if (yrOfGrad != null && !(yrOfGrad.equals(""))) {
            yearOfGrad = Integer.parseInt(yrOfGrad);
        }

        int number = 0;
        if (contact != null && !(contact.equals(""))) {
            number = Integer.parseInt(contact);
        }

        if (!errorMessages.isEmpty()) {
            request.setAttribute("errorMessages", errorMessages);
            RequestDispatcher rd = request.getRequestDispatcher("registerIncubationUser.jsp?id="+companyID);
            rd.forward(request, response);
        } else {

            //validate if the access code is correct
            currentUser = loginController.validateUser(email, accessCode);
            if (currentUser == null) {
                //user is not validated
                errorMessages.put("passwords", "Invalid email/access code!");
                request.setAttribute("errorMessages", errorMessages);
                RequestDispatcher rd = request.getRequestDispatcher("registerIncubationUser.jsp?id="+companyID);
                rd.forward(request, response);

            } else {
                User user = new User(email, password, name, nric, new Date(), profilePic, user_type, companyID, role, equity, number, nationality);
                Mentee mentee = new Mentee(course, yearOfGrad, null, email, password, name, nric, new Date(), profilePic, user_type, companyID, role, equity, number, nationality);

                //edit user instead of add user because the user is added once activated
                int status = registrationController.editUser(user);
                loginController.updateUserPassword(email, password);
                int result = registrationController.addMentee(mentee);
                if (result == 1 && status == 1) {
                    request.setAttribute("status", "Registration is successful!");
                }
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
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
