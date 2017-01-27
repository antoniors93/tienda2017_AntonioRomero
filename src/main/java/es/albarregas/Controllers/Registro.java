/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.Controllers;

import es.albarregas.DAO.IClientesDAO;
import es.albarregas.DAO.IUsuariosDAO;
import es.albarregas.beans.Clientes;
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
@WebServlet(name = "Registro", urlPatterns = {"/Registro"})
public class Registro extends HttpServlet {

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
            IUsuariosDAO usersDao = daof.getUsuarios();
            IClientesDAO clientDao = daof.getClientes();
            String mensaje="INCOMPLETE"; 
            
            if(request.getParameter("email")!=""&&request.getParameter("pass")!=""){ // si hay campos vacios devolvemos el mensaje INCOMPLETE
                if(request.getParameter("email").matches("^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\\.[a-zA-Z]{2,4}$")){
                    //si el email es valido lo insertamos en la base de datos y recibimos una respuesta(SUCCESS o FAILURE) que almacenamos en mensaje
                    mensaje=usersDao.insertUsuario(request.getParameter("email"), request.getParameter("pass"));                   
                }else{//si el email no es valido devolvemos un mensaje
                    mensaje="FORMAT";
                }
            
            if(mensaje.equalsIgnoreCase("SUCCESS")){ //si la insercion ha sido correcta(si la insercion ha fallado devolvemos el mensaje FAILURE)
                //obtenemos el usuario
                Usuarios usuario=usersDao.getUsuarios(request.getParameter("email"),request.getParameter("pass"));
                //creamos un cliente (vacio) y lo obtenemos
                clientDao.insertCliente(usuario.getIdUsuario());
                Clientes cliente=clientDao.getCliente(usuario.getIdUsuario());
                //almacenamos cliente y usuario en sesion
                HttpSession sesion= request.getSession(true);
                sesion.setAttribute("login", usuario);
                sesion.setAttribute("cliente", cliente);
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
