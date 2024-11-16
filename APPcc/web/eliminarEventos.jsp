<%-- 
    Document   : anadirEventos
    Created on : 12 nov 2024, 17:20:30
    Author     : USUARIO
--%>

<%@page import="paquetes.Conector"%>
<%@ page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    
    Conector dt = new Conector();
    String mensaje;
    try {

        dt.eliminarEvento(id);
        mensaje = "Evento eliminado exitosamente.";
    } catch (SQLException e) {

        e.printStackTrace();
        mensaje = "Error al eliminar el evento: " + e.getMessage();
    }
    dt.Close();
    RequestDispatcher dispatcher = request.getRequestDispatcher("/gestionAdmins.jsp");
    dispatcher.forward(request, response);


%>