<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IQ test</title>
        <style>
        table , th , td{
                width: 30%;
                border: 1px solid;
                cell-padding: 0;
                height: auto;
            }
            button{
                width: 60px;
                background-color: yellowgreen;
                border-radius:10px;
                border: none;
            }
            button:hover{
                width: 70px;
                background-color: red;
                transition: 0.7s;
            }
        </style>
    </head>
    <body>
        <h2 align="center">IQ test: </h2>
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
               
                out.print("<form alig='center' action='doneexam.jsp'>");
                rs.next();
                String qid = rs.getString("qid");
                String qtext = rs.getString("qtext");
                
                out.print("<h2>"+qtext+"</h2>");
                /*while(rs.next())
                {
                    out.print("<label>"+rs.getString("qtext")+"</label>");
                    out.print("</br>");
                }
                out.print("</br>");
                out.print("<input slign='center' type='submit'></from>");
                out.print("</br>");
                
*/
            }catch(Exception e){
           }   
        %>
    </body>
</html>
