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
import CONTROLLER.taskController;
import MODELS.Task;
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
@WebServlet(name = "confirmCompanyServlet", urlPatterns = {"/confirmCompanyServlet"})
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
        String eventSubmit = request.getParameter("eventSubmit");
        String stakeholders = request.getParameter("stakeholders");
        String companyName = request.getParameter("company");
        String company_id = request.getParameter("company_id");
        String modalCompanyID = request.getParameter("modalCompanyId");
        System.out.println("MODAL COMPANY ID= "+modalCompanyID);
        System.out.println("COMPANY ID= "+company_id);
        
        System.out.println("----CONFIRM COMPANY SERVLET---- ");
        
        int companyID = 0;
        if (company_id != null) {
            companyID = Integer.parseInt(company_id);
        }
        int modalID = 0;
        if (modalCompanyID != null) {
            modalID = Integer.parseInt(modalCompanyID);
        }
        ArrayList<String> status = new ArrayList<String>();
        //String errorMsg = "";
        String[] founders = null;
        
        if(stakeholders!= null){
            founders = stakeholders.split(","); //store all founders email
        }
        System.out.println("stakeholders: " + stakeholders);
        if(founders != null){
            for(String s : founders){
                System.out.println("inside for loop" + s);
            }
        }
        
        if(activated!=null &&!activated.equals("")){
            System.out.println("USER IS ACTIVATED");
            //generates a random access code
            String accessCode = registrationController.randomPassword();
            System.out.println("ACCESS CODE" + accessCode);
            
            //add the founder emails into Users table with the password as accesscode
            for(String s: founders){
                User u = new User(s, accessCode, companyID);
                registrationController.addUser(u);
                System.out.println("USERS IN CONFIRM COMPANY SERVLET "+u);
            }
            
            //change stage of the company to 1
            companyController.changeCompanyStage(1, companyID);
            
            //add the predefined tasks here
            ArrayList<Task> predefined_task = taskController.getAllPredefinedTask(companyID);
            if (predefined_task!=null){
                for(Task t : predefined_task){
                    taskController.addTaskToCompany(t);
                }
            }
            
            
            //send email of the unhashed accessCode to founders
            if(EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", "Congratulations, "+companyName+ " have been accepted into IIE Incubation. \n Kindly click on this link to register below with the access code provided: \n Access Code: "+accessCode+" \n Registeration Link: http://54.179.181.136/Muffins/registerIncubationUser.jsp?id="+companyID, founders,"IIE Portal Enrollment Results")){
                System.out.println("email has been sent successfully");
            }else{
                System.out.println("email could not be sent");
            }

            //send email to EIR and admin
            String [] admin = {"jiatung1218@gmail.com"};
            if(EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", companyName+ " have been accepted into IIE Incubation.", admin, "IIE Portal Notification")){
                System.out.println("email has been sent successfully");
            }else{
                System.out.println("email could not be sent");
            }
            
            
            status.add("Company is accepted into Incubation. Activation Email is sent to the founders!");
            request.setAttribute("status", status);
            request.getRequestDispatcher("confirmCompany.jsp").forward(request, response);
           
        }else if(declined!=null &&!declined.equals("")){
            System.out.println("COMPANY IS DELETED");
            //send email of the decline message to founders
            if(EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", "I regret to inform you that, "+companyName+ " have not been accepted into IIE Incubation. ",founders, "IIE Portal Enrollment Results")){
                System.out.println("email has been sent successfully");
            }else{
                System.out.println("email could not be sent");
            }
            
            status.add("Company is declined, an email will be sent to the founders.");
            //delete the company from company table
            companyController.deleteCompany(companyID);
            
            
            request.setAttribute("status", status);
            request.getRequestDispatcher("confirmCompany.jsp").forward(request, response);
            
        }else if(eventSubmit!=null &&!eventSubmit.equals("")){
                String eventName = request.getParameter("eventName");
                String eventVenue = request.getParameter("eventVenue");
                String eventTime = request.getParameter("eventTime");
                System.out.println("company id: " + company_id);
                
                System.out.println("EVENT NAME"+eventName);
                System.out.println("EVENT VENUE"+eventVenue);
                System.out.println("EVENT TIME"+eventTime);
            
                companyController.changeCompanyStage(5, modalID);
                for(String s : founders){
                    System.out.println(s);
                }
                
            //send email of the unhashed accessCode to founders
            if(EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", "Congratulations, "+companyName+ " have been shortlisted to join IIE Incubation Programme. \n It will be held on the 21/09/2017, 12PM at SMU BIG Meeting Room. Please come 15 minutes early to ensure that you get a chance to pitch! " + eventName + " will be at " + eventVenue + " at " + eventTime, founders,"IIE Portal Enrollment Results")){
                System.out.println("email has been sent successfully");
            }else{
                System.out.println("email could not be sent");
            }

            //send email to EIR and admin
            String [] admin = {"jiatung1218@gmail.com"};
            if(EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", companyName+ " have been shortlisted into IIE Incubation.", admin, "IIE Portal Notification")){
                System.out.println("email has been sent successfully");
            }else{
                System.out.println("email could not be sent");
            }
            
            
            status.add("Company has been shortlisted to join the Incubation Programme. Activation Email is sent to the founders!");
            request.setAttribute("status", status);
            request.getRequestDispatcher("confirmCompany.jsp").forward(request, response);
            
            
        }else{
            status.add("An error had occured!");
            request.setAttribute("status", status);
            request.getRequestDispatcher("confirmCompany.jsp").forward(request, response);
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
