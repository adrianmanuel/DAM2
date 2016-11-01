
import java.sql.ResultSet;
import java.util.Vector;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author adrian2
 */
public class DatosAlumnos extends ConexionMysql {
    private String codigoAlumno;
    private String nombreAlumno;
    private ResultSet resultado;
    Vector vectorAlumnos = null;

    public String getCodigoAlumno() {
        return codigoAlumno;
    }

    public void setCodigoAlumno(String codigoAlumno) {
        this.codigoAlumno = codigoAlumno;
    }

    public String getNombreAlumno() {
        return nombreAlumno;
    }

    public void setNombreAlumno(String nombreAlumno) {
        this.nombreAlumno = nombreAlumno;
    }

    public ResultSet getResultado() {
        return resultado;
    }

    public void setResultado(ResultSet resultado) {
        this.resultado = resultado;
    }

    public DatosAlumnos() {
        doConnection();
    }
    
    public ResultSet BuscarAlumno(String Codigo) throws Exception
    {   try{
             getStmt();
	     resultado= stmt.executeQuery("SELECT * FROM ALUMNE WHERE CODI=" + Codigo);
               while(resultado.next()){
                   DatosAlumnos da = new DatosAlumnos();
                   da.setCodigoAlumno(resultado.getString("codi"));
                   da.setNombreAlumno(resultado.getString("nom"));
                   vectorAlumnos.addElement(da);
               }
             } catch (Exception ex){
           System.err.println("SQLException: " + ex.getMessage());
        }
    return resultado;
    }
    
    
}
