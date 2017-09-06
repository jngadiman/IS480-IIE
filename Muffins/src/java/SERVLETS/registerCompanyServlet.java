/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.companyController;
import CONTROLLER.registrationController;
import MODELS.Company;
import MODELS.User;
import Utility.EmailSender;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author Hui Min
 */
@WebServlet(name = "registerCompanyServlet", urlPatterns = {"/registerCompanyServlet"})
@MultipartConfig(maxFileSize = 16177215)
public class registerCompanyServlet extends HttpServlet {

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
        int companyID = registrationController.getNextCompanyID();
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int numFullTime = Integer.parseInt(request.getParameter("fulltimer"));
        int numPartTime = Integer.parseInt(request.getParameter("parttimer"));
        int industry = Integer.parseInt(request.getParameter("industry"));
        String start_date = request.getParameter("start_date");
        String shareholders = request.getParameter("shareholders");
        int current_stage = 0; //set as 0 because this company is not accepted in incubation yet
        String companyType = request.getParameter("companyType");
        
        //check if the company name is in the database 
        ArrayList<Company> allCompanies = companyController.getAllCompanies();
        for(Company c: allCompanies){
            if(name.equals(c.getName())){
                request.setAttribute("registerCompanyStatus", "Company Name already exist!");
                if(companyType.equals("incubator")){
                    RequestDispatcher rd = request.getRequestDispatcher("registerIncubationCompany.jsp");
                    rd.forward(request, response);
                }else{
                    RequestDispatcher rd = request.getRequestDispatcher("registerOpenCompany.jsp");
                    rd.forward(request, response);
                }
                
            }
        }
        
        Date startDate = null;
        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        try {
            startDate = df.parse(start_date);
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        
        byte[] companyLogo = null;
        InputStream inputStream = null; // input stream of the upload file
        Part filePart = request.getPart("company_logo");
        if (filePart.getSubmittedFileName() != null && !filePart.getSubmittedFileName().isEmpty()) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            companyLogo = IOUtils.toByteArray(inputStream);
        }   
        
        String productDiff = request.getParameter("product_differetiation");
        String revenueModel = request.getParameter("revenue_model");
        String traction = request.getParameter("traction");
        String deployOfFunds = request.getParameter("deployment_of_funds");
        
        byte[] appForm = null;
        InputStream inputStream1 = null; // input stream of the upload file
        Part filePart1 = request.getPart("application_form");
        if(filePart1 != null){
            if (filePart1.getSubmittedFileName() != null && !filePart1.getSubmittedFileName().isEmpty()) {
                // prints out some information for debugging
                System.out.println(filePart1.getName());
                System.out.println(filePart1.getSize());
                System.out.println(filePart1.getContentType());

                // obtains input stream of the upload file
                inputStream1 = filePart1.getInputStream();
                appForm = IOUtils.toByteArray(inputStream1);
            } 
        }
        
        byte[] acraFile = null;
        InputStream inputStream2 = null; // input stream of the upload file
        Part filePart2 = request.getPart("acra_file");
        if(filePart2 != null){
            if (filePart2.getSubmittedFileName() != null && !filePart2.getSubmittedFileName().isEmpty()) {
                // prints out some information for debugging
                System.out.println(filePart2.getName());
                System.out.println(filePart2.getSize());
                System.out.println(filePart2.getContentType());

                // obtains input stream of the upload file
                inputStream2 = filePart2.getInputStream();
                acraFile = IOUtils.toByteArray(inputStream2);
            }
        }
    
        byte[] bizSlides = null;
        InputStream inputStream3 = null; // input stream of the upload file
        Part filePart3 = request.getPart("pitch_deck_slides");
        if(filePart3 != null){
            if (filePart3.getSubmittedFileName() != null && !filePart3.getSubmittedFileName().isEmpty()) {
                // prints out some information for debugging
                System.out.println(filePart3.getName());
                System.out.println(filePart3.getSize());
                System.out.println(filePart3.getContentType());

                // obtains input stream of the upload file
                inputStream3 = filePart3.getInputStream();
                bizSlides = IOUtils.toByteArray(inputStream3);
            }
        }
        String [] stakeholders = shareholders.split(",");
        Company c = new Company(companyID, name, description, stakeholders, numFullTime, numPartTime, industry, startDate, current_stage, companyLogo, productDiff, revenueModel, traction, deployOfFunds, acraFile, bizSlides, appForm);
        String status = registrationController.addCompany(c);
        
        
        
        //email admin and founders that the company is registered
        String [] admin = {"jiatung1218@gmail.com"};
        if(EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", "Dear founders of "+name+ ", \n Application to IIE is currently being proccessed, we will send you an email once the application is accepted! \n Thank you! ", stakeholders, "IIE Portal Application Success")){
            System.out.println("email has been sent successfully");
        }else{
            System.out.println("email could not be sent");
        }
        
        if(EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", "Dear EIR, \n"+name+ " has applied to IIE. \n Kindly review the company details through the portal \n Thank you!", admin, "IIE Portal Notification")){
            System.out.println("email has been sent successfully");
        }else{
            System.out.println("email could not be sent");
        }
        
        
        if(companyType.equals("incubator")){
            request.setAttribute("registerCompanyStatus", status);
            RequestDispatcher rd = request.getRequestDispatcher("registerIncubationCompany.jsp");
            rd.forward(request, response);
        }else{
            request.setAttribute("registerCompanyStatus", status);
            RequestDispatcher rd = request.getRequestDispatcher("registerOpenCompany.jsp");
            rd.forward(request, response);
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
