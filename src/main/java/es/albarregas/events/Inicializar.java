/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.events;

import es.albarregas.DAO.ICategoriasDAO;
import es.albarregas.DAO.IProductosDAO;
import es.albarregas.beans.Categorias;
import es.albarregas.beans.Productos;
import es.albarregas.daofactory.DAOFactory;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 *
 * @author Antonio
 */
@WebListener
public class Inicializar implements ServletContextListener{

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        DAOFactory daof = DAOFactory.getDAOFactory(1);
        ICategoriasDAO cat =daof.getCategorias();
        IProductosDAO prod = daof.getProductos();
        ArrayList<Categorias> categorias = cat.getCategorias();
        ArrayList<Productos> productos = prod.getProductos();
        ServletContext context = sce.getServletContext();
        synchronized (context){
            context.setAttribute("productos", productos);
            context.setAttribute("categorias", categorias);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        context.removeAttribute("productos");
        context.removeAttribute("categorias");
    }
    
}
