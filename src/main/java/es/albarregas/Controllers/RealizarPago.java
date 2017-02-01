/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.Controllers;

import es.albarregas.DAO.IPedidosDAO;
import es.albarregas.DAO.IProductosDAO;
import es.albarregas.beans.General;
import es.albarregas.beans.LineaPedido;
import es.albarregas.beans.Pedido;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Antonio
 */
@WebServlet(name = "RealizarPago", urlPatterns = {"/RealizarPago"})
public class RealizarPago extends HttpServlet {

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
            IProductosDAO prodsDao = daof.getProductos();
            HttpSession sesion= request.getSession(true);
            ServletContext context = getServletContext();
            ArrayList<Productos> productos = (ArrayList)context.getAttribute("productos");
            
            
            Pedido pedido=(Pedido)sesion.getAttribute("pedido");
            if(pedido!=null){
            ArrayList<LineaPedido> lineaspedido = pedido.getLineasPedido();

            String estado="r";
            double baseImponible=0;
            for(int i=0; i<lineaspedido.size();i++){//recorremos todas las lineas del pedido para calcular el importe total
                Productos producto = prodsDao.getProducto(lineaspedido.get(i).getIdProducto());
                double precio=producto.getPrecioUnitario();
                baseImponible=baseImponible+precio*lineaspedido.get(i).getCantidad();
                if(producto.getStock()>=lineaspedido.get(i).getCantidad()){   //si hay stock el estado sera r y disminuiremos el stock en la bd               
                    for(int j=0; j<productos.size();j++){//actualizamos los productos del contexto
                        if(productos.get(j).getIdProducto()==lineaspedido.get(i).getIdProducto()){
                            productos.get(j).setStock(productos.get(j).getStock()-lineaspedido.get(i).getCantidad());
                        }
                    }
                    prodsDao.updateStock(producto.getIdProducto(), producto.getStock()-lineaspedido.get(i).getCantidad());
                }else{//si no hay stock el pedido quedara pendiente
                    estado="p";
                }               
            }
            
            //actualizamos el contexto y la base de datos
            context.setAttribute("productos", productos);
            context.setAttribute("masVendidos", prodsDao.getMasVendidos());
            General general=(General)context.getAttribute("general");
            baseImponible=baseImponible+general.getGastosEnvio();
            
            pedidoDao.updatePedido(pedido.getIdPedido(), estado, baseImponible);
            pedido.setBaseImponible(baseImponible);
            pedido.setEstado(estado.charAt(0));
            
            //pasamos el pedido por sesion para mostrar la factura
            sesion.setAttribute("pedido", pedido);
            response.sendRedirect(request.getContextPath()+"/JSP/facturaPedido.jsp?id="+request.getParameter("dirSelect"));
            }else{
                response.sendRedirect(request.getContextPath()+"/JSP/carrito.jsp");
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
