/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.taskController;
import MODELS.Task;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hui Min
 */
@WebServlet(name = "displayTaskServlet", urlPatterns = {"/displayTaskServlet"})
public class displayTaskServlet extends HttpServlet {

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
        
        String taskID = request.getParameter("taskID");
        String stageID = request.getParameter("stageID");
        String companyID = request.getParameter("company");
        
        int company_ID = 0;
        int task_ID = 0;
        String errorMsg = "";
        
        if (taskID==null||taskID.equals("")||companyID==null||companyID.equals("")){       
            errorMsg = "Task ID or Company ID could not be retrieved!";
            request.setAttribute("errorMsgForEdit", errorMsg);
            RequestDispatcher rd = request.getRequestDispatcher("viewTasks.jsp?id="+stageID);
            rd.forward(request, response);
        }else{
            task_ID = Integer.parseInt(taskID);
            company_ID = Integer.parseInt(companyID);

            Task returnTask = taskController.displayTask(task_ID, company_ID);
            System.out.println("Inside Else tag" + returnTask.getName());
            System.out.println("Inside Else tag" + returnTask.getStage());
            System.out.println("Inside Else tag" + returnTask.getDeadline());
            request.setAttribute("taskToBeDisplayed", returnTask);
            RequestDispatcher rd = request.getRequestDispatcher("editTask.jsp");
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
