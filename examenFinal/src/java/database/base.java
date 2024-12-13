package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class base {

    Connection conn;

    public void Close() {
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(base.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public base() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/estudiantes", "root", "04pollo40");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(base.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getCalificaciones() throws SQLException {
        String sql = "SELECT id, cedula, nombre, nota FROM calificaciones";
        PreparedStatement preparedStatement = conn.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();

        return resultSet;
    }

    public void editarNota(int id, float nota) throws SQLException {
        String sql = "UPDATE calificaciones SET nota = ? WHERE id = ?";
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setFloat(1, nota);
            statement.setInt(2, id); 
            statement.executeUpdate();
        }
    }

}
