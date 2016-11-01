<%-- 
    Document   : resultado
    Created on : 26-oct-2016, 15:32:30
    Author     : adrian2
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado Consulta Alumnos</title>
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

            <form action="resultado.jsp" method="post">
                <select name="Alumnos">
                    <option value="Selecciona alumno" selected="selected">Selecciona alumno</option>
                    <option value="1">Rafael Mateu</option>
                    <option value="2">Jose Martinez</option>
                    <option value="3"<>Angel Martorell</option>
                    <option value="4">Dolores Pons</option>
                    <option value="5">Antonia Sanç</option>
                    <option value="6">Alberto Perez</option>
                    <option value="7">Jaume Frau</option>
                    <option value="8">Pere Pons</option>

                </select>
                <input type="submit" value="Enviar">
            </form>
            <br>
            <%

                /*
                Variables que se usaran para la conexion
                y para la realizacion de sentencias
                 */
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                String SQL = null;
                /*
Variable que recogera el value del option
                 */
                String codi = request.getParameter("Alumnos");

                /*
Conexion a la base de datos y realizacion de select
                 */
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/escuela", "root", "");

                    conn.setAutoCommit(false);

                    SQL = "Select * from alumne where codi=" + codi;

                    ps = conn.prepareStatement(SQL, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

                    rs = ps.executeQuery();

                    conn.commit();
                    out.println("<h1 align=\"center\"> Datos Alumno </h1>");
                    out.println("<table border=1 align=\"center\">");
                    out.println("<tr><th>Codi</th><th>Nombre</th></tr>");

                    while (rs.next()) {
                        out.println("<tr><td>" + rs.getString("codi") + "</td><td>" + rs.getString("nom") + "</td></tr>");

                    } // end while
                    out.println("</table>");
                } catch (SQLException exQL) {
                    conn.rollback();
                    out.println("Error SQL: " + exQL.getMessage());
                } catch (Exception ex) {
                    conn.rollback();
                    out.println("Error: " + ex.getMessage());
                } finally {
                    if (rs != null) {
                        rs.close();
                    }
                    if (ps != null) {
                        ps.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } // end try
            %>
            <%
                /*
Conexion a la base de datos y realizacion de select
                 */
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/escuela", "root", "");

                    conn.setAutoCommit(false);

                    SQL = "SELECT DISTINCT assignatura.codi, assignatura.nom FROM assignatura,tutoria,tutoriaalumne,alumne where assignatura.codi = tutoria.codiAssignatura and tutoria.codi = tutoriaalumne.codiTutoria and alumne.codi =" + codi;

                    ps = conn.prepareStatement(SQL, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

                    rs = ps.executeQuery();

                    conn.commit();
                    out.println("<h1 align=\"center\"> Asignaturas Alumno </h1>");
                    out.println("<table border=1 align=\"center\">");
                    out.println("<tr><th>Codi</th><th>Nombre</th></tr>");

                    while (rs.next()) {
                        out.println("<tr><td>" + rs.getString("codi") + "</td><td>" + rs.getString("nom") + "</td></tr>");

                    } // end while
                    out.println("</table>");
                } catch (SQLException exQL) {
                    conn.rollback();
                    out.println("Error SQL: " + exQL.getMessage());
                } catch (Exception ex) {
                    conn.rollback();
                    out.println("Error: " + ex.getMessage());
                } finally {
                    if (rs != null) {
                        rs.close();
                    }
                    if (ps != null) {
                        ps.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } // end try
            %>
            <%
                /*
 Conexion a la base de datos y realizacion de select
                 */
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/escuela", "root", "");

                    conn.setAutoCommit(false);

                    SQL = "SELECT DISTINCT assignatura.nom FROM assignatura,tutoria,tutoriaalumne,alumne where assignatura.codi = tutoria.codiAssignatura and tutoria.codi = tutoriaalumne.codiTutoria and tutoriaalumne.actiu = 1 and alumne.codi =" + codi;

                    ps = conn.prepareStatement(SQL, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

                    rs = ps.executeQuery();

                    conn.commit();
                    out.println("<h1 align=\"center\"> Tutorias Alumno </h1>");
                    out.println("<table border=1 align=\"center\">");
                    out.println("<tr><th>Nombre</th></tr>");

                    while (rs.next()) {
                        out.println("<tr><td>" + rs.getString("nom") + "</td></tr>");

                    } // end while
                    out.println("</table>");
                } catch (SQLException exQL) {
                    conn.rollback();
                    out.println("Error SQL: " + exQL.getMessage());
                } catch (Exception ex) {
                    conn.rollback();
                    out.println("Error: " + ex.getMessage());
                } finally {
                    if (rs != null) {
                        rs.close();
                    }
                    if (ps != null) {
                        ps.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } // end try
            %>
        </div>


    </body>
</html>
