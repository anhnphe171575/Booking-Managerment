/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.User;
import dal.DBContext;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author msi
 */
public class LoginServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        request.getRequestDispatcher("Login.jsp").forward(request, response);
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
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String rem = request.getParameter("rem");
        DBContext db = new DBContext();
        ArrayList<User> infoUser = db.getInfoUser();
        boolean authenticated = false;
         for(User u : infoUser) {
           if (u.getUsername().trim().equals(user) && u.getPassword().trim().equals(pass)) {
               authenticated = true;
               HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("permission", u.getPermission());
                session.setAttribute("name", u.getFname()+" "+ u.getLname());
                session.setAttribute("userid", u.getUserid());
                session.setMaxInactiveInterval(60 * 60 * 60 * 24);
                Cookie userName = new Cookie("user", user);
                Cookie password = new Cookie("pass", pass);
                Cookie re = new Cookie("rem", rem);
                if (rem != null) {
                    userName.setMaxAge(60 * 60 * 60 * 24);
                    password.setMaxAge(60 * 60 * 60 * 24);
                    re.setMaxAge(60 * 60 * 60 * 24);
                } else {
                    userName.setMaxAge(0);
                    password.setMaxAge(0);
                    re.setMaxAge(0);
                }
                response.addCookie(userName);
                response.addCookie(password);
                response.addCookie(re);
                response.sendRedirect("home");
           }
      }
        if(!authenticated){
        request.setAttribute("Error", "Wrong user name or password");
       doGet(request, response);
        }
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
