package Base;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class conexion {

    Connection conn;
    private static conexion instancia;/*almacena la única instancia de la clase.*/
    
    /*el constructor private conexion() evita que cualquier otra clase pueda instanciar objetos directamente*/
    private conexion() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/actividad4", "root", "04pollo40");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static conexion getInstancia() throws SQLException {
        if (instancia == null) {
            instancia = new conexion();/*nueva instacia*/
        }
        return instancia;
    }

    public void Close() {
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getTareas() throws SQLException {
        String sql = "SELECT id,titulo AS title, descripcion AS description FROM tareas";
        PreparedStatement preparedStatement = conn.prepareStatement(sql);
        ResultSet resultset = preparedStatement.executeQuery();

        return resultset;
    }

    public void agregarTarea(String titulo, String descripcion) throws SQLException {

        String sql = "INSERT INTO tareas (titulo, descripcion) VALUES (?,?)";

        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, titulo);
            statement.setString(2, descripcion);
            statement.executeUpdate();
        }
    }
}
