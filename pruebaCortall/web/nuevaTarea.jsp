<%@page import="movies.database.module.databaseHelper"%>

<%@ page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String titulo = request.getParameter("txtTitulo");
    String descripcion = request.getParameter("txtDescripcion");
    String usuario = request.getParameter("txtUsuario");
    String foto = request.getParameter("txtFoto");
    databaseHelper dt = new databaseHelper();
    String mensaje;
    try {

        dt.agregarTarea(titulo, descripcion, usuario);
        mensaje = "Evento añadido exitosamente.";
    } catch (SQLException e) {

        e.printStackTrace();
        mensaje = "Error al añadir el evento: " + e.getMessage();
    }
    dt.Close();
    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
    dispatcher.forward(request, response);


%>