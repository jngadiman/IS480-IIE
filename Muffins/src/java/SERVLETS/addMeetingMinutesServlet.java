/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.meetingController;
import DAO.*;
import MODELS.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jiatung.lim
 */
@WebServlet(name = "addMeetingMinutesServlet", urlPatterns = {"/addMeetingMinutesServlet"})
public class addMeetingMinutesServlet extends HttpServlet {

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
        
        //need add in the new fields for the meetingminutes to fit into the new db
        //and call minutesController method updateDeadline(int taskID, Date deadline); 
        //to update the deadline of the task if any
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");
        String meeting = request.getParameter("meeting_id");
        String title = request.getParameter("title");
        String[] tasksCompleted = request.getParameterValues("tasks_completed");
        String comments = request.getParameter("comments");

        ArrayList<String> errorMsg = new ArrayList<String>();
        ArrayList<Integer> taskIDs = new ArrayList<Integer>();
        String mentor = "";
        boolean lightMentee = false;

        if (meeting == null || meeting.equals("")) {
            errorMsg.add("Please Select for a Meeting");
        }
        int meetingID = Integer.parseInt(meeting);
        if (title == null || title.equals("")) {
            errorMsg.add("Please Key in a Title");
        }
        if (tasksCompleted == null || tasksCompleted.length == 0) {
            errorMsg.add("Please Select a Task");
        }
        if (comments == null) {
            comments = " ";
        }

        if (currentUser != null) {
            if (currentUser.getUser_type().equals("mentor")) {
                mentor = currentUser.getEmail();
            } else {
                // if need to check, leave mentor as null?
                //mentor = null;
                Mentee current = MenteeDAO.getMenteeByEmail(currentUser.getEmail());
//                if(current.getUser_type().equals("light")){
//                    lightMentee = true;
//                }
                //mentor = MentorDAO.getMentorByEmail(current.getMentor_email());
            }

            for (String task : tasksCompleted) {
                int taskID = Integer.parseInt(task);
                taskIDs.add(taskID);
            }

            int status = meetingController.setMeetingMinutes(title, Integer.parseInt(meeting), mentor, taskIDs, comments, currentUser.getEmail());

            if (status == 0) {
                errorMsg.add("An error occured, Please try again");

            }

        }

        if (errorMsg != null || errorMsg.size() != 0) {
            request.setAttribute("status", errorMsg);
            request.getRequestDispatcher("addMeetingMinutes.jsp").forward(request, response);
        } else if (lightMentee) {
            request.setAttribute("status", "Minutes is added!");
            request.getRequestDispatcher("rateMentor.jsp").forward(request, response);
        } else {
            request.setAttribute("status", "Minutes is added!");
            request.getRequestDispatcher("addMeetingMinutes.jsp").forward(request, response);
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
