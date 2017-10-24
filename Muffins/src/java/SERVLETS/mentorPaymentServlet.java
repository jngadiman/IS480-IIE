/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.mentorController;
import CONTROLLER.minutesController;
import CONTROLLER.paymentController;
import MODELS.MeetingMinutes;
import MODELS.Mentor;
import MODELS.Payslip;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JJAY
 */
@WebServlet(name = "mentorPaymentServlet", urlPatterns = {"/mentorPaymentServlet"})
public class mentorPaymentServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");

        //String path = getServletContext().getRealPath("/");

//        System.out.println("testing BEFORE-------------------------------------------");
//        System.out.println(path);
        //path = path.substring(0, path.length() - 9) + "web";
        String path = "http:\\52.221.210.214\\Muffins\\web";

        System.out.println("testing -------------------------------------------");
        System.out.println(path);
        String status = "";
        String mentor_email = request.getParameter("mentor_email");
        String monthStr = request.getParameter("month");
        String yearStr = request.getParameter("year");
        String companyid = request.getParameter("company_id");
        String voucher_path = "";
        Mentor mentor = mentorController.getMentor(mentor_email);

        int month = 0;
        if (monthStr != null) {
            month = Integer.parseInt(monthStr);
        }
        int year = 0;
        if (yearStr != null) {
            year = Integer.parseInt(yearStr);
        }

        ArrayList<MeetingMinutes> mins = new ArrayList<MeetingMinutes>();
        //view the number of meeting minutes and the minutes for the month first
        //then after that generate (will download)

        if (companyid != null && !companyid.equals("")) {

            int id = Integer.parseInt(companyid);

            //generate and print one payslip
            Payslip payslip = paymentController.generatePayslip(month, year, mentor_email, id);
            System.out.println("VOUCHER NUMBER = "+payslip.getVoucherNumber());
            
            String returnMsg = "";
            voucher_path = paymentController.printPayslip(payslip, path);
            System.out.println("VOUCHER PATH = "+voucher_path);
//                    if (results!=null&&results.size()!=0){
//                        voucherPath = results.get(0);
//                        returnMsg = results.get(1);
//                    }
            String result = paymentController.addVoucherPath(payslip.getVoucherNumber(), voucher_path);
            System.out.println("MENTOR PAYMENT ADD PATH RESULT "+ result);
            status = "Payment Generated, kindly check file!";
            
            request.setAttribute("voucher_link", path+voucher_path);
        }else{
            status = "An error occured!";
        }
        request.setAttribute("status", status);
        request.getRequestDispatcher("paymentForMentor.jsp").forward(request, response);
        
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
