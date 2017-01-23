/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.Controllers;

import es.albarregas.DAO.IClientesDAO;
import es.albarregas.DAO.ICodigoPostalDAO;
import es.albarregas.DAO.IDireccionesDAO;
import es.albarregas.beans.Clientes;
import es.albarregas.beans.Direcciones;
import es.albarregas.daofactory.DAOFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
@WebServlet(name = "ActualizarCliente", urlPatterns = {"/ActualizarCliente"})
public class ActualizarCliente extends HttpServlet {

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
            IClientesDAO clientDao = daof.getClientes();
            IDireccionesDAO dirDao = daof.getDirecciones();
            ICodigoPostalDAO cpDao = daof.getCodigosPostales();
            HttpSession sesion= request.getSession(true);
            Clientes sesionClient=(Clientes)sesion.getAttribute("cliente");
            
            out.println(request.getParameter("datos"));
            
            if(request.getParameter("datos")!=null){
                Clientes cliente=new Clientes();
                cliente.setIdCliente(sesionClient.getIdCliente());
                cliente.setNombre(request.getParameter("nombre"));
                cliente.setApellidos(request.getParameter("apellidos"));
                cliente.setNIF(request.getParameter("nif"));
                cliente.setFechaNacimiento(Date.valueOf(request.getParameter("fechaNac")));
                
                if(!cliente.getNombre().equals(sesionClient.getNombre())||!cliente.getApellidos().equals(sesionClient.getApellidos())||
                   !cliente.getNIF().equals(sesionClient.getNIF())||!cliente.getFechaNacimiento().equals(sesionClient.getFechaNacimiento())){
                    clientDao.updateCliente(cliente);
                    sesion.setAttribute("cliente", cliente);
                }
            }
            if(request.getParameter("direccion")!=null){
                Direcciones direccion = new Direcciones();
                direccion.setNombreDireccion(request.getParameter("nombreDireccion"));
                direccion.setDireccion(request.getParameter("direccion"));
                direccion.setTelefono(request.getParameter("telefono"));
                direccion.setProvincia(request.getParameter("provincia"));
                direccion.setLocalidad(request.getParameter("pueblo"));
                direccion.setIdPueblo(Integer.parseInt(request.getParameter("codigoPostal")));
                direccion.setCodigoPostal(cpDao.getCodigoPostal(direccion.getIdPueblo()));
            }
            response.sendRedirect("JSP/perfilCliente.jsp");
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