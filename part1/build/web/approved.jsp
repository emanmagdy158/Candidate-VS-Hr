<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Approved</title>
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
        <p align="center">
            We are happy to tell you that you are accepted
        </p>
        <%
            String id =request.getSession().getAttribute("ID").toString();
            session.setAttribute("ID", id);
            /*
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String url = "jdbc:mysql://localhost:3300/candidate";
                String user_name = "root";
                String password = "0000";
                Connection Con = null;
                Statement stat = null;
                Con = DriverManager.getConnection(url, user_name, password);
                stat = Con.createStatement();
                
                String q = "SELECT * FROM candidate.chosansr where cid = '"+id+"' and qtype='p' ";
                ResultSet rs = stat.executeQuery(q);
                if(rs.next()){
                    out.print(rs.getString("qn"));
                }

            }catch(Exception e){
           }
           */
        %>
        <table align="center">
            <tr>
                <td>Type</td>
                <td>deadline</td>
                <td>Action</td>
            </tr>
            <tr>
                <td>Programming</td>
                <td>29/12/2019</td>
                <td><a href="exampro.jsp?id=<%=id%>"><button>start</button></a></td>
            </tr>
            <tr>
                <td>IQ test</td>
                <td>30/12/2019</td>
                <td><a href="examiq.jsp?id=<%=id%>"><button>start</button></a></td>
            </tr>
        </table>
    </body>
</html>
