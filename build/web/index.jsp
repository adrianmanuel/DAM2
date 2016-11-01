<%-- 
    Document   : index
    Created on : 20-oct-2016, 16:05:22
    Author     : adrian2
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta Alumnos</title>
        <style>
            header {
                background-color:rgba(255,0,0,0.2);
                width: auto;
                height: 70px;
                text-align: center;
                font-family: sans-serif;
                font-size: 20px;
                padding-top: 35px;
            }
            td{
                background-color:rgba(255,0,0,0.2);
                border: 1px solid black;
                font: sans-serif;
            }
            table{
                border: 2px solid black;
                font: sans-serif;
            }
            tr{
                border: 4px solid black;
                font: sans-serif;
            }
            html, body {
                margin: 0;
            }
            .contenido{
                padding-left: 20px;
            }
        </style>
    </head>
    <body>
        <header>Consulta lista de alumnos </header>
        <div class="contenido">
          <h3>Selecciona el alumno a consultar y pulsa Enviar</h3>
          
          <form action="resultado.jsp">
          <select name="Alumnos">
              <option value="Selecciona alumno" selected="selected">Selecciona alumno</option>
              <option value="1">Rafael Mateu</option>
              <option value="2">Jose Martinez</option>
              <option value="3">Angel Martorell</option>
              <option value="4">Dolores Pons</option>
              <option value="5">Antonia Sanç</option>
              <option value="6">Alberto Perez</option>
              <option value="7">Jaume Frau</option>
              <option value="8">Pere Pons</option>
          
          </select>
              <input type="submit" value="Enviar">
          </form>
          <br>
          <h4>Datos Alumno</h4>
          <table>
              <tr>
                  <td>Código Alumno</td>
                  <td>Nombre Alumno</td>
              </tr>
          </table>
          <h4>Asignaturas Alumno</h4>
          <table>
              <tr>
                  <td>Código Asignatura</td>
                  <td>Nombre Asignatura</td>
              </tr>
          </table>
          <h4>Tutorias Alumno</h4>
          <table>
              <tr>
                  <td>Asignatura</td>
              </tr>
          </table>
        </div>
        
        
    </body>
</html>
