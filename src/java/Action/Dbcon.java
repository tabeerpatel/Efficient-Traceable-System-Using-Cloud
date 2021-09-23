/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Action;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jp
 */
public class Dbcon {

    public static Connection getCon() {
        Connection con = null;
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy", "root", "root");
            System.out.println("connected.....");

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Dbcon.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Dbcon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
}
