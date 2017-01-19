package es.albarregas.daofactory;

import es.albarregas.DAO.ICaractsProdDAO;
import es.albarregas.DAO.ICategoriasDAO;
import es.albarregas.DAO.IClientesDAO;
import es.albarregas.DAO.IImagenesDAO;
import es.albarregas.DAO.IProductosDAO;
import es.albarregas.DAO.IUsuariosDAO;


public abstract class DAOFactory {

    public static final int MYSQL = 1;
    public static final int ORACLE = 2;
    public static final int FICHERO = 3;
    
    public abstract IUsuariosDAO getUsuarios();
    public abstract IProductosDAO getProductos();
    public abstract ICategoriasDAO getCategorias();
    public abstract ICaractsProdDAO getCaractsProd();
    public abstract IImagenesDAO getImagenes();
    public abstract IClientesDAO getClientes();
    
    public static DAOFactory getDAOFactory(int tipo){
        DAOFactory daof = null;
        
        switch(tipo){
            case MYSQL:
                daof = new MySQLDAOFactory();
                break;
        }        
        return daof;
    }
    
}
