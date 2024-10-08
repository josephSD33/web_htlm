
package webpeliculas;

import conexion.dataBase;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet(name = "recomendacion", urlPatterns = {"/recomendacion"})
public class recomendacion extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
   
        try (PrintWriter out = response.getWriter()) {
            dataBase db = new dataBase();
            ResultSet resultset = db.getPeliculas(); 
            
    
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet recomendacion</title>");
            out.println("<link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' rel='stylesheet'>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='container mt-5'>");
            
            while (resultset.next()) {
                String nombre = resultset.getString("nombre");
                String anno = resultset.getString("anno");
                String duracion = resultset.getString("duracion");
                String calificacion = resultset.getString("calificacion");
                out.println("<div class='row mb-3'>");
                out.println("    <div class='col'>");
                out.println("        <div class='card'>");
                out.println("            <div class='card-body'>");
                out.println("                <h5 class='card-title'>" + nombre + "</h5>");
                out.println("                <h6 class='card-subtitle mb-2 text-muted'>" + anno + "</h6>");
                out.println("                <p class='card-text'>Duración: " + duracion + "</p>");
                out.println("                <p class='card-text'>Calificación: " + calificacion + "</p>");
                out.println("            </div>");
                out.println("        </div>");
                out.println("    </div>");
                out.println("</div>");
            }
            out.println("</div>"); 
            out.println("</body>");
            out.println("</html>");
            
            
             
        } catch (SQLException ex) {
            Logger.getLogger(recomendacion.class.getName()).log(Level.SEVERE, null, ex);
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
