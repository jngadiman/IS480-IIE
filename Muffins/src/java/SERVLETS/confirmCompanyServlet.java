/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.companyController;
import CONTROLLER.loginController;
import CONTROLLER.menteeController;
import CONTROLLER.registrationController;
import MODELS.User;
import Utility.EmailSender;
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
public class confirmCompanyServlet extends HttpServlet {

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
        String stakeholders = request.getParameter("stakeholders");
        String companyName = request.getParameter("company");
        String company_id = request.getParameter("company_id");
        ArrayList<String> status = new ArrayList<String>();
        //String errorMsg = "";
        String[] founders = null;
        
        if(stakeholders!= null){
            founders = stakeholders.split(","); //store all founders email
        }
        
        if(activated!=null && !activated.equals("")){
            //generates a random access code
            String accessCode = registrationController.randomPassword();
            System.out.println("ACCESS CODE" + accessCode);
            //add the founder emails into Users table with the password as accesscode
                for(String s: founders){
                    registrationController.addUser(new User(s, accessCode));
                }
            
            
        //send email of the unhashed accessCode to founders
        if(EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", "Congratulations, "+companyName+ " have been accepted into IIE Incubation. Kindly click on this link to register and provide the access code attached: "+accessCode, founders)){
            System.out.println("email has been sent successfully");
        }else{
            System.out.println("email could not be sent");
        }
        
        //send email to EIR and admin
        String [] admin = {"jiatung1218@gmail.com"};
        if(EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", companyName+ " have been accepted into IIE Incubation.", admin)){
            System.out.println("email has been sent successfully");
        }else{
            System.out.println("email could not be sent");
        }
            
            
            status.add("Company is accepted into Incubation. Activation Email is sent to the founders!");
            request.setAttribute("status", status);
            request.getRequestDispatcher("confirmCompany.jsp").forward(request, response);
           
        }
        
        if(declined!=null &&!declined.equals("")){
            //delete the company from company table
            int companyID = 0;
            if (company_id!=null){
                companyID = Integer.parseInt(company_id);
            }
            companyController.deleteCompany(companyID);
            
            //send email of the decline message to founders
            if(EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", "I regret to inform you that, "+companyName+ " have not been accepted into IIE Incubation. ",founders)){
                System.out.println("email has been sent successfully");
            }else{
                System.out.println("email could not be sent");
            }
            
            status.add("Company is declined, an email will be sent to the founders.");
            request.setAttribute("status", status);
            request.getRequestDispatcher("confirmCompany.jsp").forward(request, response);
        }
        request.setAttribute("errorMsg", "An error had occured");
        request.getRequestDispatcher("confirmCompany.jsp").forward(request, response);
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
