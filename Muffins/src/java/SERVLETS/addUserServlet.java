/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.registrationController;
import DAO.CompanyDAO;
import MODELS.Company;
import MODELS.Mentee;
import MODELS.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "addUserServlet", urlPatterns = {"/addUserServlet"})
public class addUserServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        User currentUser;
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        //need change this add codes to validate and check
        String accessCode = request.getParameter("accessCode");
        String password = request.getParameter("password");
        String confirmPwd = request.getParameter("confirm");
        
        String nric = request.getParameter("nric");
        String comp = request.getParameter("company");
        String role = request.getParameter("role");
        String equityPercentage = request.getParameter("percentage");
        String contact= request.getParameter("contact");
        String nationality = request.getParameter("nationality");
        String user_type = request.getParameter("user_type");
        String course = request.getParameter("course");
        String yrOfGrad = request.getParameter("yrOfGrad");
        
        int companyID = 0;
        if(comp!=null&&!(comp.equals(""))){
           companyID = Integer.parseInt(comp); 
        }
        int yearOfGrad = 0;
        if(yrOfGrad!=null&&!(yrOfGrad.equals(""))){
           yearOfGrad = Integer.parseInt(yrOfGrad);
        }
        int equity = 0;
        if(equityPercentage!=null&&!(equityPercentage.equals(""))){
           equity = Integer.parseInt(equityPercentage);
        }
        int number = 0;
        if(contact!=null&&!(contact.equals(""))){
           number = Integer.parseInt(contact);
        }
        
        User user = new User(email, password, name, nric, null, user_type, companyID, role, equity, number, nationality);
        Mentee mentee = new Mentee(course, yearOfGrad, null, email, password, name, nric, null, user_type, companyID, role, equity, number, nationality);
        
        //edit user instead of add user because the user is deleted once activated
        int status = registrationController.editUser(user);
        int result = registrationController.addMentee(mentee);
        if(result==1&&status==1){
            request.setAttribute("registerStatus", "The registration is a success, an email of the login details will be sent to you once you are successfully registered into the Incubator");
        }
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
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
