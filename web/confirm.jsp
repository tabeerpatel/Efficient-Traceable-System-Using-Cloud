<%-- 
    Document   : confirm
    Created on : Sep 4, 2013, 4:29:04 PM
    Author     : jp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Public Auditing</title>
    </head>
    <body>

<SCRIPT>
var msg = "Are you sure wnat to delete ?? ";

if (confirm(msg)) 
    location.replace("Revoke.jsp");
else
    location.replace("Mem_Hom.jsp");
</SCRIPT>
    </body>
</html>
