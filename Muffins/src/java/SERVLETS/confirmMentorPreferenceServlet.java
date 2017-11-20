/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.preferenceController;
import DAO.CompanyDAO;
import DAO.MentorDAO;
import MODELS.Company;
import MODELS.Mentor;
import MODELS.Preference;
import MODELS.User;
import Utility.EmailSender;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
@WebServlet(name = "confirmMentorPreferenceServlet", urlPatterns = {"/confirmMentorPreferenceServlet"})
public class confirmMentorPreferenceServlet extends HttpServlet {

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
        String need = request.getParameter("reason");
        String mentorEmail = request.getParameter("mentorEmail");
        Mentor m = MentorDAO.getMentorByEmail(mentorEmail);
        String mentorName = m.getName();
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int company_id = user.getCompanyid();
        Company c = CompanyDAO.getCompany(company_id);
        String companyName = c.getName();
        
        Preference p = new Preference(company_id, mentorEmail, null, null, need, new Date());
        String status = preferenceController.addPreference(p);
        
        //send email of the unhashed accessCode to founders
        String [] admin = {"incogiieportal@gmail.com"};
        if(EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", companyName + " have just requested for " + mentorName + " as their preferred mentor.", admin,"IIE Portal Notification")){
            System.out.println("email has been sent successfully");
        }else{
            System.out.println("email could not be sent");
        }
        
        session.setAttribute("addPreferenceStatus", status);
        response.sendRedirect("mentorAssignment.jsp");
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
