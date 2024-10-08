/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conexion;


import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;




public class dataBase {
    
  

    
  
     Connection conn;
     public dataBase() throws SQLException {
        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/actividad2", "root", "04pollo40");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(dataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     
    public ResultSet getPeliculas() throws SQLException {
     
        Statement statement = conn.createStatement();
        String sql = "SELECT * FROM actividad2.peliculas;"; 
        return statement.executeQuery(sql);
        
        
}

    
    
   
    
    
    
    }
   
    
        


