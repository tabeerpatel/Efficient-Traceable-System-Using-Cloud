<%@page import="Action.TrippleDes"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
Design by http://www.bluewebtemplates.com
Released for free under a Creative Commons Attribution 3.0 License
-->
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Public Auditing</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <!-- CuFon: Enables smooth pretty custom font rendering. 100% SEO friendly. To disable, remove this section -->
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/arial.js"></script>
        <script type="text/javascript" src="js/cuf_run.js"></script>
        <!-- CuFon ends -->
    </head>
    <body>
        <%
        String ganesh="";
            session.setAttribute("uid", request.getParameter("msg"));
            String name = (String) session.getAttribute("uname");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy", "root", "root");
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("select * from reg where user = '" + request.getParameter("msg") + "'");
  while (rs.next())
  {
      ganesh= new TrippleDes().encrypt(rs.getString("group"));
  }
  System.out.println("Ganesh Key Is::"+ganesh);
          

        %>

       
        <div class="main">
            <div class="header">
                <div class="header_resize">
                    <div class="logo"><br></br>
                        <br></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <img src="images/41.png" />
                    </div>
                    <div class="menu_nav">
                        <ul>
                            <li class="active"><a href="Mem_Hom.jsp"><strong>Home</strong></a></li>
                            <li><a href="Home.jsp"><strong>LogOut</strong></a></li>
                        </ul>
                    </div>
                    <div class="clr"></div>
                </div>
            </div>
            <div class="content">
                <div class="content_resize" style="background-image: url(images/bg1.jpg)">
                    <div style="margin-left:340px; ">
                        <form action ="SignVerify" method="get">
                            <p style="font-family: monospace;font-size: large;color: white">Provide Signature Text</p>
                            <p><input value="<%=ganesh%>" type="text" name="sig" style="height:25px;width:220px;"/></p>
                            <p></p>
                            <p ><input type="submit" value="Submit" style="height:25px;width:100px;font-family: cursive" /> <input type="reset" value="Cancel" style="height:25px;width:100px;font-family: cursive" /></p>
                        </form>
                    </div> 
                    <div class="sidebar">
                    </div>
                    <div class="clr"></div>
                </div>
            </div>          
            <div class="footer">
                <div class="footer_resize">

                    <div class="clr"></div>
                </div>
            </div>
        </div>
    </body>
</html>
