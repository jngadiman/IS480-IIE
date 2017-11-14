/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.profileController;
import MODELS.Mentee;
import MODELS.Mentor;
import MODELS.User;
import java.util.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author Hui Min
 */
@WebServlet(name = "editProfileServlet", urlPatterns = {"/editProfileServlet"})
@MultipartConfig(maxFileSize = 16177215)
public class editProfileServlet extends HttpServlet {

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
        String status = "";
        HttpSession session = request.getSession();
        User displayUser = (User) session.getAttribute("user");
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String nric = request.getParameter("nric");
        String user_type = request.getParameter("user_type");
        String equityPercentage = request.getParameter("percentage");
        String contact= request.getParameter("contactNo");
        String nationality = request.getParameter("nationality");
        // System.out.println("editProfileServlet: " + nationality);
        String role = request.getParameter("role");
        
        byte[] profilePic = null;
        InputStream inputStream = null; // input stream of the upload file
        Part filePart = request.getPart("profilePhoto");
        if (filePart.getSubmittedFileName() != null && !filePart.getSubmittedFileName().isEmpty()) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            profilePic = IOUtils.toByteArray(inputStream);
        }else{
           profilePic = displayUser.getProfile_pic();
        }
        
        System.out.println("Edit Profile Servlet: " + profilePic);
        
        int equity = 0;
        if(equityPercentage!=null&&!(equityPercentage.equals(""))){
           equity = Integer.parseInt(equityPercentage);
        }
        int number = 0;
        if(contact!=null&&!(contact.equals(""))){
           number = Integer.parseInt(contact);
        }
        int companyID = Integer.parseInt(request.getParameter("companyID"));
//        User user = new User(email, password, name, nric, profilePic, user_type, companyID, role, equity, number, nationality);
//        profileController.editUserDetails(user);
        
        if(displayUser.getUser_type().equals("regular_mentee")){
            
            String degree = request.getParameter("degree");
            int yearOfGrad = Integer.parseInt(request.getParameter("yearOfGrad"));
            String mentor_email = request.getParameter("mentorEmail");
            
            System.out.println(email);
            System.out.println(password);
            System.out.println(name);
            System.out.println(nric);
            System.out.println(displayUser.getJoinedDate());
            System.out.println(profilePic);
            System.out.println(user_type);
            System.out.println(companyID);
            System.out.println(role);
            System.out.println(equity);
            System.out.println(number);
            System.out.println(nationality);
            System.out.println(degree);
            System.out.println(yearOfGrad);
            System.out.println(mentor_email);
            
            User user = new User(email, password, name, nric, displayUser.getJoinedDate(), profilePic, user_type, companyID, role, equity, number, nationality);
            Mentee mentee = new Mentee(degree, yearOfGrad, mentor_email, email, password, name, nric, displayUser.getJoinedDate(), profilePic, user_type, companyID, role, equity, number, nationality);
            status = profileController.editMentee(mentee);
            session.setAttribute("user", user);
            session.setAttribute("mentee", mentee);
            request.setAttribute("updateStatus", status);
            
        }else if(user_type.equals("Incubation Manager Mentor") || user_type.equals("Venture Capitalist Mentor") || user_type.equals("Industry Professional Mentor") || user_type.equals("Entrepreneur Mentor")){
            String position = request.getParameter("position");
            String introduction = request.getParameter("introduction");
            String bankAccount = request.getParameter("bank_account");
            String skills = request.getParameter("skills");
            
            Mentor m = new Mentor(position, introduction, bankAccount, skills, email, password, name, nric, displayUser.getJoinedDate(), profilePic, user_type, companyID, role, equity, number, nationality);
            status = profileController.editMentor(m);
            request.setAttribute("updateStatus", status);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("editPersonalProfile.jsp");
        rd.forward(request, response);
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
