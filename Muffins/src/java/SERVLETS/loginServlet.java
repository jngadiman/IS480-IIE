/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import CONTROLLER.loginController;
import CONTROLLER.menteeController;
import CONTROLLER.mentorController;
import MODELS.Mentee;
import MODELS.Mentor;
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
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

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
        //response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User currentUser;
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        System.out.println("REMEMBER ME"+rememberMe);
        if (rememberMe != null&& !rememberMe.equals("")){
            if(rememberMe.equals("yes")){
                session.setAttribute("rememberMe", true);
            }
            session.setAttribute("rememberMe", false);
        }else{
            session.setAttribute("rememberMe", false);
        }
        System.out.println("USERNAME = "+email+ "PASSWORD" +password );
        if ((!email.equals("")) && (!password.equals(""))) {
            System.out.println("USERNAME AND EMAIL NOT NULL" );
            if ((currentUser = loginController.validateUser(email, password)) != null) {
                System.out.println("USER IS VALIDATED" );
                String userType = currentUser.getUserType();
                if(userType!=null){
                    if(userType.contains("mentee")){
                    Mentee m = menteeController.getMentee(email);
                    session.setAttribute("mentee",m);
                    }else if(userType.contains("mentor")){
                        Mentor m = mentorController.getMentor(email);
                        session.setAttribute("mentor",m);
                    }else{
                        session.setAttribute("admin",currentUser);
                    }
                }
                
                session.setAttribute("user", currentUser);
                if(currentUser.getUserType().contains("admin")){
                    response.sendRedirect("adminHome.jsp");
                }else if(currentUser.getUserType().contains("mentee")){
                    response.sendRedirect("home.jsp");
                }else if(currentUser.getUserType().contains("mentor")){
                    response.sendRedirect("mentorHomepage.jsp");
                }else{
                    response.sendRedirect("index.jsp");
                }
                
            } else {
                System.out.println("USER IS NOT VALIDATED :(" );
                request.setAttribute("loginResult", "Invalid email/password, Please try again.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("loginResult", "Invalid email/password, Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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