/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Adrian
 */
public class ConexionMysql {

    protected Connection conn;
    protected Statement stmt;
    private String url = "jdbc:mysql://localhost:3306/escuela";
    private String user = "root";
    private String password = "";
/**
 * Metodo que realiza la conexion a la BD y devuelve obj conn
 * y seguidamente llama a la clase TablaMysql para crear tabla
 * @return 
 */
    public Connection doConnection() {
        try {
            conn = DriverManager.getConnection(url, user, password);
            if (conn != null) {
                System.out.println("Conectado a " + conn.toString());
            }
            return conn;
        } catch (SQLException e) {
            System.out.println("Conexión no válida url, usuario o clave incorrecta ");
            //if (e.Number == 18456) { // invalid login
            e.printStackTrace();
            return null;
        }
    }
/**
 * Metodo que cierra la conexion a la bd
 */
    public void closeConnection() {
        try {
            conn.close();
            System.out.println("Conexión cerrada");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Fallo al cerrar la conexión");
        }
    }
    
    public Statement getStmt()
       {
          return this.stmt;
       }
}
