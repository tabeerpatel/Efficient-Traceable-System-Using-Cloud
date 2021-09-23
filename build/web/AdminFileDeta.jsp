<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Action.Dbcon"%>
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
    <style>
        table{
            width: 800px;

        }
        table,tr,td{
            border-style: solid;
            border-color: salmon;
            border-collapse: collapse;
        }
    </style>
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
                            <li class="active"><a href="Admin_hom.jsp"><strong>Home</strong></a></li>
                            <li><a href="Group_Details.jsp"><strong>User's Group</strong></a></li>
                            <li><a href="Log.jsp"><strong>Log Specs</strong></a></li>
                            <li><a href="AdminFileDeta.jsp"><strong>File Details</strong></a></li>
                            <li><a href="Group_Manager_Login.jsp"><strong>Logout</strong></a></li>
                        </ul>
                    </div>
                    <div class="clr"></div>
                </div>
            </div>
            <div class="content">
                <div class="content_resize" style="height: 270px;background-image: url(images/bg1.jpg)">
                    <p style="font-family: fantasy; font-size: large;color: white; position: relative;left: 390px;">File List View</p>
                    <table align="center">
                        <tr align="center" bgcolor="salmon" style="font-family:verdana;font-size:18px;">
                            <td height="36">File name</td>
                            <td>User</td>
                            <td>Date</td>
                            <td>Delete</td>
                        </tr>
                        <%
                            String host = null, name = null, user = null, pass = null, fid = null, pdfass = null, mobile = null, gen = null, blood = null, dis = null, zip = null;
                            Connection con = null;
                            try {
                                con = Dbcon.getCon();
                                Statement st = con.createStatement();
                                String query1 = "select * from upload";
                                ResultSet rs = st.executeQuery(query1);
                                while (rs.next()) {
                                    fid = rs.getString("id");
                                    host = rs.getString("filename");
                                    name = rs.getString("date");
                                    user = rs.getString("user");
                                    session.setAttribute("fname", host);
                        %>
                        <tr align="center" style="font-family:verdana;font-size:12px;color: white"> 
                            <td> <font style="color: white"><%=host%></font> </td>
                            <td> <font style="color: white"><%=user%></font> </td>
                            <td> <font style="color: white"><%=name%></font> </td>
                            <td> <font style="color: white"><a href="admin_delete.jsp?<%=fid%>" style="color: white">Delete</a></font> </td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </table>   
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
