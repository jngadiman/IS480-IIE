/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.meetingController;
import CONTROLLER.minutesController;
import DAO.UserDAO;
import MODELS.MeetingMinutes;
import MODELS.Mentor;
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
 * @author jiatung.lim
 */
@WebServlet(name = "displayMeetingMinutesServletByMentor", urlPatterns = {"/displayMeetingMinutesServletByMentor"})
public class displayMeetingMinutesServletByMentor extends HttpServlet {

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
        User currentUser;
        String errorMsg = "";
        UserDAO userDAO = new UserDAO();
        String mentor_email = request.getParameter("mentor_email");
        
        if (mentor_email == null || mentor_email.equals("")){
            errorMsg = "Select a Mentor";
            request.setAttribute("errorMsg", errorMsg);
            RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
            rd.forward(request, response);
        }
       // User sub = (User) new Mentor();
//        Mentor mentor = null;
//            
//            mentor = (Mentor) (userDAO.getUserByEmail(mentor_email));
//            mentor = (Mentor)sub;
        
        ArrayList<ArrayList<MeetingMinutes>> minutes = minutesController.getMeetingMinutesOfMentor(mentor_email);
        request.setAttribute("mentorMeetingMinutes", minutes);
        System.out.println("SERVLET MEETING MINUTES" +minutes);
        RequestDispatcher rd = request.getRequestDispatcher("viewMeetingMinutes.jsp");
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
