/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Action;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class Upload extends HttpServlet {

    private static final String TMP_DIR_PATH = "c:\\tmp";
    private File tmpDir;
    private static final String DESTINATION_DIR_PATH = "file";
    private File destinationDir;
    Calendar currentDate = Calendar.getInstance();
    SimpleDateFormat formatter =new SimpleDateFormat("yyyy/MMM/dd HH:mm:ss");
    String dateNow = formatter.format(currentDate.getTime());

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
            DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
            fileItemFactory.setSizeThreshold(1 * 1024 * 1024);
            fileItemFactory.setRepository(tmpDir);

            ServletFileUpload uploadHandler = new ServletFileUpload(fileItemFactory);
            Connection con = null;
            Statement st = null;
            Statement st1 = null;

            PreparedStatement pstm1 = null;
            HttpSession session = request.getSession(true);
            String getu = session.getAttribute("uid").toString();
            System.out.println("id is " + getu);
            try {
                
                String gr = null;
                con = Dbcon.getCon();
                st = con.createStatement();
                st1 = con.createStatement();
                List items = uploadHandler.parseRequest(request);
                Iterator itr = items.iterator();
                String fileName = "";
                FileItem item = (FileItem) itr.next();
                fileName = item.getName();
                System.out.println("filename " + fileName);
                int x = fileName.lastIndexOf('\\');
                String fN = fileName.substring(x + 1, fileName.length());
                System.out.println(fN);
                String get = "" + item.getInputStream();
                String str = getStringFromInputStream(item.getInputStream());
                String cipher = new TrippleDes().encrypt(str);
                System.out.println(str);

                String sq2 = "insert into upload(filename,data,date,key_,gro,user) values(?,?,?,?,?,?)";
                String sq3 = "select * from reg where user = '" + getu + "'";
                System.out.println("jjj");
                ResultSet rs3 = st.executeQuery(sq3);
                if (rs3.next()) {
                    gr = rs3.getString("group");
                }
                pstm1 = con.prepareStatement(sq2);
                pstm1.setString(1, fileName);
                Random r = new Random();
                int getKey = r.nextInt() + 5000;
                String key = "" + getKey;
                pstm1.setString(2, cipher);
                pstm1.setString(3, dateNow);
                pstm1.setString(4, new TrippleDes().encrypt(fileName));
                pstm1.setString(5, gr);
                pstm1.setString(6, getu);
                boolean sd = pstm1.execute();
                System.out.println(sd);
                if (sd != true) {
                    System.out.println("in");
                    int ii = st1.executeUpdate("insert into log values('" + getu + "','" + fileName + "','" + gr + "','Upload',now())");
                    if (ii != 0) {
                        JOptionPane.showMessageDialog(null, "File Key Is :  " + new TrippleDes().encrypt(fileName).toString());

                        response.sendRedirect("Mem_Hom.jsp?msg=file_Uploaded_Successfully");
                    } else {
                        out.println("log error");
                    }
                }
            } catch (Exception e) {
                System.out.println(e);
            }

        } catch (Exception ex) {
            Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private static String 
        getStringFromInputStream(InputStream is) {

        BufferedReader br = null;
        StringBuilder sb = new StringBuilder();

        String line;
        try {

            br = new BufferedReader(new InputStreamReader(is));
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return sb.toString();

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
