<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Current opportunities</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <div>
            <h2 align="center">The available opportunities : </h2>
            
            <table align="center">
                <tr>
                    <td>job</td>
                    <td>description</td>
                    <td>Action</td>                
                </tr>
                <tr>
                    <th>job</th>
                    <th>description</th>
                    <th><a><button>Apply</button></a></th>                
                </tr>
            </table>
        
        </div>
    </body>
</html>
