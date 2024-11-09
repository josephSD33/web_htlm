<%-- 
    Document   : favorites
    Created on : 6 nov 2024, 20:36:24
    Author     : USUARIO
--%>
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
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">MoviesApp</a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">

                        <li class="nav-item">

                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Return</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <main class="container mt-5">
            <h2>Your Favorites</h2>
            <div class="row">
                <%
                    String email = request.getParameter("email");
                    databaseHelper ds = new databaseHelper();
                    ResultSet resultset = ds.getFavoriteMovies(email);
                    boolean Vfav = false;
                    while (resultset.next()) {
                     Vfav = true;
                %>

                <div class="card" style="width: 18rem; margin-right: 10px;">
                    <img src="<%= resultset.getString("photo")%>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><%= resultset.getString("title")%></h5>
                        <p class="card-text"><%= resultset.getString("releaseDate")%></p>                            
                    </div>
                    <div class='mb-3'>
                        <button type="submit" onclick=" window.location.href = 'deleteFavoriteMovie.jsp?email=<%=email%>&idMovie=<%=resultset.getInt("id")%>'" class="btn btn-danger">Remove</button>
                    </div> 
                </div>
                <%
                    }
                %>
                <%if (!Vfav) {
                %>
                    <h5 class="card-title">You don't have favorite movies saved</h5>
                <% 
                    }
                %>
                
                
            </div>
    </body>
</html>
