/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.menteeController;
import CONTROLLER.assignmentController;
import CONTROLLER.preferenceController;
import MODELS.Preference;
import MODELS.Relationship;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hui Min
 */
@WebServlet(name = "adminPendingRequestServlet", urlPatterns = {"/adminPendingRequestServlet"})
public class adminPendingRequestServlet extends HttpServlet {

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
        int result = 0;
        String status = "";
        
        //get mentee details frm the relationship using the company
        
        if(request.getParameter("approveBtn") != null){
            
            int company_id = Integer.parseInt(request.getParameter("company_id"));
            String mentor_email = request.getParameter("mentor_email");
            
            Preference p = preferenceController.getPreference(company_id, mentor_email);
            
            //get values from pop up for the start and end date of the assignment period
            //store in the mentor preference object

            status = preferenceController.editPreference(p);
            
        }else if(request.getParameter("rejectBtn") != null){
            //need send email to the mentees to inform of failure
            int company_id = Integer.parseInt(request.getParameter("company_id"));
            String mentor_email = request.getParameter("mentor_email");
            
            Preference p = preferenceController.getPreference(company_id, mentor_email);
            
        }else if(request.getParameter("editBtn") != null){
            //change mentor and start date and end date
            //get from pop up box
            int company_id = Integer.parseInt(request.getParameter("company_id"));
            String mentor_email = request.getParameter("mentor_email");
            
            Preference p = preferenceController.getPreference(company_id, mentor_email);
        }
        
        response.sendRedirect("adminViewAllRequests.jsp");
        
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
