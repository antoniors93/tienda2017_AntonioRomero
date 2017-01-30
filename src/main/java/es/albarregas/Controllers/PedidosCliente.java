/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.Controllers;

import es.albarregas.DAO.ILineasPedidoDAO;
import es.albarregas.DAO.IPedidosDAO;
import es.albarregas.beans.Clientes;
import es.albarregas.daofactory.DAOFactory;
import es.albarregas.beans.Pedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Antonio
 */
@WebServlet(name = "PedidosCliente", urlPatterns = {"/PedidosCliente"})
public class PedidosCliente extends HttpServlet {

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
            HttpSession sesion= request.getSession(true);
            IPedidosDAO pedidoDao = daof.getPedidos();
            ILineasPedidoDAO lineaDao = daof.getLineasPedidos();
            
            //pasamos por atributo todos los pedidos de un determinado cliente
            Clientes cliente = (Clientes) sesion.getAttribute("cliente");
            ArrayList<Pedido> pedidos=pedidoDao.getPedidos(cliente.getIdCliente());
            for(int i=0; i<pedidos.size();i++){
                pedidos.get(i).setLineasPedido(lineaDao.getLineasPedido(pedidos.get(i).getIdPedido()));
            }
            
            request.setAttribute("est", request.getAttribute("estado"));
            request.setAttribute("pedidos", pedidos);
            request.getRequestDispatcher("/JSP/comprasCliente.jsp").forward(request, response);
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
