/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.mentorController;
<<<<<<< HEAD
import CONTROLLER.preferenceController;
import CONTROLLER.requestController;
import MODELS.Mentor;
import MODELS.Preference;
import MODELS.Request;
=======
import CONTROLLER.assignmentController;
import MODELS.Mentor;
import MODELS.Relationship;
>>>>>>> 6fd4834a87ef7c7e5aaf776ceac7fb8f5d33093c
import MODELS.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
@WebServlet(name = "requestMentorServlet", urlPatterns = {"/requestMentorServlet"})
public class requestMentorServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        Mentor m = (Mentor) session.getAttribute("requestedMentor");
        User currentUser = (User) session.getAttribute("user");
        Date startDate = (Date) session.getAttribute("start_date");
        Date endDate = (Date) session.getAttribute("end_date");
        String yes = request.getParameter("yesBtn");
        if(yes != null){
<<<<<<< HEAD
            int company_id = currentUser.getCompanyid();
            Date dateSent = new Date();
            Preference p = new Preference(company_id, m.getEmail(), startDate, endDate, dateSent);
            String status = preferenceController.addPreference(p);            
>>>>>>> 6fd4834a87ef7c7e5aaf776ceac7fb8f5d33093c
            session.setAttribute("status", status);
            response.sendRedirect("requestForMentorProfile.jsp");
        }else{
            response.sendRedirect("requestForMentorProfile.jsp");
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
