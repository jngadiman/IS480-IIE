/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.loginController;
import MODELS.User;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "changePasswordServlet", urlPatterns = {"/changePasswordServlet"})
public class changePasswordServlet extends HttpServlet {

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
        
        //HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        loginController loginController = new loginController();
        String result = "";
        
        //System.out.println("USERNAME = "+email+ "PASSWORD" +password );
        if ((!email.equals("")) && (!confirmPassword.equals(""))&& (!newPassword.equals(""))) {
            System.out.println("PASSWORDS AND EMAIL NOT NULL" );
            if (newPassword.equals(confirmPassword)){
                //to ensure that the passwords matches
                User currentUser = loginController.checkUser(email);
                if (currentUser == null) {
                    
                    System.out.println("USER IS NOT VALIDATED :(" );
                    request.setAttribute("loginResult", "Invalid email/password");
                    request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                    
                } else {
                    //to ensure user email is found in db
                    System.out.println("USER IS IN DB" );
                    result = loginController.updateUserPassword(email,newPassword);
                    
                    request.setAttribute("loginResult", result);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }else{
                request.setAttribute("loginResult", "Passwords does not match");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            }
            
        } else {
            request.setAttribute("loginResult", "Invalid email/password");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
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
