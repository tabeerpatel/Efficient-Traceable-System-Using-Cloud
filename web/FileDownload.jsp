<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Action.Dbcon"%>
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
        <style>
            table{
                width: 600px;
                
            }
            table,tr,td{
                border-style: solid;
                border-color: burlywood;
                border-collapse: collapse;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <div class="header">
                <div class="header_resize">
                    <div class="logo">
                        <br></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <img src="images/41.png" />
                    </div>
                    <div class="menu_nav">
                        <ul>
                            <li><a href="Mem_Hom.jsp"><strong>Home</strong></a></li>
                            <li><a href="File_Upload.jsp"><strong>File Upload</strong></a></li>
                            <li class="active"><a href="FileDownload.jsp"><strong>File Download</strong></a></li>
                            <li><a href="FileDetails.jsp"><strong>File Details</strong></a></li>
                            <li><a href="confirm.jsp"><strong>Leave_Group</strong></a></li>
                            <li><a href="Home.jsp"><strong>Logout</strong></a></li>
                        </ul>
                    </div>
                    <div class="clr"></div>
                </div>
            </div>
            <div class="content">
                <div class="content_resize" style="background-image: url(images/bg1.jpg)">
                    <p style="font-size: 20px;position: relative;left: 120px;color: white">Download Cloud Files :</p>
                    <table align="center">
                        <caption></caption>
                        <tr align="center" bgcolor="skyblue" style="font-family:verdana;font-size:20px;">
                            <td height="36">File name</td>
                            <td>Date & Time</td>
                            <td>Download</td>
                        </tr>
                        <%
                            String host = null, name = null, pass = null, mail = null, user_group = null, mobile = null, gen = null, blood = null, dis = null, zip = null;
                            Connection con = null;
                            try {
                                con = Dbcon.getCon();
                                Statement st = con.createStatement();
                                Statement st1 = con.createStatement();
                                String query1 = "select * from upload ";
                                ResultSet rs = st.executeQuery(query1);
                                while (rs.next()) {
                                    host = rs.getString("filename");
                                    name = rs.getString("date");
                                    session.setAttribute("fname", host);
                        %>
                        <tr align="center" style="font-family:verdana;font-size:12px;"> 
                            <td> <font style="color: white"><%=host%></font> </td>
                            <td> <font style="color: white"><%=name%></font> </td>
                            <td> <font style="color: white"><a href="download.jsp?<%=host%>"style="color: white">Download</a></font> </td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </table><br></br><br></br>      
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
