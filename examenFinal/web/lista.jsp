
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<%@page import="database.base"%>
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
        <title>Estudiantes</title>
    </head>
    <body>
        <%
            base ds = new base();
            ResultSet rsCalif = ds.getCalificaciones();
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Calificaciones</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                    </ul>
                </div>
            </div>
        </nav>
        <main class="container my-4">
            <div class="table-container">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Cedula</th>
                            <th>Nombre</th>
                            <th>Nota</th>
                            <th>Estado</th>
                            <th>Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while (rsCalif.next()) {
                                float nota = rsCalif.getFloat("nota");
                                String estado = "";
                                if (nota < 65) {
                                    estado = "Reprobado";
                                } else if (nota >= 65 && nota < 70) {
                                    estado = "Aplazado";
                                } else if (nota >= 70) {
                                    estado = "Aprobado";
                                }


                        %>

                        <tr>
                            <td><%= rsCalif.getInt("id")%></td>
                            <td><%= rsCalif.getString("cedula")%></td>
                            <td><%= rsCalif.getString("nombre")%></td>
                            <td><%= rsCalif.getFloat("nota")%></td>
                            <th><%=estado%></th>
                            <td>
                                <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#exampleModal<%= rsCalif.getInt("id")%>">
                                    Editar
                                </button>
                            </td>
                        </tr>
                    <div class="modal fade" id="exampleModal<%= rsCalif.getInt("id")%>" tabindex="-1" aria-labelledby="exampleModalLabel<%= rsCalif.getInt("id")%>" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Editar Nota</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="editarNota.jsp" method="POST">
                                        <div class="mb-3">
                                            <label for="txtNota" class="form-label">Nota</label>
                                            <input type="text" class="form-control" id="txtNota<%= rsCalif.getInt("id")%>" name="txtNota" value="<%= rsCalif.getFloat("nota")%>" required>
                                        </div>
                                        <input type="hidden" id="Id" name="Id" value="<%= rsCalif.getInt("id")%>">
                                        <button type="submit" class="btn btn-info">Editar</button>
                                    </form>
                                </div>                    
                            </div>
                        </div>
                    </div>
                    <% }%>
                    </tbody>
                </table>
            </div>
        </main>
    </body>
</html>

