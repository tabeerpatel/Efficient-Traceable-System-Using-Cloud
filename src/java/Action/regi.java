/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class regi extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            String group = request.getParameter("group");
            String email = request.getParameter("mail");
            String mobile = request.getParameter("contact");
            String place = request.getParameter("place");
            Connection con = Dbcon.getCon();
            Statement st = con.createStatement();
            int i = st.executeUpdate("insert into reg values('" + user + "','" + pass + "','" + group + "','" + email + "','" + mobile + "','" + place + "','NO','" + new TrippleDes().encrypt(group) + "')");
            if (i != 0) {
                mail_Senddd.sendMail(new TrippleDes().encrypt(group), user, email);
//                String[] rec=new String[]{email};
//                new MailUtil().sendMail(rec, rec, "Group Signature key", new TrippleDes().encrypt(group));
                response.sendRedirect("Mem_Log.jsp?m=Registeration done");
            } else {
                response.sendRedirect("register.jsp?m=register error...check");
            }
        } catch (Exception ex) {
            Logger.getLogger(regi.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
