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
        String vision = request.getParameter("vision");
        String mission = request.getParameter("mission");
        String industry = request.getParameter("industry");
        String startDate = request.getParameter("startDate");
        int stage = Integer.parseInt(request.getParameter("stage"));
        
        byte[] companyLogo = null;
        InputStream inputStream = null; // input stream of the upload file
        Part filePart = request.getPart("companyLogo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            companyLogo = IOUtils.toByteArray(inputStream);
        }
        
        Date start_date = null;
        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        
        if (startDate != null || !startDate.isEmpty()){
            try {
                start_date = df.parse(startDate);
            } catch (ParseException ex) {
                ex.printStackTrace();
            }
        }
        
        Company c = new Company(companyID, name, description, vision, mission, industry, start_date, stage, companyLogo);
        
        String status = companyController.editCompany(c);
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
