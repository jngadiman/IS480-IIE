/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.meetingController;
import CONTROLLER.minutesController;
import CONTROLLER.taskController;
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
@WebServlet(name = "editMeetingMinutesServlet", urlPatterns = {"/editMeetingMinutesServlet"})
public class editMeetingMinutesServlet extends HttpServlet {

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
        String minutes = request.getParameter("minutes_id");
        String title = request.getParameter("title");
        String[] tasksCompleted = request.getParameterValues("tasks_completed");
        String comments = request.getParameter("comments");
        String mentorRating = request.getParameter("mentor_rating");
        String rating_comments = request.getParameter("rating_comments");
        
        System.out.println("MENTOR RATING : "+mentorRating);

        ArrayList<String> errorMsg = new ArrayList<String>();
        ArrayList<Integer> taskIDs = new ArrayList<Integer>();
        String mentor = "";
        
        
        int meetingID = 0;
        if (meeting == null || meeting.equals("")) {
            errorMsg.add("Please Select for a Meeting");
        }else{
            meetingID = Integer.parseInt(meeting);
        }
          
        if (title == null || title.equals("")) {
            errorMsg.add("Please Key in a Title");
            return;
        }
        
        if (comments == null) {
            comments = " ";
        }
        int rating = 0;
        if (mentorRating!=null||!mentorRating.equals("")){
            rating = Integer.parseInt(mentorRating);
        }
        
        if (currentUser != null) {
            System.out.println("EDIT MINUTES SERVLET NO ERROR ------ ");
            if (currentUser.getUserType().contains("mentor")) {
                mentor = currentUser.getEmail();
            } else {
               
                Mentee current = MenteeDAO.getMenteeByEmail(currentUser.getEmail());

                mentor = current.getMentorEmail();
            }
            System.out.println("----- MENTOR ------ " +mentor);
            
            ArrayList<MeetingMinutes> meetingMinutes = new ArrayList<>();
            
            int minutesID = 0;
            
            if (minutes!=null){
                minutesID = Integer.parseInt(minutes);
            }
            
            Meeting meet = meetingController.getMeetingByMeetingID(meetingID);
            System.out.println("----- MENTOR ------ " +mentor);
            if (tasksCompleted != null && tasksCompleted.length != 0) {
                
                for (String task : tasksCompleted) {

                    int taskID = Integer.parseInt(task);
                    
                    MeetingMinutes m =new MeetingMinutes(minutesID, title, meetingID, mentor, taskID, comments, currentUser.getEmail(), rating, rating_comments);
                    System.out.println("----- MEETING MINUTES OBJECT ------ "+m);
                    meetingMinutes.add(m);
                }
            }else{
                MeetingMinutes m =new MeetingMinutes(minutesID, title, meetingID, mentor, 0, comments, currentUser.getEmail(), rating, rating_comments);
                meetingMinutes.add(m);
            }
            
            
            int status = minutesController.editMeetingMinutes(meetingMinutes);

            if (status == 0) {
                errorMsg.add("An error occured, Please try again");

            }

        }

        if (errorMsg.size() != 0) {
            request.setAttribute("status", "An error occured, Please try again!");
            request.getRequestDispatcher("editMeetingMinutes.jsp?mid="+meetingID).forward(request, response);
        } else {
            
            request.setAttribute("status", "Minutes is updated!");
            request.getRequestDispatcher("editMeetingMinutes.jsp?mid="+meetingID).forward(request, response);
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
