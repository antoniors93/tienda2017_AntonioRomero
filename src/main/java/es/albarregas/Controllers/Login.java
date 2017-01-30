/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.Controllers;

import es.albarregas.DAO.IClientesDAO;
import es.albarregas.DAO.IDireccionesDAO;
import es.albarregas.DAO.ILineasPedidoDAO;
import es.albarregas.DAO.IPedidosDAO;
import es.albarregas.DAO.IProvinciasDAO;
import es.albarregas.DAO.IPueblosDAO;
import es.albarregas.DAO.IUsuariosDAO;
import es.albarregas.beans.Clientes;
import es.albarregas.beans.Direcciones;
import es.albarregas.beans.Pedido;
import es.albarregas.beans.Pueblos;
import es.albarregas.beans.Usuarios;
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
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
            IUsuariosDAO usr = daof.getUsuarios();
            IClientesDAO clientDao = daof.getClientes();
            IDireccionesDAO dirDao = daof.getDirecciones();
            IPueblosDAO puebloDao = daof.getPueblos();
            IProvinciasDAO provsDao = daof.getProvincias();
            IPedidosDAO pedidoDao = daof.getPedidos();
            ILineasPedidoDAO lineasPedidoDao = daof.getLineasPedidos();

            Usuarios usuario = usr.getUsuarios(request.getParameter("email"), request.getParameter("pass"));
            //buscamos el usuario con el email introducido

            String mensaje = "";
            if (usuario == null) { //si no se ha encontrado un usuario devolvemos un mensaje de error
                mensaje = "FAILURE";
            } else {
                if(usuario.getBloqueado()=='s'){
                    mensaje = "DENIED";
                }else{
                IClientesDAO client = daof.getClientes();
                usr.updateUltimoAcceso(usuario.getIdUsuario());//modificamos ultimo acceso
                Clientes cliente = client.getCliente(usuario.getIdUsuario()); //obtenemos el cliente relacionado con ese usuario
                Pedido pedido = pedidoDao.getPedido(usuario.getIdUsuario()); //obtenemos el pedido del carrito de ese usuario
                ArrayList<Direcciones> direcciones = dirDao.getDirecciones(cliente.getIdCliente()); //obtenemos las direcciones de este cliente

                if (direcciones != null) {//si el usuario tiene direcciones de envío las almacenamos en el cliente
                    for (int i = 0; i < direcciones.size(); i++) {
                        Pueblos pueblo = puebloDao.getNombreCodigoPostal(direcciones.get(i).getIdPueblo());
                        direcciones.get(i).setLocalidad(pueblo.getNombrePueblo());
                        direcciones.get(i).setProvincia(provsDao.getProvincia(pueblo.getIdProvincia()));
                    }
                    cliente.setDirecciones(direcciones);
                }

                HttpSession sesion = request.getSession(true); //almacenamos usuario y cliente en sesion        
                sesion.setAttribute("cliente", cliente);
                sesion.setAttribute("login", usuario);

                if (pedido != null) { //si el usuario tiene algun pedido en el carrito le añadimos las lineas y lo guardamos en sesion
                    pedido.setLineasPedido(lineasPedidoDao.getLineasPedido(pedido.getIdPedido()));
                    sesion.setAttribute("pedido", pedido);
                }
                mensaje = "SUCCESS";
                }
            }
            response.getWriter().write(mensaje);
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
