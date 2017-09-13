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
import Utility.EmailSender;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
        
        if(request.getParameter("approve") != null){
            
            int company_id = Integer.parseInt(request.getParameter("company_id"));
            String mentor_email = request.getParameter("mentor_email");
            
            Preference p = preferenceController.getPreference(company_id, mentor_email);
            
            //get values from pop up for the start and end date of the assignment period
            Date start_date = null;
            SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            
            String startDate = request.getParameter("start_date");
            if (startDate != null || !startDate.isEmpty()){
                 try {
                    start_date = df.parse(startDate);
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
            }
            
            Date end_date = null;
            String endDate = request.getParameter("end_date");
            if (endDate != null || !endDate.isEmpty()){
                 try {
                    end_date = df.parse(endDate);
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
            }
            
            //store in the mentor preference object
            Preference pref = new Preference(company_id, mentor_email, start_date, end_date, p.getNeed(), p.getDate_sent());
            status = preferenceController.editPreference(pref);
            
            if(status.equals("Preference has been edited!")){
                //send email of the unhashed accessCode to founders
//                if(EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", "Congratulations, have been accepted into IIE Incubation. \n Kindly click on this link to register below with the access code provided: \n Access Code: "+accessCode+" \n Registeration Link: http://localhost:8084/Muffins/registerIncubationUser.jsp?id="+companyID, founders,"IIE Portal Enrollment Results")){
//                    System.out.println("email has been sent successfully");
//                }else{
//                    System.out.println("email could not be sent");
//                }

                //send email to EIR and admin
                String [] admin = {"jiatung1218@gmail.com"};
//                if(EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", companyName+ " have been accepted into IIE Incubation.", admin, "IIE Portal Notification")){
//                    System.out.println("email has been sent successfully");
//                }else{
//                    System.out.println("email could not be sent");
//                }
            }
            
             
            request.setAttribute("status", status);
            
        }else if(request.getParameter("rejectBtn") != null){
            //need send email to the mentees to inform of failure
            int company_id = Integer.parseInt(request.getParameter("company_id"));
            String mentor_email = request.getParameter("mentor_email");
            
            Preference p = preferenceController.getPreference(company_id, mentor_email);
            
        }else if(request.getParameter("edit") != null){
            //change mentor and start date and end date
            //get from pop up box
            int company_id = Integer.parseInt(request.getParameter("company_id"));
            String mentor_email = request.getParameter("mentor_email");
            
            Preference p = preferenceController.getPreference(company_id, mentor_email);
            
            //get values from pop up for the start and end date of the assignment period
            Date start_date = null;
            SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            
            String startDate = request.getParameter("start_date");
            if (startDate != null || !startDate.isEmpty()){
                 try {
                    start_date = df.parse(startDate);
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
            }
            
            Date end_date = null;
            String endDate = request.getParameter("end_date");
            if (endDate != null || !endDate.isEmpty()){
                 try {
                    end_date = df.parse(endDate);
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
            }
            
            //store in the mentor preference object
            Preference pref = new Preference(company_id, mentor_email, start_date, end_date, p.getNeed(), p.getDate_sent());
            status = preferenceController.editPreference(pref);
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
