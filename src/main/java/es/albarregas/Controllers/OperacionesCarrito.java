/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.Controllers;

import es.albarregas.DAO.ILineasPedidoDAO;
import es.albarregas.DAO.IPedidosDAO;
import es.albarregas.beans.Pedido;
import es.albarregas.beans.Usuarios;
import es.albarregas.daofactory.DAOFactory;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "OperacionesCarrito", urlPatterns = {"/OperacionesCarrito"})
public class OperacionesCarrito extends HttpServlet {

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
            ILineasPedidoDAO lineaDao = daof.getLineasPedidos();
            IPedidosDAO pedidoDao = daof.getPedidos();

            HttpSession sesion = request.getSession(true);
            Usuarios usuario = (Usuarios) sesion.getAttribute("login");//obtenemos usuario para saber el Id
            Pedido pedido = (Pedido) sesion.getAttribute("pedido");//obtenemos el pedido que está en el carrito

            //si actualizamos las unidades de una linea de producto
            if (request.getParameter("opcion")!=null) {
                //actualizamos la linea modificada   
                lineaDao.updateLineaPedido(pedido.getIdPedido(), Integer.parseInt(request.getParameter("numLinea")), Integer.parseInt(request.getParameter("cantidad")));
                //añadimos las lineas actualizadas al pedido
                pedido.setLineasPedido(lineaDao.getLineasPedido(pedido.getIdPedido()));

            } else {//si borramos una linea de producto                
                //borramos la linea de pedido seleccionada
                lineaDao.deleteLineaPedido(pedido.getIdPedido(), Integer.parseInt(request.getParameter("numLinea")));
                //añadimos las lineas actualizadas al pedido
                pedido.setLineasPedido(lineaDao.getLineasPedido(pedido.getIdPedido()));
                //obtenemos el nuevo numero de lineas de pedido y lo enviamos
                int lineas = pedido.getLineasPedido().size();
                response.getWriter().write(String.valueOf(lineas));
            }

            //volvemos a almacenar el pedido en sesion
            sesion.setAttribute("pedido", pedido);
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
