/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.profileController;
import MODELS.Mentee;
import MODELS.Mentor;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hui Min
 */
@WebServlet(name = "editProfileServlet", urlPatterns = {"/editProfileServlet"})
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
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String nric = request.getParameter("nric");
        String user_type = request.getParameter("user_type");
        String profilePhoto = request.getParameter("profilePhoto");
        int companyID = Integer.parseInt(request.getParameter("companyID"));
                
        if(profilePhoto.isEmpty()){
            profilePhoto = request.getParameter("profile_photo");
        }
        
        if(user_type.equals("mentee")){
            String mentee_type = request.getParameter("menteeType");
            String degree = request.getParameter("degree");
            int yearOfGrad = Integer.parseInt(request.getParameter("yearOfGrad"));
            String mentor_email = request.getParameter("mentorEmail");
            
            Mentee m = new Mentee(email, password, name, nric, profilePhoto, user_type, companyID, mentee_type, degree, yearOfGrad, mentor_email);
            status = profileController.editMentee(m);
            request.setAttribute("updateStatus", status);
            
        }else if(user_type.equals("mentor")){
            String position = request.getParameter("position");
            String introduction = request.getParameter("introduction");
            
            Mentor m = new Mentor(email, password, name, nric, profilePhoto, user_type, companyID, position, introduction);
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
