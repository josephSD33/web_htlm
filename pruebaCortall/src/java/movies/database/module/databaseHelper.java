/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package movies.database.module;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Samuel
 */

public class databaseHelper {

    Connection conn;

    public void Close() {
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(databaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public databaseHelper() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/tareas", "root", "04pollo40");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(databaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean validateLogin(String txtEmail, String txtPwd) throws SQLException {
        Statement statement = conn.createStatement();
        String sql = "SELECT * FROM tareas.users WHERE email = '" + txtEmail + "' AND pwd = '" + txtPwd + "'";
        ResultSet resultset = statement.executeQuery(sql);
        while (resultset.next()) {
            return true;
        }
        return false;
    }

    public boolean validateEmail(String txtEmail) throws SQLException {
        Statement statement = conn.createStatement();
        String sql = "SELECT * FROM tareas.users WHERE email = '" + txtEmail + "'";
        ResultSet resultset = statement.executeQuery(sql);
        while (resultset.next()) {
            return true;
        }
        return false;
    }

    

    public boolean registerUser(String name, String lastname, String email, String pwd) throws SQLException {
        try {
            Statement statement = conn.createStatement();
            String sql = "INSERT INTO tareas.users(lastname, firstname, email, pwd, creationDate) VALUES ('"
                    + lastname + "', '"
                    + name + "', '"
                    + email + "', '"
                    + pwd + "', CURDATE());";
            statement.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            return false;
        }
    }
    public ResultSet getTareas() throws SQLException {
    String sql = "SELECT id, titulo AS title, descripcion AS description, creationDate, usuario AS user FROM tareas";
    PreparedStatement preparedStatement = conn.prepareStatement(sql);
    ResultSet resultset = preparedStatement.executeQuery();

    return resultset;
}
    public ResultSet getUser(String email) throws SQLException {
        Statement statement = conn.createStatement();
        String sql = "SELECT "
                + "m.firstName, "
                + "m.lastName "
                + "FROM tareas.users m "
                + "WHERE m.email = '" + email + "';";

        ResultSet resultset = statement.executeQuery(sql);
        return resultset;
    }
    
    
    public void agregarTarea(String titulo, String descripcion, String usuario) throws SQLException {
    
    String sql = "INSERT INTO tareas (titulo, descripcion,creationDate, usuario) VALUES (?,?,curdate(), ?)";

    try (PreparedStatement statement = conn.prepareStatement(sql)) {
        statement.setString(1, titulo);
        statement.setString(2, descripcion);
        statement.setString(3, usuario);

        
        statement.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
        throw e;  
    }
}
}
 



    

    

    

    

//
//    public boolean saveExpense(Expense expense) {
//        try {
//            Statement statement = conn.createStatement();
//            String sql = "INSERT INTO expenses (idUser, description, amount, creationDate) VALUES (" + expense.userId + ", '"
//                    + expense.description + "', "
//                    + expense.amount + ", CURDATE());";
//            statement.executeUpdate(sql);
//
//            return true;
//        } catch (SQLException ex) {
//            return false;
//        }
//    }
//
//    public boolean updateExpense(int id, String desc, float amount) {
//        try {
//            Statement statement = conn.createStatement();
//            String sql = "UPDATE expenses SET description = '" + desc + "', amount = " + amount + " WHERE id = " + id + ";";
//            statement.executeUpdate(sql);
//
//            return true;
//        } catch (SQLException ex) {
//            return false;
//        }
//    }
//
//     public boolean deleteExpense(int id) {
//        try {
//            Statement statement = conn.createStatement();
//            String sql = "DELETE FROM expenses WHERE id = " + id + ";";
//            statement.executeUpdate(sql);
//
//            return true;
//        } catch (SQLException ex) {
//            return false;
//        }
//    }
//    
//    public User getUser(String email) throws SQLException {
//        Statement statement = conn.createStatement();
//        String sql = "SELECT * FROM expensesdatabase.users WHERE email = '" + email + "'";
//        ResultSet resultset = statement.executeQuery(sql);
//        while (resultset.next()) {
//            User user = new User(
//                    resultset.getInt("id"),
//                    resultset.getString("lastname"),
//                    resultset.getString("firstname"),
//                    resultset.getString("email")
//            );
//
//            return user;
//        }
//
//        return null;
//    }

