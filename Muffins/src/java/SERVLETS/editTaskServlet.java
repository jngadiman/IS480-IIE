/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.taskController;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "editTaskServlet", urlPatterns = {"/editTaskServlet"})
public class editTaskServlet extends HttpServlet {

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
            if(request.getParameter("Submit").equals("submit")){
            
            //get all the parameters needed to input inside the db
            int taskID = Integer.parseInt(request.getParameter("taskId"));
            String taskName = request.getParameter("taskName");
            String taskDesc = request.getParameter("taskDesc");
            String deadLine = request.getParameter("deadline");
            String stage = request.getParameter("stage");
            int companyID = Integer.parseInt(request.getParameter("companyId"));
            String iscompleted = request.getParameter("isCompleted");
            
            Date deadline = null;
            SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            int stageInt = 0;
            boolean isCompleted = true;

            if (stage != null || !stage.isEmpty()) {
                stageInt = Integer.parseInt(stage);
            }

            if (deadLine != null || !deadLine.isEmpty()){
                 try {
                    deadline = df.parse(deadLine);
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
            }
            
            //add in editTaskOfCompany method using the taskController
            String status = taskController.editTaskOfCompany(taskID, taskName, taskDesc, deadline, stageInt, companyID, isCompleted);
            request.setAttribute("updateStatus", status);
            
        }else if(request.getParameter("Cancel").equals("cancel")){
            //cancel button doesnt go anywhere after its being clicked
            request.setAttribute("updateStatus", "Cancel button is clicked");
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("stages.jsp");
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
