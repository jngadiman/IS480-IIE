/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.mail.Session;
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
@WebServlet(name = "retrieveMentorPeriodServlet", urlPatterns = {"/retrieveMentorPeriodServlet"})
public class retrieveMentorPeriodServlet extends HttpServlet {

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
        String startDate = request.getParameter("start_date");
        Date start_date = new Date();
        if(startDate != null && !startDate.isEmpty()){
            SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
            try {
                start_date = dateformat.parse(startDate);
            }catch(ParseException e){
                e.printStackTrace();
            }
        }else{
            start_date = null;
        }
        String endDate = request.getParameter("end_date");
        Date end_date = new Date();
        if(endDate != null && !endDate.isEmpty()){
            SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
            try {
                end_date = dateformat.parse(endDate);
            }catch(ParseException e){
                e.printStackTrace();
            }
        }else{
            start_date = null;
        }
        
        HttpSession session = (HttpSession) request.getSession();
        session.setAttribute("start_date", start_date);
        session.setAttribute("end_date", end_date);
        response.sendRedirect("requestForMentor.jsp");
        
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
