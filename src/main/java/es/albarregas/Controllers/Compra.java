/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.Controllers;

import es.albarregas.DAO.ILineasPedidoDAO;
import es.albarregas.DAO.IPedidosDAO;
import es.albarregas.beans.LineaPedido;
import es.albarregas.beans.Usuarios;
import es.albarregas.beans.Pedido;
import es.albarregas.daofactory.DAOFactory;
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
@WebServlet(name = "Compra", urlPatterns = {"/Compra"})
public class Compra extends HttpServlet {

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
            IPedidosDAO pedidoDao = daof.getPedidos();
            ILineasPedidoDAO lineaDao = daof.getLineasPedidos();
            
            HttpSession sesion= request.getSession(true);
            Usuarios usuario=(Usuarios)sesion.getAttribute("login");
            Pedido pedido=(Pedido)sesion.getAttribute("pedido");            
            int idProducto=Integer.parseInt(request.getParameter("idProducto"));
            
            LineaPedido lineaPedido = new LineaPedido();
            
            if(pedido==null){                
                pedidoDao.insertPedido(usuario.getIdUsuario());
                pedido=pedidoDao.getPedido(usuario.getIdUsuario());
                pedido.setLineasPedido(lineaDao.getLineasPedido(pedido.getIdPedido()));
            }
            
            lineaPedido.setIdPedido(pedido.getIdPedido());
            lineaPedido.setIdProducto(idProducto);
            if(pedido.getLineasPedido().size()==0){
                lineaPedido.setNumeroLinea(1);
            }else{
            lineaPedido.setNumeroLinea(pedido.getLineasPedido().get(pedido.getLineasPedido().size()-1).getNumeroLinea()+1);
            }
            lineaPedido.setCantidad(1);
            lineaDao.insertLineaPedido(lineaPedido);
            pedido.getLineasPedido().add(lineaPedido);
            sesion.setAttribute("pedido", pedido);
            response.getWriter().write(String.valueOf(pedido.getLineasPedido().size()));
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
