<%-- 
    Document   : exam
    Created on : Dec 23, 2019, 12:23:04 PM
    Author     : eman
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Programming test</title>
    </head>
    <body>
        <%
            String cid = request.getParameter("id");
            String qtype = request.getParameter("qtype");
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String url = "jdbc:mysql://localhost:3300/candidate";
                String user_name = "root";
                String password = "0000";
                Connection Con = null;
                Statement stat = null;
                Con = DriverManager.getConnection(url, user_name, password);
                stat = Con.createStatement();
                
                String q = "SELECT * FROM candidate.questions where qtype = '"+qtype+"' ORDER BY RAND() LIMIT 5 ";
                ResultSet rs = stat.executeQuery(q);
                //String qtype = rs.getString("qtype");
                
                out.print("<form alig='center' action='doneexam.jsp'>");
                while(rs.next())
                {
                    out.print("<label>"+rs.getString("qtext")+"</label>");
                    out.print("<input type='checkbox' name='' id=''/>");
                    out.print("</br>");
                }
                out.print("</br>");
                out.print("<input slign='center' type='submit'></from>");
                out.print("</br>");
            }catch(Exception e){
           }
           
        %>
        
        

    </body>
</html>
