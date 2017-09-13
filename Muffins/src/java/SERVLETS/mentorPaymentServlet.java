/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.mentorController;
import CONTROLLER.minutesController;
import CONTROLLER.paymentController;
import MODELS.MeetingMinutes;
import MODELS.Mentor;
import MODELS.Payslip;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.*;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JJAY
 */
@WebServlet(name = "mentorPaymentServlet", urlPatterns = {"/mentorPaymentServlet"})
public class mentorPaymentServlet extends HttpServlet {

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
        
        String mentor_email = request.getParameter("mentor_email");
        String monthStr = request.getParameter("month");
        String yearStr = request.getParameter("year");
        String [] companies = request.getParameterValues("company_id");
        Mentor mentor = mentorController.getMentor(mentor_email);
        
        int month = 0;
        if(monthStr!=null){
            month = Integer.parseInt(monthStr);
        }
        int year = 0;
        if(yearStr!=null){
            year = Integer.parseInt(yearStr);
        }
        
        ArrayList<MeetingMinutes> mins = new ArrayList<MeetingMinutes>();
        
        
        if(companies!=null && companies.length!=0){
            for(String c: companies){
                int id = Integer.parseInt(c);
                
                //generate and print one payslip
                Payslip payslip = paymentController.generatePayslip(month, year, mentor_email, id);
                paymentController.printPayslip(payslip);
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
