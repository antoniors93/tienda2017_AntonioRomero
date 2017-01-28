/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.Controllers;

import es.albarregas.DAO.IClientesDAO;
import es.albarregas.DAO.IDireccionesDAO;
import es.albarregas.DAO.IProvinciasDAO;
import es.albarregas.DAO.IPueblosDAO;
import es.albarregas.DAO.IUsuariosDAO;
import es.albarregas.beans.Clientes;
import es.albarregas.beans.Direcciones;
import es.albarregas.beans.Pueblos;
import es.albarregas.daofactory.DAOFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
            IUsuariosDAO userDao = daof.getUsuarios();
            IClientesDAO clientDao = daof.getClientes();
            IDireccionesDAO dirDao = daof.getDirecciones();
            IPueblosDAO puebloDao = daof.getPueblos();
            IProvinciasDAO provsDao = daof.getProvincias();
            HttpSession sesion= request.getSession(true);
            Clientes sesionClient=(Clientes)sesion.getAttribute("cliente");
            
            
            if(request.getParameter("datos")!=null){ //si modificamos los datos del cliente
                //recogemos los datos del formulario
                Clientes cliente=new Clientes();
                cliente.setIdCliente(sesionClient.getIdCliente());
                cliente.setNombre(request.getParameter("nombre"));
                cliente.setApellidos(request.getParameter("apellidos"));
                cliente.setNIF(request.getParameter("nif"));
                cliente.setFechaNacimiento(Date.valueOf(request.getParameter("fechaNac")));
                //si algun campo ha cambiado, actualizamos
                if(!cliente.getNombre().equals(sesionClient.getNombre())||!cliente.getApellidos().equals(sesionClient.getApellidos())||
                   !cliente.getNIF().equals(sesionClient.getNIF())||!cliente.getFechaNacimiento().equals(sesionClient.getFechaNacimiento())){
                    clientDao.updateCliente(cliente);
                    sesion.setAttribute("cliente", cliente);
                }
                response.sendRedirect(request.getContextPath()+"/JSP/actualizarCliente.jsp");
            }
            
            if(request.getParameter("direccion")!=null){//cuando añadimos una direccion
                Direcciones direccion = new Direcciones();
                //recogemos los datos del formulario
                direccion.setIdCliente(sesionClient.getIdCliente());
                direccion.setNombreDireccion(request.getParameter("nombreDireccion"));
                direccion.setDireccion(request.getParameter("direccion"));
                direccion.setTelefono(request.getParameter("telefono"));
                direccion.setIdPueblo(Integer.parseInt(request.getParameter("codigoPostal")));
                
                direccion.setProvincia(provsDao.getProvincia(Integer.parseInt(request.getParameter("provincia"))));
                Pueblos pueblo=puebloDao.getNombreCodigoPostal(direccion.getIdPueblo());
                direccion.setLocalidad(pueblo.getNombrePueblo());
                direccion.setCodigoPostal(pueblo.getCodigoPostal());
                direccion.setIdDireccion(dirDao.getIdDireccion()+1);
                
                ArrayList<Direcciones> direcciones=dirDao.getDirecciones(sesionClient.getIdCliente());
                
                if(direcciones==null){      //si no hay direcciones creamos un arraylist nuevo para almacenar en sesion                                 
                    direcciones = new ArrayList();
                    direcciones.add(direccion);
                    sesionClient.setDirecciones(direcciones);
                    sesion.setAttribute("cliente", sesionClient);
                }else{ //si ya hay direcciones añadimos la nueva y actualizamos la sesion
                    for(int i=0; i<direcciones.size();i++){
                        pueblo=puebloDao.getNombreCodigoPostal(direcciones.get(i).getIdPueblo());
                        direcciones.get(i).setLocalidad(pueblo.getNombrePueblo());
                        direcciones.get(i).setProvincia(provsDao.getProvincia(pueblo.getIdProvincia()));
                    }
                    direcciones.add(direccion);
                    sesionClient.setDirecciones(direcciones);
                    sesion.setAttribute("cliente", sesionClient);
                }
                dirDao.insertarDireccion(direccion);
                response.sendRedirect(request.getContextPath()+"/JSP/perfilCliente.jsp");
            }
            
            if(request.getParameter("pass1")!=null){//cuando cambiamos la password
                userDao.updatePassword(sesionClient.getIdCliente(), request.getParameter("pass1"));
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
