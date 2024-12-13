
<%@page import="database.base"%>
<%@ page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int id = Integer.parseInt(request.getParameter("Id"));
    float nota = Float.parseFloat(request.getParameter("txtNota")); 
    

    base dt = new base();
    String mensaje;
    try {

        dt.editarNota(id, nota);
        mensaje = "Editado exitosamente.";
    } catch (SQLException e) {

        e.printStackTrace();
        mensaje = "Error al editar: " + e.getMessage();
    }
    dt.Close();
    RequestDispatcher dispatcher = request.getRequestDispatcher("/lista.jsp");
    dispatcher.forward(request, response);


%>