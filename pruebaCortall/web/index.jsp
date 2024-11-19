<%@page import="movies.database.module.databaseHelper"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <style>
            html, body {
                height: 100%;
            }
            body {
                display: flex;
                flex-direction: column;
            }
            main {
                flex-grow: 1;
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>   

        <%
            String msg = request.getParameter("msg");
        %>
        <%
            if (session.getAttribute("email") == null) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp?error=You must log in");
                dispatcher.forward(request, response);
            }

            String email = session.getAttribute("email").toString();

            databaseHelper ds = new databaseHelper();
            ResultSet rsTareas = ds.getTareas();
            ResultSet resultsUser = ds.getUser(email);
            resultsUser.next();
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Tareas</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Welcome <%=resultsUser.getString("firstName")%></a>
                        </li> 
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">Agregar Tarea</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Logout</a>
                        </li>                        

                    </ul>
                </div>
            </div>
        </nav>
        <!-- Modal agregar tarea -->
        <div class="modal fade" id="exampleModal"" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Añadir Nueva Tarea</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body">
                        <form action="nuevaTarea.jsp" method="POST">
                            <div class="mb-3">
                                <label for="txtTitulo" class="form-label">Título de la Tarea</label>
                                <input type="text" class="form-control" id="txtTitulo" name="txtTitulo" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtDescripcion" class="form-label">Descripción</label>
                                <textarea class="form-control" id="txtDescripcion" name="txtDescripcion" rows="3" required></textarea>
                            </div>
                            
                            <div class="mb-3">
                                <label for="txtUsuario" class="form-label">Usuario</label>
                                <input type="text" class="form-control" id="txtUsuario" name="txtUsuario" value="<%=resultsUser.getString("firstName")%>" readonly>
                            </div>
                            <button type="submit" class="btn btn-info">Añadir Tarea</button>
                        </form>        
                    </div>                    
                </div>
            </div>
        </div>



        <main class="container my-4">
            <div class="table-container">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Título</th>
                            <th>Descripción</th>
                            <th>Fecha de Creación</th>
                            <th>Usuario</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                        
                            while (rsTareas.next()) {
                        %>
                        <tr>
                            <td><%= rsTareas.getInt("id")%></td>
                            <td><%= rsTareas.getString("title")%></td>
                            <td><%= rsTareas.getString("description")%></td>
                            <td><%= rsTareas.getTimestamp("creationDate")%></td>
                            <td><%= rsTareas.getString("user")%></td>
                            

                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </main>
        <main class='container mt-5'>

        </main>
        <footer class='bg-primary text-white text-center text-lg-start mt-auto'>
            <div class='container p-4'>
                <div class='row'>
                    <div class='col-lg-6 col-md-12 mb-4 mb-md-0'>
                        <h5 class='text-uppercase'>Tareas Colaborativas </h5>
                        <p>Manage your movies efficiently and easily with our app.</p>
                    </div>
                    <div class='col-lg-6 col-md-12 mb-4 mb-md-0'>
                        <h5 class='text-uppercase'>Links</h5>
                        <ul class='list-unstyled mb-0'>
                            <li><a href='#' class='text-white'>Home</a></li>                            
                            <li><a href='#' class='text-white'>Report</a></li>
                            <li><a href='#' class='text-white'>Settings</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class='text-center p-3' style='background-color: rgba(0, 0, 0, 0.2);'>
                © 2024 | All rights reserved.

            </div>
        </footer>
    </body>
</html>
