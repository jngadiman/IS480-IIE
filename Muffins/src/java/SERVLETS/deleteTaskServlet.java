/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.taskController;
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
 * @author JJAY
 */
@WebServlet(name = "deleteTaskServlet", urlPatterns = {"/deleteTaskServlet"})
public class deleteTaskServlet extends HttpServlet {

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
        String task_id = request.getParameter("task_id");
        int taskID = 0;
        String errorMsg = "";
        
        if (task_id==null||task_id.equals("")){
       
            errorMsg = "No task is selected to delete";
            request.setAttribute("errorMsg", errorMsg);
            RequestDispatcher rd = request.getRequestDispatcher("stages.jsp");
            rd.forward(request, response);
        }
        taskID = Integer.parseInt(task_id);
        boolean result = taskController.deleteTask(taskID);
        if(result){
            String successMsg = "Task ID: " + taskID + " has been deleted successfully.";
            request.setAttribute("successMsg", successMsg);
            RequestDispatcher rd = request.getRequestDispatcher("stages.jsp");
            rd.forward(request, response);
        }else{
            errorMsg = "Task ID: " + taskID + " has not been deleted.";
            request.setAttribute("errorMsg", errorMsg);
            RequestDispatcher rd = request.getRequestDispatcher("stages.jsp");
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
