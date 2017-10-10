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
                String userType = currentUser.getUser_type();
                if(userType!=null){
                    if(userType.equals("regular_mentee") || userType.equals("light_mentee")){
                    Mentee m = menteeController.getMentee(email);
                    session.setAttribute("mentee",m);
                    }else if(userType.equals("Incubation Manager Mentor") || userType.equals("Entrepreneur Mentor") || userType.equals("Venture Capitalist Mentor") || userType.equals("Industry Professional Mentor")){
                        Mentor m = mentorController.getMentor(email);
                        session.setAttribute("mentor",m);
                    }else{
                        session.setAttribute("admin",currentUser);
                    }
                }
                
                session.setAttribute("user", currentUser);
                if(currentUser.getUser_type().equals("admin")){
                    response.sendRedirect("adminHomepage.jsp");
                }else if(currentUser.getUser_type().equals("regular_mentee") || currentUser.getUser_type().equals("light_mentee")){
                    response.sendRedirect("home.jsp");
                }else if(currentUser.getUser_type().equals("Incubation Manager Mentor") || currentUser.getUser_type().equals("Venture Capitalist Mentor") || currentUser.getUser_type().equals("Industry Professional Mentor") || currentUser.getUser_type().equals("Entrepreneur Mentor")){
                    response.sendRedirect("mentorHomepage.jsp");
                }else{
                    response.sendRedirect("index.jsp");
                }
                
            } else {
                System.out.println("USER IS NOT VALIDATED :(" );
                request.setAttribute("loginResult", "invalid email/password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("loginResult", "invalid email/password");
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
