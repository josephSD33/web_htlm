/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Api;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.stream.Collectors;
import org.json.JSONObject;


public class ConnApi extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String apiUrl = "https://frasedeldia.azurewebsites.net/api/phrase"; 
       
        
     
        PrintWriter out = response.getWriter();
        
        try {
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            if (conn.getResponseCode() == 200) {
                String jsonResponse = new BufferedReader(new InputStreamReader(conn.getInputStream()))
                        .lines().collect(Collectors.joining("\n"));
                
                
                JSONObject jsonObject = new JSONObject(jsonResponse);
                String phrase = jsonObject.getString("phrase");
                String author = jsonObject.getString("author");

                
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Frase del Día</title>");
                out.println("<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>");
                out.println("</head>");
                out.println("<body class='container mt-5'>");
                out.println("<h1 class='text-center'>Frase del Día</h1>");
                out.println("<div class='card mt-4'>");
                out.println("<div class='card-body'>");
                out.println("<blockquote class='blockquote'>");
                out.println("<p class='mb-0'>\"" + phrase + "\"</p>");
                out.println("<footer class='blockquote-footer'>" + author + "</footer>");
                out.println("</blockquote>");
                out.println("</div>");
                out.println("</div>");
                out.println("</body>");
                out.println("</html>");
            } 
            
        } catch (Exception e) { 
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
