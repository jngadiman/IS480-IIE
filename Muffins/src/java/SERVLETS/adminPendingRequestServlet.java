/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.menteeController;
import CONTROLLER.assignmentController;
import CONTROLLER.companyController;
import CONTROLLER.preferenceController;
import CONTROLLER.profileController;
import CONTROLLER.relationshipController;
import MODELS.Company;
import MODELS.Preference;
import MODELS.Relationship;
import MODELS.User;
import Utility.EmailSender;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
            //get values from pop up for the start and end date of the 
        //request is approved
        if(request.getParameter("approve") != null){
            
            int company_id = Integer.parseInt(request.getParameter("company_id"));
            String mentor_email = request.getParameter("mentor_email");
            
            Preference p = preferenceController.getPreference(company_id, mentor_email);
            System.out.println("COMPANY ID" + company_id);
            System.out.println("Mentor Email" + mentor_email);
            
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
            
            System.out.println("start" + start_date);
            
            Date end_date = null;
            String endDate = request.getParameter("end_date");
            if (endDate != null || !endDate.isEmpty()){
                 try {
                    end_date = df.parse(endDate);
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
            }
            System.out.println("end" + end_date);
            //store in the mentor preference object
            Preference pref = null;
            if(p != null){
                pref = new Preference(company_id, mentor_email, start_date, end_date, p.getNeed(), p.getDate_sent());
                System.out.println("hi");
                status = preferenceController.editPreference(pref);
            }else{
                pref = new Preference(company_id, mentor_email, start_date, end_date, new String("Assigned By EIR"), new Date());
                status = preferenceController.addPreference(pref);
            }
            System.out.println("need: " + pref.getNeed());
            System.out.println(pref.getCompany_id());
            
            System.out.println("status: " + status);
            if(!status.equals("")){
                //add a relationship (requesting)
//                int rlsid = relationshipController.getNextRlsID();
//                Relationship rls = new Relationship(rlsid, company_id, mentor_email, "Incubator", start_date, end_date, "requesting");
                //relationshipController.addRelationship(rls);
                //send email the assignment to the mentors, mentee and the IM
                Company company = companyController.getCompany(company_id);
                System.out.println("COMPANY: ---------"+company);
                System.out.println("MENTOR EMAIL: ---------"+mentor_email.trim());
                User mentor = profileController.getUser(mentor_email);
                System.out.println("MENTOR: ---------"+mentor);
                String founders = profileController.getFoundersEmails(company);
                String emails = mentor_email.trim()+","+founders;
                System.out.println("ADMIN PENDING REQUEST EMAILS SENDING TO: ---------"+mentor_email.trim());
                String [] toSend = emails.split(",");
                String stakeholders = profileController.getFoundersContactNumber(company);
                System.out.println("STAKEHOLDERS: "+stakeholders);
                String message = "Dear "+mentor.getName() +" and "+ company.getName()+", \n You have been paired up to each other by the EIR. We have provided the contact details below to for you to contact one another. \n\n Company Information \n Company Name : "+company.getName()+"\n Company Description : "+company.getDescription()+"\n Company Founders : "+stakeholders+"\n\n Mentor Information \n Mentor Name : "+mentor.getName()+" ( "+profileController.getUser(mentor_email).getContactNumber()+" ) ";
                if(EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", message, toSend,"IIE Portal Mentor Assignment")){
                    System.out.println("email has been sent successfully");
                }else{
                    System.out.println("email could not be sent");
                }

                //send email to EIR and admin
                String [] admin = {"jiatung1218@gmail.com","huimin.sim.2015@smu.edu.sg"};
                if(EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", company.getName()+ " have been assigned to "+ mentor.getName()+"\n Kindly remember to upload the contract in the portal", admin, "IIE Portal Notification")){
                    System.out.println("email has been sent successfully");
                }else{
                    System.out.println("email could not be sent");
                }
             
               
            }
             
            request.setAttribute("status", status);
            
        }else if(request.getParameter("rejectBtn") != null){
            //need send email to the mentees to inform of failure
            String mentor_email = request.getParameter("mentor_email");
            int company_id = Integer.parseInt(request.getParameter("company_id"));
            
            Preference p = preferenceController.getPreference(company_id, mentor_email);
            
            String deleteStatus = preferenceController.deletePreference(company_id, mentor_email);
            request.setAttribute("status", deleteStatus);
            
        }else if(request.getParameter("edit") != null){
            //change mentor and start date and end date
            //get from pop up box
            
            String mentor_email = request.getParameter("mentor_email");
            System.out.println("mentor: " + mentor_email);
            int company_id = Integer.parseInt(request.getParameter("company_id"));
            Preference p = preferenceController.getPreferenceByCompany(company_id);
            System.out.println("p: " + p);
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
            
            String need = request.getParameter("need");
            System.out.println(company_id);
            System.out.println(mentor_email);
            System.out.println(startDate);
            System.out.println(endDate);
            System.out.println(need);
            System.out.println(p.getDate_sent().toString());
            
            //store in the mentor preference object
            Preference pref = new Preference(company_id, mentor_email, start_date, end_date, need, p.getDate_sent());
            status = preferenceController.editPreference(pref);
            request.setAttribute("status", status);
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
