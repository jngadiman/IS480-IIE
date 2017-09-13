/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.mentorController;
import CONTROLLER.assignmentController;
import CONTROLLER.relationshipController;
import MODELS.Mentor;
import MODELS.Relationship;
import MODELS.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hui Min
 */
@WebServlet(name = "requestForMentorViewServlet", urlPatterns = {"/requestForMentorViewServlet"})
public class requestForMentorViewServlet extends HttpServlet {

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
        String mentorEmail = request.getParameter("mentorEmail");
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");
        int company_id = currentUser.getCompanyid();
        ArrayList<Relationship> requestsOfCompany = relationshipController.getRlsOfCompany(company_id);
        boolean isCurrentMentor = false;
        
        for(Relationship r: requestsOfCompany){
            String status = r.getStatus();
            String mentor_email = r.getMentorEmail();
            if(status.equals("approved") && mentor_email.equals(mentorEmail)){
                isCurrentMentor = true;
            }
        }
        Mentor m = mentorController.getMentor(mentorEmail);
        session.setAttribute("requestedMentor", m);
        session.setAttribute("isCurrentMentor", isCurrentMentor);
        response.sendRedirect("requestForMentorProfile.jsp");
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
