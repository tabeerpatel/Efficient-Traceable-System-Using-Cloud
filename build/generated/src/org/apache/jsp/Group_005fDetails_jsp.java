package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.ResultSet;
import Action.Dbcon;
import java.sql.Connection;
import java.sql.PreparedStatement;

public final class Group_005fDetails_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n");
      out.write("<!--\n");
      out.write("Design by http://www.bluewebtemplates.com\n");
      out.write("Released for free under a Creative Commons Attribution 3.0 License\n");
      out.write("-->\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("    <head>\n");
      out.write("        <title>Public Auditing</title>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n");
      out.write("        <link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <!-- CuFon: Enables smooth pretty custom font rendering. 100% SEO friendly. To disable, remove this section -->\n");
      out.write("        <script type=\"text/javascript\" src=\"js/cufon-yui.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/arial.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/cuf_run.js\"></script>\n");
      out.write("        <!-- CuFon ends -->\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"main\">\n");
      out.write("            <div class=\"header\">\n");
      out.write("                <div class=\"header_resize\">\n");
      out.write("                    <div class=\"logo\">\n");
      out.write("                        <br></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                        <img src=\"images/41.png\" />\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"menu_nav\">\n");
      out.write("                        <ul>\n");
      out.write("                            <li class=\"active\"><a href=\"Admin_hom.jsp\"><strong>Home</strong></a></li>\n");
      out.write("                            <li><a href=\"Group_Details.jsp\"><strong>User's Group</strong></a></li>\n");
      out.write("                            <li><a href=\"Log.jsp\"><strong>Log Specs</strong></a></li>\n");
      out.write("                            <li><a href=\"AdminFileDeta.jsp\"><strong>File Details</strong></a></li>\n");
      out.write("                            <li><a href=\"Group_Manager_Login.jsp\"><strong>Logout</strong></a></li>\n");
      out.write("                            \n");
      out.write("<!--                            <li><a href=\" Admin_hom.jsp\"><strong>Back</strong></a></li>-->\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"clr\"></div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"content\">\n");
      out.write("                <div class=\"content_resize\" style=\"background-image: url(images/bg1.jpg)\">\n");
      out.write("                    <form action=\"Group_View.jsp\" method=\"get\">\n");
      out.write("                        <p style=\"font-family: cursive; font-size:30px; color: white\">Pick a Group\n");
      out.write("                            <select id=\"keys\" name=\"group\" style=\"width: 220px; height: 30px;font-family:fantasy\" onchange=\"loadXMLDoc()\"> \n");
      out.write("                                <option value=\"-1\">-Choose-</option>\n");
      out.write("                                ");

                                    String sql1 = "SELECT * FROM `group` ";
                                    System.out.println(";;;;;;;;;;;;;;;" + sql1);
                                    PreparedStatement pst1 = null;
                                    Connection conn1 = null;
                                    try {
                                        conn1 = Dbcon.getCon();
                                        pst1 = conn1.prepareStatement(sql1);
                                        ResultSet rs1 = pst1.executeQuery();
                                        while (rs1.next()) {
      out.write("\n");
      out.write("                                <option value=\"");
      out.print(rs1.getString("group_name"));
      out.write('"');
      out.write('>');
      out.print(rs1.getString("group_name"));
      out.write("</option>\n");
      out.write("                                ");

                                        }
                                    } catch (Exception e) {
                                    }
      out.write("\n");
      out.write("                            </select>&nbsp;&nbsp;&nbsp;<input type=\"submit\" value=\"View\" style=\"width:80px; height: 30px;font-family:cursive\" /> </p> \n");
      out.write("                    </form>\n");
      out.write("                    <div class=\"sidebar\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"clr\"></div>\n");
      out.write("                </div>\n");
      out.write("            </div>          \n");
      out.write("            <div class=\"footer\">\n");
      out.write("                <div class=\"footer_resize\">\n");
      out.write("                   \n");
      out.write("                    <div class=\"clr\"></div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
