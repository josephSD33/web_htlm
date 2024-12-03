<%-- 
    Document   : nuevaTarea
    Created on : 29 nov 2024, 22:16:01
    Author     : USUARIO
--%>

<%@page import="Base.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String titulo = request.getParameter("txtTitulo");
    String descripcion = request.getParameter("txtDescripcion");
    conexion ds = conexion.getInstancia();
    String mensaje;
    try {

        ds.agregarTarea(titulo, descripcion);
        mensaje = "Evento añadido exitosamente.";
    } catch (Exception e) {

        e.printStackTrace();
        mensaje = "Error al añadir el evento: " + e.getMessage();
    }
    
    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
    dispatcher.forward(request, response);


%>
