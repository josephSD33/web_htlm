<%-- 
    Document   : validateLogin
    Created on : 29 oct. 2024, 19:13:04
    Author     : Samuel
--%>

<%@page import="movies.database.module.databaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String txtemail = request.getParameter("txtemail");
    String txtpwd = request.getParameter("txtpwd");
    String path;
    databaseHelper dt = new databaseHelper();

    // Verificar si el email y la contraseña son correctos
    if (dt.validateLogin(txtemail, txtpwd)) {        
        session.setAttribute("email", txtemail);  // Establecer sesión con el email
        path = "/index.jsp";  // Redirigir al home
    } else {
        path = "/login.jsp?error=Incorrect credentials";  // Mostrar error si no es válido
    }

    dt.Close();// Cerrar la conexión a la base de datos
    RequestDispatcher dispatcher = request.getRequestDispatcher(path);
    dispatcher.forward(request, response);  // Redirigir a la página correspondiente
%>
