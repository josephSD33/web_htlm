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
    String nombre = request.getParameter("txtNombre");
    String descripcion = request.getParameter("txtDescripcion");
    String fecha = request.getParameter("txtFecha");
    String foto = request.getParameter("txtFoto");
    String ubicacion = request.getParameter("txtUbicacion");
    int entradasDisponibles = Integer.parseInt(request.getParameter("txtEntradas"));
    

    Conector dt = new Conector();
    String mensaje;
    try {

        dt.agregarEvento(nombre, descripcion, fecha, foto, ubicacion, entradasDisponibles);
        mensaje = "Evento añadido exitosamente.";
    } catch (SQLException e) {

        e.printStackTrace();
        mensaje = "Error al añadir el evento: " + e.getMessage();
    }
    dt.Close();
    RequestDispatcher dispatcher = request.getRequestDispatcher("/gestionAdmins.jsp");
    dispatcher.forward(request, response);


%>