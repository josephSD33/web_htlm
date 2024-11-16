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
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    String fecha = request.getParameter("fecha");
    String foto = request.getParameter("foto");
    String ubicacion = request.getParameter("ubicacion");
    int entradasDisponibles = Integer.parseInt(request.getParameter("entradas_disponibles"));
    int totalEntradas = entradasDisponibles;

    Conector dt = new Conector();
    String mensaje;
    try {

        dt.editarEvento(id, nombre, descripcion, fecha, foto, ubicacion, totalEntradas, entradasDisponibles);
        mensaje = "Evento añadido exitosamente.";
    } catch (SQLException e) {

        e.printStackTrace();
        mensaje = "Error al añadir el evento: " + e.getMessage();
    }
    dt.Close();
    RequestDispatcher dispatcher = request.getRequestDispatcher("/gestionAdmins.jsp");
    dispatcher.forward(request, response);


%>