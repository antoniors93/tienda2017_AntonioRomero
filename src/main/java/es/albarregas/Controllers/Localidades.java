/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.Controllers;

import com.google.gson.Gson;
import es.albarregas.DAO.IProvinciasDAO;
import es.albarregas.DAO.IPueblosDAO;
import es.albarregas.beans.Provincias;
import es.albarregas.beans.Pueblos;
import es.albarregas.daofactory.DAOFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Antonio
 */
@WebServlet(name = "Localidades", urlPatterns = {"/Localidades"})
public class Localidades extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            DAOFactory daof = DAOFactory.getDAOFactory(1);
            IProvinciasDAO provsDao = daof.getProvincias();
            IPueblosDAO pueblosDao = daof.getPueblos();
            String json = null;
            
            if (request.getParameter("provs") != null) {
                ArrayList<Provincias> provincias=provsDao.getProvincias();
                json = new Gson().toJson(provincias);
                response.setContentType("application/json");
                response.getWriter().write(json);
            }
            if(request.getParameter("idProvincia")!=null){
                ArrayList<Pueblos> pueblos=pueblosDao.getPueblos(Integer.parseInt(request.getParameter("idProvincia")));
                json = new Gson().toJson(pueblos);
                response.setContentType("application/json");
                response.getWriter().write(json);
            }
            if(request.getParameter("nombrePueblo")!=null){
                ArrayList<Pueblos> pueblos= pueblosDao.getCodigosPostales(request.getParameter("nombrePueblo"));
                json = new Gson().toJson(pueblos);
                response.setContentType("application/json");
                response.getWriter().write(json);
            }                
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
