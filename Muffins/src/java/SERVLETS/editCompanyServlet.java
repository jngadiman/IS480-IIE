/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.companyController;
import MODELS.Company;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "editCompanyServlet", urlPatterns = {"/editCompanyServlet"})
@MultipartConfig(maxFileSize = 16177215)
public class editCompanyServlet extends HttpServlet {

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
        int companyID = Integer.parseInt(request.getParameter("companyID"));
        String name = request.getParameter("companyName");
        String description = request.getParameter("description");
        String shareholders = request.getParameter("shareholders");
        int numFullTime = Integer.parseInt(request.getParameter("num_fulltime"));
        int numPartTime = Integer.parseInt(request.getParameter("num_parttime"));
        int industry = Integer.parseInt(request.getParameter("industry"));
        //String startDate = request.getParameter("startDate");
        
//        Date start_date = null;
//        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        
//        if (startDate != null || !startDate.isEmpty()){
//            try {
//                start_date = df.parse(startDate);
//            } catch (ParseException ex) {
//                ex.printStackTrace();
//            }
//        }
        
        //int stage = Integer.parseInt(request.getParameter("current-stage"));
        
        Company c = companyController.getCompany(companyID);
        
        byte[] companyLogo = null;
        InputStream inputStream = null; // input stream of the upload file
        Part filePart = request.getPart("companyLogo");
        if (filePart.getSubmittedFileName() != null && !filePart.getSubmittedFileName().isEmpty()) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            companyLogo = IOUtils.toByteArray(inputStream);
        }else{
            companyLogo = c.getCompanyLogo();
        }
        
        String productDiff = request.getParameter("product_differentiation");
        String revenueModel = request.getParameter("revenue_model");
        String traction = request.getParameter("traction");
        String deployOfFunds = request.getParameter("deployment_of_funds");
        
        byte[] biz_slides = null;
        InputStream inputStream1 = null; // input stream of the upload file
        Part filePart1 = request.getPart("biz_slides");
        if (filePart1.getSubmittedFileName() != null && !filePart1.getSubmittedFileName().isEmpty()) {
            // prints out some information for debugging
            System.out.println(filePart1.getName());
            System.out.println(filePart1.getSize());
            System.out.println(filePart1.getContentType());
             
            // obtains input stream of the upload file
            inputStream1 = filePart1.getInputStream();
            biz_slides = IOUtils.toByteArray(inputStream1);
        }else{
            biz_slides = c.getAgreementForm();
        }
        
        String [] stakeholders = shareholders.split(",");
        
        System.out.println(c.getId());
        System.out.println(c.getName());
        System.out.println(c.getDescription());
        System.out.println(c.getFullTimers());
        System.out.println(c.getPartTimers());
        System.out.println(c.getIndustry());
        System.out.println(c.getStartDate());
        //System.out.println(c.getCurrentStage());
        System.out.println(c.getCompanyLogo());
        System.out.println(c.getProductDiff());
        System.out.println(c.getRevenueModel());
        System.out.println(c.getTraction());
        System.out.println(c.getDeployOfFunds());
        System.out.println(c.getAcraFile());
        System.out.println(c.getBizFile());
        System.out.println(c.getAgreementForm());
        
        Company company = new Company(companyID, name, description, stakeholders, numFullTime, numPartTime, industry, c.getStartDate(), c.getCurrentStage(), companyLogo, productDiff, revenueModel, traction, deployOfFunds, c.getAcraFile(), biz_slides, c.getAgreementForm());
        
        String status = companyController.editCompany(company);
        request.setAttribute("updateStatus", status);
        
        RequestDispatcher rd = request.getRequestDispatcher("editCompanyProfile.jsp");
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
