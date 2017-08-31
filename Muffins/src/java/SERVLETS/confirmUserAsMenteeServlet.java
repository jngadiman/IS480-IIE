/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.loginController;
import CONTROLLER.menteeController;
import CONTROLLER.registrationController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JJAY
 */
@WebServlet(name = "confirmUserAsMenteeServlet", urlPatterns = {"/confirmUserAsMenteeServlet"})
public class confirmUserAsMenteeServlet extends HttpServlet {

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
        
        String activated = request.getParameter("activateBtn");
        String declined = request.getParameter("rejectBtn");
        String mentee_email = request.getParameter("mentee_email");
        ArrayList<String> status = new ArrayList<String>();
        if(activated!=null && !activated.equals("")){
            //generates a random password
            String password = registrationController.randomPassword();
            System.out.println("NEW USER PASSWORD" + password);
            //need to add codes to send email to the user HERE SO THAT THE PWD SENT TO THEM IS UNHASHED
            
            loginController.updateUserPassword(mentee_email, password);
            status.add("Activation Email is sent!");
            request.setAttribute("status", status);
            request.getRequestDispatcher("confirmUserAsMentee.jsp").forward(request, response);
           
        }
        
        if(declined!=null &&!declined.equals("")){
            //delete the user from the database (mentee and user tables)
            menteeController.deleteMentee(mentee_email);
            
        }
        request.setAttribute("status", status);
        request.getRequestDispatcher("confirmUserAsMentee.jsp").forward(request, response);
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
