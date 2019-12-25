/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author eman
 */
public class inhandler extends HttpServlet {

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
            String email = request.getParameter("email");
            String pass = request.getParameter("pword");
            
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String url = "jdbc:mysql://localhost:3300/candidate";
                String user_name = "root";
                String password = "0000";
                Connection Con = null;
                Statement stat = null;

                Con = DriverManager.getConnection(url, user_name, password);
                stat = Con.createStatement();

                String q = "SELECT * FROM candidate.`signed-candi` where email = '" + email + "' ";
                ResultSet rs = stat.executeQuery(q);
                
//UPDATE `candidate`.`signed-candi` SET `stat`='not' WHERE `cid`='4';

                if (rs.next()) {
                    if(rs.getString("email").equals(email) && rs.getString("pword").equals(pass)){
                        if(rs.getString("stat").equals("wait")){
                            response.sendRedirect("view.jsp");
                        }
                        else if(rs.getString("stat").equals("approv")){
                            String cid = rs.getString("cid");
                            HttpSession session = request.getSession();
                            session.setAttribute("cid", cid);

                            response.sendRedirect("approved.jsp");                            
                        }
                        else if(rs.getString("stat").equals("not")){
                            response.sendRedirect("notapproved.html");                            
                        }
                    }
                } else {
                    response.sendRedirect("signin.html");
                }
                rs.close();
                stat.close();
                Con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

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
