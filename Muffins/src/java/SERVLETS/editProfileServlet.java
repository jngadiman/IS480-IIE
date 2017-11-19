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
        System.out.println("EDIT PROFILE SEERVLET CHECK------- START");
        String email = request.getParameter("email");
        System.out.println("editProfileServlet get email: " + email);
        String password = request.getParameter("password");
        System.out.println("editProfileServlet get password: " + password);
        String name = request.getParameter("name");
        System.out.println("editProfileServlet get name: " + name);
        String nric = request.getParameter("nric");
        System.out.println("editProfileServlet get nric: " + nric);
        String user_type = request.getParameter("user_type");
        System.out.println("editProfileServlet get userType: " + user_type);
        String equityPercentage = request.getParameter("equityPercentage");
        System.out.println("editProfileServlet get equityPercentage: " + equityPercentage);
        String contact = request.getParameter("contactNo");
        System.out.println("editProfileServlet get contactNo: " + contact);
        String nationality = request.getParameter("nationality");
        System.out.println("editProfileServlet get nationality: " + nationality);
        String role = request.getParameter("role");
        System.out.println("editProfileServlet get role: " + role);

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
        } else {
            profilePic = displayUser.getProfile_pic();
        }
        System.out.println("editProfileServlet get profilePic " + profilePic);

        int equity = 0;
        if (equityPercentage != null && !(equityPercentage.equals(""))) {
            equity = Integer.parseInt(equityPercentage);
        }
        int number = 0;
        if (contact != null && !(contact.equals(""))) {
            number = Integer.parseInt(contact);
        }
        int companyID = Integer.parseInt(request.getParameter("companyID"));
//        User user = new User(email, password, name, nric, profilePic, user_type, companyID, role, equity, number, nationality);
//        profileController.editUserDetails(user);

        if (displayUser.getUser_type().contains("mentee")) {
            System.out.println("EDIT PROFILE SEERVLET CHECK------- IS MENTEE ");
            String degree = request.getParameter("degree");
            System.out.println("editProfileServlet get degree: " + degree);
            int yearOfGrad = Integer.parseInt(request.getParameter("yearOfGrad"));
            System.out.println("editProfileServlet get yearOfGrad: " + yearOfGrad);
            String mentor_email = request.getParameter("mentorEmail");
            System.out.println("editProfileServlet get mentorEmail: " + mentor_email);

            System.out.println("editProfileServlet submit email: " + email);
            System.out.println("editProfileServlet submit password: " + password);
            System.out.println("editProfileServlet submit name: " + name);
            System.out.println("editProfileServlet submit nric: " + nric);
            System.out.println("editProfileServlet submit profilePic " + profilePic);
            System.out.println("editProfileServlet submit user type: " + user_type);
            System.out.println("editProfileServlet submit percentage: " + equityPercentage);
            System.out.println("editProfileServlet submit contact num: " + contact);
            System.out.println("editProfileServlet submit nationality: " + nationality);
            System.out.println("editProfileServlet submit role: " + role);
            System.out.println("editProfileServlet submit degree: " + degree);
            System.out.println("editProfileServlet submit yearOfGrad: " + yearOfGrad);
            System.out.println("editProfileServlet submit mentorEmail: " + mentor_email);

            User user = new User(email, password, name, nric, displayUser.getJoinedDate(), profilePic, user_type, companyID, role, equity, number, nationality);
            Mentee mentee = new Mentee(degree, yearOfGrad, mentor_email, email, password, name, nric, displayUser.getJoinedDate(), profilePic, user_type, companyID, role, equity, number, nationality);
            status = profileController.editMentee(mentee);
            session.setAttribute("user", user);
            session.setAttribute("mentee", mentee);
            request.setAttribute("updateStatus", status);

        } else if (user_type.contains("mentor")) {
            String position = request.getParameter("position");
            System.out.println("editProfileServlet get position: " + position);
            String introduction = request.getParameter("introduction");
            System.out.println("editProfileServlet get introduction: " + introduction);
            String bankAccount = request.getParameter("bank_account");
            System.out.println("editProfileServlet get bank_account: " + bankAccount);
            String skills = request.getParameter("skills");
            System.out.println("editProfileServlet get skills: " + skills);

            System.out.println("editProfileServlet submit email: " + email);
            System.out.println("editProfileServlet submit password: " + password);
            System.out.println("editProfileServlet submit name: " + name);
            System.out.println("editProfileServlet submit nric: " + nric);
            System.out.println("editProfileServlet submit profilePic " + profilePic);
            System.out.println("editProfileServlet submit user type: " + user_type);
            System.out.println("editProfileServlet submit percentage: " + equityPercentage);
            System.out.println("editProfileServlet submit contact num: " + contact);
            System.out.println("editProfileServlet submit nationality: " + nationality);
            System.out.println("editProfileServlet submit role: " + role);
            System.out.println("editProfileServlet submit position: " + position);
            System.out.println("editProfileServlet submit introduction: " + introduction);
            System.out.println("editProfileServlet submit bank_account: " + bankAccount);
            System.out.println("editProfileServlet submit skills: " + skills);

            User user = new User(email, password, name, nric, displayUser.getJoinedDate(), profilePic, user_type, companyID, role, equity, number, nationality);
            Mentor m = new Mentor(position, introduction, bankAccount, skills, email, password, name, nric, displayUser.getJoinedDate(), profilePic, user_type, companyID, role, equity, number, nationality);
            status = profileController.editMentor(m);
            session.setAttribute("user", user);
            session.setAttribute("mentor", m);
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
