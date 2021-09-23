<%@page import="Action.Dbcon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
        <script language="JavaScript">
            function check() {
                var var1 = document.f.user.value;
                var var2 = document.f.pass.value;
                var var3 = document.f.group.value;
                var var4 = document.f.mail.value;
                var var6 = document.f.contact.value;
                var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                var mob = /^[1-9]{1}[0-9]{10}$/;
                if (var1 == "")
                {
                    alert("Enter Name");
                    document.f.name.value;
                    return false;
                }
                if (var2 == "")
                {
                    alert("Enter pass");
                    document.f.pass.value;
                    return false;
                }
                if (var3 == "")
                {
                    alert("Enter date of birth");
                    document.f.date.value;
                    return false;
                }

                if (var4 == "") {
                    alert("enter email");
                    //    document.getElementById("mails").value;
                    return false;
                }
                if (!filter.test(var4)) {
                    alert('Please provide a valid email address');
                    //   email.focus;
                    return false;
                }
                if (var5 == "")
                {
                    alert("Enter location");
                    document.f.location.value;
                    return false;
                }
                if (var6 == "") {
                    alert("enter mobile");
                    // document.getElementById("mobile").value;
                    return false;
                }
                if (isNaN(var6))
                {
                    alert("Enter Numbers Only");
                    //  document.getElementById("mobile").value;
                    return false;
                }
                if (!/^[0-9]{10}$/.test(var6)) {
                    alert("Please input exactly 10 numbers!");
                    //   document.getElementById("mobile").value;
                    return false;
                }
                if (var7 == "") {
                    alert("enter Valid card number");
                    //  document.getElementById("card").value;
                    return false;
                }

                if (isNaN(var7))
                {
                    alert("Enter card Numbers Only");
                    // document.getElementById("card").value;
                    return false;
                }
                if (!/^[0-9]{16}$/.test(var7)) {
                    alert("Please input exactly 16 numbers!");
                    // document.getElementById("card").value;
                    return false;
                }
            }
        </script> 
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
                        <ul
                            class="">
                            <li><a href="Home.jsp"><strong>Home</strong></a></li>
                            <li class="active"><a href=""><strong>Registration</strong></a></li>
                            <li><a href="Mem_Log.jsp"><strong>Group User</strong> </a></li>
                            <li><a href="Group_Manager_Login.jsp"><strong>Group Admin</strong></a></li>
                            <li><a href="PublicAudting.jsp"><strong>Third Party Auditor</strong> </a></li>
                        </ul>
                    </div>
                    <!--                    <div class="clr"></div>-->
                </div>
            </div>
            <div class="content">
                <div class="content_resize" style="background-image: url(images/bg1.jpg)">
                    <div align="center">
                        <%
                            if (request.getParameter("msg") != null) {
                                out.println("<h3>Registered Successfully..!</h3>");
                            }
                        %>
                        <center>
                            <h2 style="color: white">Member Registration</h2>
                            <fieldset style="width: 400px;border-radius: 9px;border-color: white">
                                <table>
                                    <form id="newsletter" name="f" action="regi" method="get" onsubmit="return check()">

                                        <p style="color: white"><strong>Username:</strong> &nbsp;&nbsp;<input type="text"name="user" id="name"style="font-family: fantasy;width: 180px;height: 25px "/></p>
                                        <p style="color: white"><strong>Password:</strong>  &nbsp;&nbsp;<input type="password"name="pass"id="pass"style="font-family: fantasy;width: 180px;height: 25px"/></p>
                                        <p style="color: white ">&nbsp;&nbsp;&nbsp;&nbsp;  Group : 
                                            &nbsp;&nbsp; <select id="keys" name="group" style="width: 180px; height: 25px;" onchange="loadXMLDoc()"> 
                                                <option value="-1">-Select-</option>
                                                <%
                                                    String sql1 = "SELECT * FROM `group` ";
                                                    PreparedStatement pst1 = null;
                                                    Connection conn1 = null;
                                                    try {
                                                        conn1 = Dbcon.getCon();
                                                        pst1 = conn1.prepareStatement(sql1);
                                                        ResultSet rs1 = pst1.executeQuery();
                                                        while (rs1.next()) {%>
                                                <option value="<%=rs1.getString("group_name")%>"><%=rs1.getString("group_name")%></option>
                                                <%}
                                                    } catch (Exception e) {
                                                    }%>
                                            </select>
                                        </p>
                                        <p style="color: white"> <strong>&nbsp;&nbsp;&nbsp;&nbsp;E_mail :</strong> &nbsp;&nbsp;&nbsp;
                                            <input type="text"name="mail"id="mail"style="font-family: fantasy;width: 180px;height: 25px"/></p>
                                        <p style="color: white"><strong>Contact No:</strong> 
                                            <input type="text"name="contact" id="contact"style="font-family: fantasy;width: 180px;height: 25px"/></p>  
                                        <p style="color: white"><strong>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Place:</strong>&nbsp;&nbsp;&nbsp;&nbsp; 
                                            <input type="text"name="place" id="contact"style="font-family: fantasy;width: 180px;height: 25px"/></p>  
                                       <br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="submit" name="registration" value="Register" style="font-family: fantasy;width: 100px;height: 25px;background-color: #6A7BB4;color: white" />
                                                    <input type="reset"name="cancel"style="font-family: fantasy;width: 100px;height: 25px;background-color: #6A7BB4;color: white"/></br>
                                                </form>  
                                                </table>
                                                </fieldset>
                                                </center>
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
