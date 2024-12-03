<%-- 
    Document   : anadirEventos
    Created on : 12 nov 2024, 17:20:30
    Author     : USUARIO
--%>

<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String nombre = request.getParameter("txtNombre");
    String descripcion = request.getParameter("txtDescripcion");
    String fecha = request.getParameter("txtFecha");
    String foto = request.getParameter("txtFoto");
    String ubicacion = request.getParameter("txtUbicacion");
    int entradasDisponibles = Integer.parseInt(request.getParameter("txtEntradas"));
    
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String dbUrl = "jdbc:mysql://localhost:3306/reservasdatabaseweb";
    String dbUser = "root";
    String dbPassword = "04pollo40";


    try {
// Establecer la conexión con la base de datos
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

     
    String sql = "INSERT INTO Eventos (nombre, descripcion, fecha, foto, ubicacion, entradas_disponibles) VALUES (?, ?, ?, ?, ?, ?)";
    try (PreparedStatement statement = conn.prepareStatement(sql)) {
        statement.setString(1, nombre);
        statement.setString(2, descripcion);
        statement.setString(3, fecha);
        statement.setString(4, foto);
        statement.setString(5, ubicacion);
        
        // Establecer las entradas disponibles
        statement.setInt(6, entradasDisponibles);

        statement.executeUpdate();
    
    
                    out.println("<body style='margin: 0; padding: 0; background: linear-gradient(to right, #6a11cb, #2575fc); color: white; font-family: Arial, sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh;'>");
            out.println("<div style='text-align: center; padding: 30px; border-radius: 10px; background-color: rgba(255, 255, 255, 0.2); max-width: 600px;'>");
            out.println("<h3 style='font-size: 2rem; margin-bottom: 20px;'> Evento agregado con exito </h3>");
            out.println("<a href='gestionAdmins.jsp' style='display: inline-block; padding: 10px 20px; border: 2px solid white; border-radius: 5px; background-color: transparent; color: white; font-size: 1.5rem; text-decoration: none; cursor: pointer;'>Volver a eventos</a>");
            out.println("</div>");
            out.println("</body>");
    
        }
   
    } catch (SQLException e) {

        e.printStackTrace();
        out.println("<p style='color: red;'>Error al agregar el nuevo evento.</p>");
    }
   finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

%>


