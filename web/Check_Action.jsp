<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page import="Action.Dbcon"%>
<%
    String q = request.getParameter("name");
    String y = request.getParameter("group");
    String j = request.getParameter("fname");
    String b = request.getParameter("filek");
    Connection con = Dbcon.getCon();
    Statement st = con.createStatement();
    String query1 = "select * from upload  where filename = '" + j + "' ";
    ResultSet rs = st.executeQuery(query1);
    while(rs.next()) {
        String er = rs.getString("filename");
        String ty = rs.getString("key_");
        String tp = rs.getString("gro");
        String jk = rs.getString("user");
        if (q.equals(jk) && y.equals(tp) && j.equals(er) && b.equals(ty)) {
              out.println("<p style='margin-left:550px;margin-top:100px;font-family: cursive '>Verified</p>");
              request.getRequestDispatcher("Success.jsp").forward(request, response);
        }
        else{
             out.println("<p style='margin-left:550px;margin-top:100px;font-family: cursive '>Error!</p>");
             request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
        }
%>