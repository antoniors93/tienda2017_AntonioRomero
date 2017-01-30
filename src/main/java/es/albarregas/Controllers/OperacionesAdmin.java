/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.Controllers;

import es.albarregas.DAO.IProductosDAO;
import es.albarregas.DAO.IUsuariosDAO;
import es.albarregas.beans.Productos;
import es.albarregas.daofactory.DAOFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Antonio
 */
@WebServlet(name = "OperacionesAdmin", urlPatterns = {"/OperacionesAdmin"})
public class OperacionesAdmin extends HttpServlet {

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
            IProductosDAO prodDao = daof.getProductos();
            IUsuariosDAO userDao = daof.getUsuarios();
            ServletContext context = getServletContext();
            ArrayList<Productos> productos = (ArrayList)context.getAttribute("productos");
            
            if(request.getParameter("pedir")!=null){
                //si realizamos un pedido de productos bajo stock minimo actualizamos los productos del contexto
                prodDao.pedirProductos(Integer.parseInt(request.getParameter("unidades")));
                context.setAttribute("productos", prodDao.getProductos());
                for(int j=0; j<productos.size();j++){
                        if(productos.get(j).getStock()<productos.get(j).getStockMinimo()){
                            productos.get(j).setStock(productos.get(j).getStock()+Integer.parseInt(request.getParameter("unidades")));
                        }
                    }
                context.setAttribute("productos", productos);
            }
            if(request.getParameter("blockUser")!=null){
                userDao.bloquearUser(request.getParameter("email"),request.getParameter("bloqueado"));
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
