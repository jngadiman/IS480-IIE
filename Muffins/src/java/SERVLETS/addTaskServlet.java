/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.taskController;
import MODELS.Task;
import MODELS.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
@WebServlet(name = "addTaskServlet", urlPatterns = {"/addTaskServlet"})
public class addTaskServlet extends HttpServlet {

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
        int taskID = taskController.getNextTaskID();
        String taskName = request.getParameter("taskName");
        String taskDescription = request.getParameter("taskDescription");
        int stage = Integer.parseInt(request.getParameter("taskStage"));
        String deadline = request.getParameter("deadline");
        
        //temp company id variable for testing --> NEED CHANGE ONCE HOMEPAGE IS UP!
        User currentUser = (User)session.getAttribute("user");
        int companyID = currentUser.getCompanyid();
        
        Date dateDeadline = null;
        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        
        boolean isCompleted = false;
        
        try {
            dateDeadline = df.parse(deadline);
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
//        int companyID = currentUser.getCompanyid();
        
        Task task = new Task(taskID, taskName, taskDescription, dateDeadline, stage, companyID, isCompleted);
        String resultMsg =  taskController.addTaskToCompany(task);
        
        request.setAttribute("status", resultMsg);
        request.getRequestDispatcher("addTask.jsp").forward(request, response);
            //String username = currentUser.getUsername();
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
