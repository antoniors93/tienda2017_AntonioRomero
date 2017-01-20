package es.albarregas.daofactory;

import es.albarregas.DAO.CaractsProdDAO;
import es.albarregas.DAO.CategoriasDAO;
import es.albarregas.DAO.ClientesDAO;
import es.albarregas.DAO.ICaractsProdDAO;
import es.albarregas.DAO.ICategoriasDAO;
import es.albarregas.DAO.IClientesDAO;
import es.albarregas.DAO.IImagenesDAO;
import es.albarregas.DAO.ILineasPedidoDAO;
import es.albarregas.DAO.IPedidosDAO;
import es.albarregas.DAO.IProductosDAO;
import es.albarregas.DAO.IUsuariosDAO;
import es.albarregas.DAO.ImagenesDAO;
import es.albarregas.DAO.LineasPedidoDAO;
import es.albarregas.DAO.PedidosDAO;
import es.albarregas.DAO.ProductosDAO;
import es.albarregas.DAO.UsuariosDAO;



public class MySQLDAOFactory extends DAOFactory{

    public IUsuariosDAO getUsuarios() {
        return new UsuariosDAO();
    }

    public IProductosDAO getProductos() {
        return new ProductosDAO();
    }

    public ICategoriasDAO getCategorias() {
        return new CategoriasDAO();
    }

    public ICaractsProdDAO getCaractsProd() {
        return new CaractsProdDAO();
    }
    
    public IImagenesDAO getImagenes() {
        return new ImagenesDAO();
    }
    
    public IClientesDAO getClientes(){
        return new ClientesDAO();
    }
    
    public IPedidosDAO getPedidos(){
        return new PedidosDAO();
    }

    public ILineasPedidoDAO getLineasPedidos() {
        return new LineasPedidoDAO();
    }
    
}
