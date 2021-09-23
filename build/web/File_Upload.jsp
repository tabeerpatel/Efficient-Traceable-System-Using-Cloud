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
        <style>
            #f{
                position: relative;
                left: 150px;
            }
        </style>
        <!-- CuFon ends -->
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
                            <li class="active"><a href="File_Upload.jsp"><strong>File Upload</strong></a></li>
                            <li><a href="FileDownload.jsp"><strong>File Download</strong></a></li>
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
                    <fieldset style="width: 500px;position: relative;left: 190px;border-radius: 9px;border-color: white">
                        <form name="" action="Upload" method="post" enctype="multipart/form-data">
                            <p style="font-size: 20px;position: relative;left: 120px;color: white">Upload your Files to Cloud:</p>
                            <center>
                                <input style="height: 40px;" name="file" type="file" id="file"/>
                                <input type="submit" value="Upload" style="height: 30px;width: 90px;background-color: #009933"/>
                                <input type="reset" value="Reset" style="height: 30px;width: 90px;background-color: #009933"/>
                            </center>
                        </form> 
                    </fieldset>
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
