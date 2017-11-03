/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.meetingController;
import MODELS.Meeting;
import MODELS.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JJAY
 */
@WebServlet(name = "meetingServlet", urlPatterns = {"/meetingServlet"})
public class meetingServlet extends HttpServlet {

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
        String meetingName = request.getParameter("meetingName");
        String location = request.getParameter("location");
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");
        String attendees = request.getParameter("attendees");
        String status = request.getParameter("status");
        User user = (User) session.getAttribute("user");
        
        System.out.println("VALUES PARSED TO THE SERVLET-------" +meetingName);
        System.out.println("VALUES PARSED TO THE SERVLET-------" +location);
        System.out.println("VALUES PARSED TO THE SERVLET-------" +startDate);
        System.out.println("VALUES PARSED TO THE SERVLET-------" +endDate);
        System.out.println("VALUES PARSED TO THE SERVLET-------" +attendees);
        System.out.println("VALUES PARSED TO THE SERVLET-------" +status);
        System.out.println("VALUES PARSED TO THE SERVLET USER INFO-------" +user.getCompanyid());
        
//        String [] emails = null;
//        if(attendees!=null&&!attendees.equals("")){
//            emails = attendees.split(",");
//        }
        //NEED TO DOUBLE CHECK THE TIME FORMAT FROM THE MODAL
        SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd hh:mm");
        Date start = null;
        Date end = null;
        try{
            if(startDate!=null&&!startDate.equals("")){
                String date = startDate.substring(0,10)+" "+startDate.substring(11,startDate.length());
                System.out.println("STARTDATE SUBSTRINGED-------" +date);
                
                start = df.parse(date);
            }
            if(endDate!=null&&!endDate.equals("")){
                String date = endDate.substring(0,10)+" "+endDate.substring(11,endDate.length());
                System.out.println("ENDDATE SUBSTRINGED-------" +date);
                end = df.parse(date);
            }
        }catch (ParseException ex) {
            ex.printStackTrace();
        }
        
        
        
        
        
        int meetingID = meetingController.getLastID();
        System.out.println("MEETING SERVLET meetingID from method getLastID-------" +meetingID);
        Meeting meeting = new Meeting(meetingID, meetingName, location, start, end, attendees, status, user.getCompanyid());
        System.out.println("MEETING SERVLET MEETING OBJECT-------" +meeting);
        String result = meetingController.addMeeting(meeting);
        System.out.println("MEETING SERVLET RESULT-------" +result);
        request.setAttribute("result", result);
        response.sendRedirect("showCalendar.jsp");
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
